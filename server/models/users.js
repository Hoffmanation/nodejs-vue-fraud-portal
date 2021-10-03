const knex = require('../db/connection');

const usersUtils = {
    table: 'users',
    allowedRoles: ['superAdmin', 'admin', 'analyst', 'developer'],
    /**
     * Gets user by email
     * @param {string} email
     * @return {Error|Knex.QueryBuilder<TRecord, DeferredKeySelection.AddUnionMember<UnwrapArrayMember<TResult>, undefined>>}
     */
    getUserByEmail: function (email) {
        const table = usersUtils.table;
        if (!email) {
            return new Error('Missing user email')
        }
        return knex(table).where('email', email).first()
    },
    /**
     *
     * @param {string|number} userId
     * @param {string} role
     * @return {Error|Knex.QueryBuilder<TRecord, number>}
     */
    setRoleForUserId: function (userId, role) {
        const table = usersUtils.table;
        if (!userId || !role) {
            return new Error('Missing user email')
        }
        if (usersUtils.allowedRoles.indexOf(role) === -1) {
            return new Error('Invalid role, valid roles: ' + usersUtils.allowedRoles.join(' '))
        }
        return knex(table).where({id: userId}).update({role: role})
    },
    /**
     *
     * @param {string} property
     * @param {string} value
     * @return {Error|Knex.QueryBuilder<TRecord, DeferredKeySelection.AddUnionMember<UnwrapArrayMember<TResult>, undefined>>}
     */
    getUserByPropertyValue: function (property, value) {
        const table = usersUtils.table;
        if (!property || !property) {
            return new Error('Missing required params')
        }
        return knex(table).where(property, value).first()
    },
    /**
     * Gets user by id
     * @param {string} id
     * @return {Promise|Object}
     */
    getUserById: function (id) {
        const table = usersUtils.table;
        if (!id) {
            return new Error('Missing user id')
        }
        return knex(table).where('id', id).first()
    },
    /**
     * Gets all users in database
     * @param {object} pagination
     * @param {object} parsedFilters
     * @param {object} parsedSort
     * @param {object} parsedRangesFilters
     * @param {string|number} pagination.perPage
     * @param {string|number} pagination.currentPage
     * @return {Knex.QueryBuilder<TRecord, DeferredKeySelection<TRecord2, never>[]>}
     */
    getUsers: function (parsedFilters, parsedSort, pagination, parsedRangesFilters) {
        const table = usersUtils.table;
        const kn = knex(table).select('*').whereNot('role', 'superAdmin');
        const propNames = Object.getOwnPropertyNames(parsedFilters);
        if (propNames.length) {
            for (let prop in parsedFilters) {
                if (parsedFilters.hasOwnProperty(prop)) {
                    if (parsedFilters[prop].length) {
                        kn.modify(function (queryBuilder) {
                            //here it is AND joining each grouped filter
                            queryBuilder.where(function () {
                                let _self = this;
                                parsedFilters[prop].forEach(function (filter) {
                                    _self.orWhere(filter.filterName, filter.operator ? filter.operator : '=', filter.filterValue)
                                });
                            });
                        })
                    }
                }
            }
        }
        if (parsedRangesFilters.length) {
            kn.modify(function (queryBuilder) {
                queryBuilder.where(function () {
                    let _self = this;
                    parsedRangesFilters.forEach(function (filter) {
                        _self.andWhere(filter.filterName, filter.operator ? filter.operator : '=', filter.filterValue);
                    });
                })
            })
        }
        if (parsedSort.length) {
            kn.modify(function (queryBuilder) {
                parsedSort.forEach(function (sort) {
                    queryBuilder.orderBy(sort.filterName, sort.filterValue);
                });
            })
        }
        return kn.paginate({perPage: pagination.perPage, currentPage: pagination.currentPage, isLengthAware: true})
    },
    /**
     * Creates user in database
     * @param {object} user
     * @return {Error|Knex.QueryBuilder<TRecord, number[]>}
     */
    createUser: function (user) {
        if (!user) {
            return new Error('Missing user')
        }
        const table = usersUtils.table;
        if (usersUtils.allowedRoles.indexOf(user.role) === -1) {
            return new Error('Invalid role, valid roles: ' + usersUtils.allowedRoles.join(' '))
        }
        return knex(table).insert(user)
    },
    /**
     * Deletes from database user by specified userId
     * @param {string} userId
     * @return {Error|*}
     */
    deleteUser: function (userId) {
        if (!userId) {
            return new Error('Missing userId')
        }
        return usersUtils.getUserById(userId).then(user => {
            return knex(usersUtils.table).where({id: user.id}).del()
        })
    },
    /**
     * Updates user with specified fields //TODO check if fields are allowed to be updated/exists
     * @param {string} userId
     * @param {object} fields
     * @return {Error|Knex.QueryBuilder<TRecord, number>}
     */
    updateUser: function (userId, fields) {
        if (!userId) {
            return new Error('Missing userId')
        }
        if (fields.role && usersUtils.allowedRoles.indexOf(fields.role) === -1) {
            return new Error('Invalid role, valid roles: ' + usersUtils.allowedRoles.join(' '))
        }
        return knex(usersUtils.table).where({id: userId}).update(fields)
    }
}

module.exports = usersUtils