const express = require('express');
const router = express.Router();

const usersController = require('../../controllers/usersController');
const authMiddleware = require('../../middleware/Auth');
const { roles, grantAccess } = require('../../helpers/roles');

//list all users, we might need this only for admin/superAdmin
router.get('/' + process.env.CUSTOMER +'-be/users', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'profile'),
    grantAccess('read', 'profiles')
], usersController.admin_users);

//create user
router.post('/' + process.env.CUSTOMER +'-be/users', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('create', 'profiles')
], usersController.admin_users_create);

//get current user, requires to have req.headers['x-access-token']
router.get('/' + process.env.CUSTOMER +'-be/users/:userId', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'profiles')
], usersController.admin_users_details);

//delete user, requires to have req.headers['x-access-token']
router.delete('/' + process.env.CUSTOMER +'-be/users/:userId', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('delete', 'profiles')
], usersController.admin_users_delete);

//update user, requires to have req.headers['x-access-token']
router.put('/' + process.env.CUSTOMER +'-be/users/:userId',[
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('update', 'profiles')
], usersController.admin_users_update);


module.exports = router;
