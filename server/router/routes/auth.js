const express = require('express');
const router = express.Router();

const authController = require('../../controllers/authController');
const authMiddleware = require('../../middleware/Auth');
const { roles, grantAccess } = require('../../helpers/roles');

//login user, returns token
router.get('/' + process.env.CUSTOMER +'-be/healthCheck', authController.healthCheck);
router.post('/' + process.env.CUSTOMER +'-be/auth/login', authController.user_login);

//logout user only if allowIfLoggedIn
router.post('/' + process.env.CUSTOMER +'-be/auth/logout', authMiddleware.allowIfLoggedIn, authController.user_logout);

//here we get QR code from email link
router.get('/' + process.env.CUSTOMER +'-be/register', authController.registration_get);
//here we validate QR code from email link
router.post('/' + process.env.CUSTOMER +'-be/register', authController.registration_post);

router.get('/' + process.env.CUSTOMER +'-be/isUserPermitted', authController.is_user_permitted);

//only admins/superadmins have privilege to reset password for user
router.post('/' + process.env.CUSTOMER +'-be/reset-password/:userId',[authMiddleware.allowIfLoggedIn,authMiddleware.verifyUserToken, grantAccess('create','profiles')], authController.reset_password);

module.exports = router;
