const jwt = require('jsonwebtoken');
const users = require('../models/users');
const speakeasy = require('speakeasy');

/**
 * Authorisation middleware functions
 */
const Auth = {

    /**
     * Function used for middleware after login, to check if user exist for that token
     * @param req
     * @param res
     * @param next
     * @returns {Promise<any | Promise<any>>}
     */
    async verifyUserToken(req, res, next) {
        const token = req.headers['x-access-token'];
        if (!token) {
            return res.status(401).json({'message': 'Token is not provided'});
        }
        try {
            const decoded = await jwt.verify(token, process.env.SECRET);
            //when used generateToken, it returns object with userId
            if (!decoded.userId) {
                return res.status(401).json({'message': 'The token you provided is invalid'});
            }
            //check if user is found by that userId?
            const row = await users.getUserById(decoded.userId)
            //added extra check for reset password feature
            if (!row && !row.verified) {
                res.status(401).json({'message': 'The user does\'nt exist for token you provided or not verified'});
            }
            //save decoded token in req as user object
            req.session.user = {
                id: decoded.userId,
                role: row.role,
                verified:row.verified,
                username: decoded.email
            };

            next();
        } catch (error) {
            return res.status(401).json(error);
        }
    },

    /**
     *
     * @param req
     * @param res
     * @param next
     */
    async allowIfLoggedIn(req, res, next) {
        try {
            const user = req.session && req.session.user && req.session.user.verified;
            if (!user) {
                res.status(401).json({
                    message: "You need to be logged in and verified to access this route"
                });
            }
            next();
        } catch (error) {
            next(error);
        }
    },

    /**
     * After login we should check for TFA.
     * 1. when we login, we get token in return
     * 2. After that we use token to check in jwt, is it valid, since it has expire period
     * 3. after that jwt is checked against existing user in database
     * 4. after that we should check for TFA in request
     *
     * //TODO session for this...
     *
     * @summary verifies req.headers['x-tfa']
     * @param req
     * @param res
     * @param next
     */
    async verifyTFA(req, res, next) {
        const token = req.headers['x-tfa'];
        if (!token) {
            return res.status(206).json({"message": "Please enter the Auth Code"});
        }

        let isVerified = speakeasy.totp.verify({
            secret: req.tfa.secret || req.session.user.tfa.secret,
            encoding: 'base32',
            token: token
        });

        if (!isVerified) {
            console.log('ERROR: Invalid AUTH code');
            delete req.session.user.tfa
            delete req.tfa
            return res.status(206).json({
                "message": "Invalid Auth Code"
            });
        } else {
            console.log('DEBUG: Login with TFA is verified to be successful');
            req.session.user.tfa = {
                isVerified: isVerified,
                token: token,
                secret: req.tfa.secret
            }
            next();
        }
    },
    /**
     * Verify Token
     * @param {object} req
     * @param {object} res
     * @param {object} next
     * @returns {object|void} response object
     */
    async verifyToken(req, res, next) {
        const token = req.headers['x-access-token'];
        if (!token) {
            return res.status(401).json({'message': 'Token is not provided'});
        }
        try {
            const decoded = await jwt.verify(token, process.env.SECRET);
            //when used generateToken, it returns object with userId
            if (!decoded.userId) {
                return res.status(401).json({'message': 'The token you provided is invalid'});
            }
            //save decoded token in req as user object
            req.session.user = {
                id: decoded.userId,
            };
            next();
        } catch (error) {
            return res.status(400).json(error);
        }
    },
}

module.exports = Auth
