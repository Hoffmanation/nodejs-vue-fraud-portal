const express = require('express');
const router = express.Router();
const {roles, grantAccess} = require('../../helpers/roles')

const auditTrail = require('../../controllers/auditTrailController');
const authMiddleware = require('../../middleware/Auth')


/*
Rest Controllers for Audit Trail
 */

router.post('/' + process.env.CUSTOMER +'-be/create-audit-trail/', [
], auditTrail.createAuditTrail);

router.get('/' + process.env.CUSTOMER + '-be/audit-trails/', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'auditTrail')
], auditTrail.getAditTrail);

router.get('/' + process.env.CUSTOMER + '-be/audit-trails-usernames/', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'auditTrail')
], auditTrail.getAuditTrailUsenames);

router.get('/' + process.env.CUSTOMER + '-be/audit-trails-resources/', [
    authMiddleware.verifyUserToken,
    authMiddleware.allowIfLoggedIn,
    grantAccess('read', 'auditTrail')
], auditTrail.getAuditTrailResources);


module.exports = router;