const sessionUtils = require('../models/sessions');
const usersUtils = require('../models/users');
const auditTrailUtils = require('../models/auditTrail')
const Helper = require('../helpers/helper');
const { roles, isUserPermitted } = require('../helpers/roles');
const uuidv4 = require('uuid/v4');
const speakeasy = require('speakeasy');
const QRCode = require('qrcode');
const validator = require('validator');
const authMiddleware = require('../middleware/Auth');
const processEnv = process.env;

/**
 * User logout, session destroy
 * @param req
 * @param res
 * @return {any | Promise<any>}
 */
exports.user_logout = function (req, res) {
    try {
        let username = req.session.user.username ;
        let today = new Date();
        today.setHours(today.getHours() + 3);
        let logOutTrail = {id:uuidv4(), date: today , data: '' , path: 'auth/logout' ,username: username, method: 'post'} ;
        let trail = {uniqueId : logOutTrail } ;
        auditTrailUtils.createAuditTrail(trail).then(response => {
            console.log(response) ;
            req.session.destroy();
            return res.status(200).json({'message': 'Logout'});
        }).catch(err => {
            console.log(err)
            res.status(500).send()
        });

    } catch (error) {
        res.status(500).send()
    }
};

exports.healthCheck = function (req, res) {
    try {
        return res.status(200).json({'HealthCheck': 'Customer Portal App is up and running'});
    } catch (error) {
        res.status(500).send()
    }
};

/**
 * User logs in with email, password and token(number from google auth. application)
 * @param req
 * @param {string} req.body.email
 * @param {string} req.body.password
 * @param {string} req.body.token
 * @param res
 * @return {any | Promise<any>}
 */
exports.user_login = function (req, res) {
    //from user input we get email, password, token... we get tempSecret from DB
    const {email, password, token} = req.body
    if(!token){
        return res.status(200).json({'message': 'Missing token' , 'errorClass' : 'token'});
    }
    if(!password){
        return res.status(200).json({'message': 'Missing password' , 'errorClass' : 'password'});
    }
    if(!email){
        return res.status(200).json({'message': 'Missing email' , 'errorClass' : 'email'});
    }
    if (validator.isEmpty(email) || validator.isEmpty(password) || validator.isEmpty(token)) {
        return res.status(200).json({'message': 'Some values are missing'});
    }

    if (!validator.isEmail(email)) {
        return res.status(200).json({'message': 'Please enter a valid email address' , 'error-class' : 'email'});
    }

    usersUtils.getUserByEmail(email).then(user => {
        if (!user) return res.send({"status": 200, "message": " User doesn't exist"});
        if (!Helper.comparePassword(user.password, password)) {
            return res.status(200).json({'message': 'The credentials you provided are incorrect'});
        }
        return user
    }).then(user => {
        if (!user) return res.status(200).json({'message': "User doesn't exist"});
        if (!user.secret || !user.verified) return res.status(200).json({'message': 'User is not verified please try again'});

        if (user.role == 'superAdmin') {
            req.session.user = user
            const jwttoken = Helper.generateToken({
                id: user.id,
                userRole: user.role,
                name: user.name,
                email: user.email
            });
            res.status(200).json({token: jwttoken})
        } else {
            const decrypted = Helper.encryptXor(user.secret.padEnd(64), password.padEnd(64)).trim()

            //using req.session.tfa.tempSecret saved from login function
            let isVerified = speakeasy.totp.verify({
                secret: decrypted,
                encoding: 'base32',
                token: token
            });

            if (!isVerified) {
                return res.status(200).json({'message': 'Invalid access token  please try again'});
            }
            //generate session for user
            req.session.user = user
            //generate jwt and return as json
            const jwttoken = Helper.generateToken({
                id: user.id,
                userRole: user.role,
                name: user.name,
                email: user.email
            });
            res.status(200).json({token: jwttoken})
        }

    })
};

/**
 * Get request
 * User clicks on this link from email and as response he gets message, tempSecret
 *
 * Url looks like: /register?registration=SOME_RANDOM_NUMBER_1
 * @param req
 * @param {string} req.query.registration_number
 * @param res
 * @return {any | Promise<any>}
 */
exports.registration_get = function (req, res) {
    const reg = req.query.registration_number;
    if (!req) {
        return res.status(404).json({'message': 'Invalid parameter'});
    }

    if (validator.isEmpty(reg)) {
        return res.status(404).json({'message': 'Empty parameter'});
    }

    const uuidRegExp = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

    if (!uuidRegExp.test(reg)) {
        return res.status(404).json({'message': 'Invalid parameter match'});
    }

    usersUtils.getUserByPropertyValue('registration_number', reg).then(user => {
        if (!user) {
            return res.status(404).json({'message': 'Invalid user match'})
        }

        //here is login process after user clicked in email and we found that number here
        const secret = speakeasy.generateSecret({
            length: 64
        });
        const url = speakeasy.otpauthURL({
            secret: secret.base32,
            label: user.email,
            issuer: 'xportal Auth v1.0',
            encoding: 'base32'
        });
        QRCode.toDataURL(url, (err, dataURL) => {
            return res.json({
                message: 'TFA Auth needs to be verified',
                tempSecret: secret.base32,
                dataURL: dataURL,
                tfaURL: secret.otpauth_url
            });
        });
    })
}

