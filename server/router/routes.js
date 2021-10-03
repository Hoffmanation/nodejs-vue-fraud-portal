const express = require('express');
const router = express.Router();
const auth = require('./routes/auth');
const riskEvents = require('./routes/riskEvents');
const riskGauge = require('./routes/riskGauge');
const users = require('./routes/users');
const home = require('./routes/home');
const audit = require('./routes/auditTrail');



router.use(home);
router.use(auth);
router.use(users);
router.use(riskEvents);
router.use(riskGauge);
router.use(audit);

module.exports = router;
