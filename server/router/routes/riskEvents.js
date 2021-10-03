const express = require('express');
const router = express.Router();
const {roles, grantAccess} = require('../../helpers/roles')

const riskEvents = require('../../controllers/riskEventsController');
const authMiddleware = require('../../middleware/Auth')

router.get('/' + process.env.CUSTOMER + '-be/risk-events/', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskEvents.index);

router.get('/' + process.env.CUSTOMER + '-be/risk-events/:requestId', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents'),
    grantAccess('read', 'riskEventsDetails')
], riskEvents.riskDetailByRequestId);


router.get('/' + process.env.CUSTOMER + '-be/download-csv', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents'),
], riskEvents.downloadCsv);

module.exports = router;
