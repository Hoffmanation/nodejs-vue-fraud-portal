const AccessControl = require("accesscontrol");
const ac = new AccessControl();
const AccessControlMiddleware = require('./acMiddleware');
const accessControlMiddleware = new AccessControlMiddleware(ac);
/**
 * @description used to define users and roles auth.
 * users:
 *
 * user -
 *  can:
 *      - readOwn profile
 *      - updateOwn profile
 *      - read riskEvents
 * developer -
 *  can:
 *      - readOwn profile
 *      - updateOwn profile
 *      - read riskEvents
 *
 * analyst -
 *  can:
 *      - readOwn profile
 *      - updateOwn profile
 *      - read riskEvents
 *      - read profile
 *  cant:
 *      - update profile -> role
 *      - read riskEventsDetails -> json
 *      - read profiles
 *
 * admin -
 *  can:
 *      - readOwn profile
 *      - updateOwn profile
 *      - read riskEvents
 *      - read profiles
 *      - update profiles
 *      - create profiles
 *      - delete profiles
 *
 * superAdmin -
 *  can:
 *      - readOwn profile
 *      - updateOwn profile
 *      - read riskEvents
 *      - read profiles
 *      - update profiles
 *      - create profiles
 *      - delete profiles
 *
 *
 */
exports.roles = (function () {

    //GRANT
    //first level, basic/generic, including to all users read rights for riskEvents
    ac.grant('user').readOwn('profile').updateOwn('profile').read('riskEvents');
    //second level, what we need is developer - read only basic risk-events
    ac.grant('developer').extend('user');
    //third level, analyst, read any developer profile, extended risk-events details
    ac.grant('analyst').extend('developer').read('profile');
    //forth level is admin who creates/deletes/updates/reads any profile, read any risk-events/risk-event details
    ac.grant('admin').extend('analyst').update('profiles').create('profiles').delete('profiles');
    //fifth level is super admin, hardcoded and extend admin
    ac.grant('superAdmin').extend('admin');
    //grant admin superAdmin read details
    ac.grant('admin').read('riskEventsDetails').read('profiles');
    ac.grant('superAdmin').read('riskEventsDetails').read('profiles');
    //analyst can read any riskEvents and riskEvents details
    ac.grant('developer').read('riskEventsDetails', ['json']);
    ac.grant('analyst').read('riskEvents');
    ac.grant('superAdmin').read('auditTrail');


    //DENY
    //deny updating any profile role to analyst
    ac.deny('analyst').update('profile', ["role"]).read('profiles');
    //deny developer readying any riskEvents json, deny reading all user profiles
    ac.deny('analyst').read('riskEventsDetails', ['json']).read('profiles');
    //deny analyst/developer to read profiles
    ac.deny('analyst').read('profiles');
    ac.deny('developer').read('profiles');
    //deny analyst/developer to crud profiles
    ac.deny('analyst').update('profiles').create('profiles').delete('profiles');


    ac.lock();
    return ac;
})();

/**
 * @function Middleware function that is handling access controls over routes
 * @param {string} action
 * @param {string} resource
 * @param {boolean} [checkOwnership]
 * @param {Object[]} [operands]
 * @param {string} [operands.source]
 * @param {string} [operands.key]
 * @return {function(...[*]=)}
 */
exports.grantAccess = function (action, resource, checkOwnership, operands) {
    return accessControlMiddleware.check({
        resource: resource,
        action: action,
        checkOwnership: checkOwnership || false,
        operands: operands
    })

};

/**
 * This method will validate if a specific user have the permission to access the certain resource
 * @param {String} resource - the resources the user is trying to access
 * @param {String} action - the action type the user is trying to access
 * @param req
 * @returns {undefined|{permitted: boolean}}
 */
exports.isUserPermitted = function(action, resource,req){
    return accessControlMiddleware.checkPermissions({resource: resource, action: action} ,req)
}