/**
 * User finishes registration by entering
 * token(number from google anth. app), password, tempSecret and registration_number (from previous GET request)
 * Url looks like:  /register?registration=SOME_RANDOM_NUMBER_1 with body parameters described below
 * POST request
 * @param req
 * @param {string} req.body.token
 * @param {string} req.body.password
 * @param {string} req.body.tempSecret
 * @param {string} req.query.registration_number
 * @param res
 * @return {any | Promise<any>}
 */
exports.registration_post = function (req, res) {
    console.log('DEBUG: Received TFA Verify request');
    //token from 2fa scan, and password from input
    const {token, password, tempSecret} = req.body;
    const {registration_number} = req.query;

    if (!tempSecret) {
        return res.status(200).json({"message": "Invalid Request, missing secret"});
    }

    if ( validator.isEmpty(password)) {
        return res.status(200).json({'message': 'Missing password' , 'errorClass' : 'password'});
    }

    if ( validator.isEmpty(token)) {
        return res.status(200).json({'message': 'Missing token' , 'errorClass' : 'token'});
    }

    if (validator.isEmpty(tempSecret)  || validator.isEmpty(registration_number)) {
        return res.status(200).json({
            "message": "Invalid Request, missing parameters"
        });
    }
    //using req.session.tfa.tempSecret saved from login function
    let isVerified = speakeasy.totp.verify({
        secret: tempSecret,
        encoding: 'base32',
        token: token
    });

    if (isVerified) {
        console.log('DEBUG: TFA is verified to be enabled');
        usersUtils.getUserByPropertyValue('registration_number', registration_number).then(user => {
            if (!user) return res.status(403).json({"message": "Invalid registration number"});
            return user
        }).then(user => {
            const userSecret = Helper.encryptXor(tempSecret.padEnd(64), password.padEnd(64))
            return usersUtils.updateUser(user.id, {
                verified: true,
                password: Helper.hashPassword(password),
                secret: userSecret
            }).then(updated => {
                if (updated) {
                    const token = Helper.generateToken({
                        id: user.id,
                        userRole: user.role,
                        name: user.name,
                        email: user.email
                    });
                    return res.status(200).json({token: token})
                }
            })
        }).catch(err => {
            return res.status(200).json({'message': 'Invalid access token  please try again'});
        })
    } else {
        console.log('ERROR: TFA is verified to be wrong');
        return res.status(200).json({'message': 'Invalid access token  please try again'});
    }
}

/**
 * Admin reset password
 * @param req
 * @param {string} req.body.userId
 * @param res
 */
exports.reset_password = function (req, res) {

    const userId = req.params.userId || req.body.userId
    //none existant
    if (!userId) {
        return res.status(403).json({"message": "Invalid Request, missing userId"});
    }
    //existant and empty param
    if (validator.isEmpty(userId)) {
        return res.status(403).json({"message": "Invalid Request, missing userId"});
    }

    //first check if user exists
    return usersUtils.getUserById(userId).then(user => {
        if (!user) return res.status(403).json({"message": "Invalid user in request"});
        return user
    }).then(user => {
        //if user is found
        //console.log('found user:', user)
        return usersUtils.updateUser(user.id, {
            verified: false,
            registration_number: uuidv4()
        }).then(updated => {
            //console.log('updated user:', user, '  >> ', updated)
            //for some reason we needed to get user again here because uuid didnt change in user context scope
            usersUtils.getUserById(user.id).then(newUser => {
                return Helper.sendEmail(newUser.email, {
                    template: 'reset_password',
                    subject: 'Forgot Your Password?',
                    registration_number: newUser.registration_number,
                    homeLink: processEnv.FRONT_APP_DOMAIN || ''
                }, undefined).then(sentMail => {
                    return res.status(201).json({message: 'User created and email sent'});
                })
            })
        })
    }).catch(err => {
        return res.status(403).json({
            "message": "Invalid request " + err
        });
    })
}

/**
 * Check for a single permission where user trying to access a VUE resource page
 * @param req
 * @param res
 * @returns {Promise|*|Knex.ColumnBuilder|Promise<any>}
 */
exports.is_user_permitted = function(req, res){
    const page = req.query.page;
    return res.status(200).json(isUserPermitted('create',page,req)) ;
}