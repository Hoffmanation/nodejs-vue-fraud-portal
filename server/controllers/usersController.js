const usersUtils = require('../models/users');
const helpers = require('../helpers/helper');
const uuidv4 = require('uuid/v4');
const validator = require("validator");
const processEnv = process.env;

const validationError = (req, res) => {
    if (validator.isEmpty(req.body.email)) {
        return res.status(400).json({'message': 'Some values are missing'});
    }

    if (!validator.isEmail(req.body.email)) {
        return res.status(400).json({'message': 'Please enter a valid email address'});
    }
}

/**
 * Admin gets users by filters, sort, pagination
 * @param req
 * @param req.query
 * @param req.query.filters
 * @param req.query.sort
 * @param req.query.perPage=10
 * @param req.query.currentPage=1
 * @param res
 */
exports.admin_users = function (req, res) {

    const query = req.query;
    const filters = req.query.filters;
    const ranges = req.query.ranges;
    const sort = req.query.sort;

    const pagination = {
        perPage: query.perPage || 10,
        currentPage: query.currentPage || 1
    }
    const parsedFilters = helpers.parseUrl(filters);
    const parsedSort = helpers.parseUrl(sort);
    const parsedRangesFilters = helpers.parseUrl(ranges);

    const groupedFilters = helpers.groupBy(parsedFilters, 'filterName');


    const users = usersUtils.getUsers(groupedFilters, parsedSort, pagination, parsedRangesFilters).then(data => {
        return res.json(data);
    }).catch(e => {
        return res.status(404).json(e)
    })
};

//delete users - DELETE
/**
 * Admin deletes user by userId
 * @param req
 * @param {string} req.body.userId
 * @param res
 * @return {any | Promise<any>}
 */
exports.admin_users_delete = function (req, res) {
    const userId = req.params.userId || req.body.userId

    if (!userId) {
        return res.status(400).json({'message': 'Some values are missing'});
    }
    usersUtils.deleteUser(userId).then(success => {
        return res.status(200).json({'message': 'deleted'});
    }).catch(e => {
        return res.status(404).json(e);
    })
}

/**
 * Admin get details for userId
 * @param req
 * @param {string} req.body.userId
 * @param res
 * @return {any | Promise<any>}
 */
exports.admin_users_details = function (req, res) {
    const {userId} = req.body
    if (!userId) {
        return res.status(400).json({'message': 'Some values are missing'});
    }
    usersUtils.getUserById(userId).then(success => {
        return res.status(200).json(success);
    }).catch(e => {
        return res.status(404).json(e);
    })
}

/**
 * Admin updates users on PUT request
 * @param req
 * @param {string} req.body.userId
 * @param {string} req.body.password
 * @param {string} req.body.email
 * @param res
 * @return {any | Promise<any>}
 */
exports.admin_users_update = function (req, res) {
    const {password, email, name, role} = req.body
    const userId = req.params.userId || req.body.userId
    if (!userId) {
        return res.status(400).json({'message': 'Missing userId'});
    }

    validationError(req, res)

    const values = {
        role: role,
        name: name,
        email: email,
        updated_at: new Date().toISOString()
    };
    if (password) {
        values.password = helpers.hashPassword(password);
    }
    usersUtils.getUserById(userId).then(user => {
        return usersUtils.updateUser(user.id, values).then(success => {
            return res.status(200).json({'message': 'User updated'});
        }).catch(e => {
            return res.status(404).json(e);
        })
    }).catch(e => {
        return res.status(404).json(e);
    })
}


/**
 * Admin creates users
 * @param req
 * @param {string} req.body.email
 * @param {string} req.body.password
 * @param {string} req.body.role
 * @param res
 * @return {any | Promise<any>}
 */
exports.admin_users_create = function (req, res) {
    const {email, name} = req.body
    const password = req.body.password
    const role = req.body.role || 'analyst'

    if (!email) {
        return res.status(400).json({'message': 'Missing email'});
    }

    if (validator.isEmpty(email)) {
        return res.status(400).json({'message': 'Empty email'});
    }

    if (!validator.isEmail(email)) {
        return res.status(400).json({'message': 'Please enter a valid email address'});
    }


    const values = {
        id: uuidv4(),
        email: email,
        name: name || email,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
        role: role,
        registration_number: uuidv4()
    };

    if (password) {
        values.password = helpers.hashPassword(password)
    }

    usersUtils.createUser(values).then(success => {
        return success
    }).then((success => {
        //Sending user email, with link as /register?registration_number=values.registration_number in register template
        helpers.sendEmail(email, {
            template: 'register',
            subject: 'Welcome to xportal Portal',
            registration_number: values.registration_number,
            homeLink: processEnv.FRONT_APP_DOMAIN || ''
        }, undefined).then(sentMail => {
            return res.status(201).json({message: 'User created and email sent'});
        })
    })).catch(e => {
        return res.status(400).json({message: 'Error while creating user'});
    })
};