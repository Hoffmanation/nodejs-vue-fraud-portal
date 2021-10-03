const express = require('express');
const router = express.Router();
const {roles, grantAccess} = require('../../helpers/roles')

const riskGauge = require('../../controllers/riskGaugeController');
const authMiddleware = require('../../middleware/Auth')


/*
Rest Controllers to be used by Dashboard.vue
 */
router.get('/' + process.env.CUSTOMER +'-be/get-currency-symbol/', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getCurrencySymbol);

router.get('/' + process.env.CUSTOMER +'-be/get-todays-customer-gauge/', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getTodaysCustomerGauge);

router.get('/' + process.env.CUSTOMER +'-be/get-todays-suspicious-customer-gauge/', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getTodaysSuspiciousCustomerGauge);

router.get('/' + process.env.CUSTOMER +'-be/get-todays-transaction-gauge', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getTodaysTransactionGauge);

router.get('/' + process.env.CUSTOMER +'-be/get-todays-amount-gauge', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getTodaysAmountGauge);


router.get('/' + process.env.CUSTOMER +'-be/get-todays-transactions-by-severity', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getTodaysTransactionsBySeverity);

router.get('/' + process.env.CUSTOMER +'-be/get-todays-amounts-by-severity', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getTodaysAmountsBySeverity);

router.get('/' + process.env.CUSTOMER +'-be/get-todays-requests', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.getTodaysRequests);

router.get('/' + process.env.CUSTOMER +'-be/risk-events-dynamic-dashboard', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'riskEvents')
], riskGauge.riskEventsDynamicDashboard);



module.exports = router;
