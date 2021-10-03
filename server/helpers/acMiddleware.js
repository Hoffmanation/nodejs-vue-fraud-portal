class AccessControlMiddleware {
    /**
     * @param {object} accessControl access control rules object.
     */

    constructor(accessControl) {
        this._accessControl = accessControl;
    }

    /**
     * check permission
     * @param {object} params parameters.
     * @param {string} resource resource name.
     * @param {string} action action would be any of create, read, update & delete.
     * @param {boolean} [checkOwnerShip] flag to check ownership on resource.
     * @param {Object[]} [operands] operands which will compare to check ownership.
     * @param {string} operands.source source to get operand value (body, params, query, and whichever present in req object).
     * @param {string} operands.key key to get operand value.
     * @returns {function} middleware to append in express.js route.
     */

    check({resource, action, checkOwnerShip = false, operands = []}) {

        return (req, res, next) => {

            const actions = {};

            switch (action) {

                case 'create' :
                    actions.any = 'createAny';
                    actions.own = 'createOwn';
                    break;

                case 'update' :
                    actions.any = 'updateAny';
                    actions.own = 'updateOwn';
                    break;


                case 'read' :
                    actions.any = 'readAny';
                    actions.own = 'readOwn';
                    break;


                case 'delete' :
                    actions.any = 'deleteAny';
                    actions.own = 'deleteOwn';
                    break;

                default:
                    return next(new Error('invalid action'));
            }

            //check if session has user and role
            if (!req.session.user || !req.session.user.role) {
                return res.status(403).json({message: 'Invalid role'})
            }
            const role = req.session.user.role;
            let permission = {};

            permission = this._accessControl.can(role);

            if (checkOwnerShip) {

                if (operands.length !== 2) {
                    return next(new Error('must be two operands to check ownership'))
                }

                const firstOperand = req[operands[0].source][operands[0].key];

                const secondOperand = req[operands[1].source][operands[1].key];

                if (firstOperand.toString() === secondOperand.toString()) {
                    permission = permission[actions.own](resource);
                } else {
                    permission = permission[actions.any](resource);
                }

            } else {
                permission = permission[actions.any](resource);
            }

            if (permission.granted) {
                return next();
            } else {
                return res.status(403).json({message: 'Not Authorised'}).send();
            }
        };
    }


    /**
     * This method will validate if a specific user have the permission to access the certain resource
     * @param {String} resource - the resources the user is trying to access
     * @param {String} action - the action type the user is trying to access
     * @param {String} checkOwnerShip - boolean value
     * @param operands
     * @param req
     * @returns {{permitted: boolean}|Promise|*|Knex.ColumnBuilder|Promise<any>} indicates if the user have permission to the given resource
     */
    checkPermissions({resource, action, checkOwnerShip = false, operands = []} , req) {



            const actions = {};
            actions.any = 'readAny';
            actions.own = 'readOwn';


            //check if session has user and role
            if (!req.session.user || !req.session.user.role) {
                return res.status(403).json({message: 'Invalid role'})
            }
            const role = req.session.user.role;
            let permission = {};

            permission = this._accessControl.can(role);

            if (checkOwnerShip) {

                if (operands.length !== 2) {
                    return next(new Error('must be two operands to check ownership'))
                }

                const firstOperand = req[operands[0].source][operands[0].key];

                const secondOperand = req[operands[1].source][operands[1].key];

                if (firstOperand.toString() === secondOperand.toString()) {
                    permission = permission[actions.own](resource);
                } else {
                    permission = permission[actions.any](resource);
                }

            } else {
                permission = permission[actions.any](resource);
            }

            if (permission.granted) {
                return {permitted: true};

            } else {
                return {permitted: false} ;
            }
        };


    }

module.exports = AccessControlMiddleware;