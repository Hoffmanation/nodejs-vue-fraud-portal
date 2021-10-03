const knex = require('../db/connection');
const Helper = require('../helpers/helper');

const auditTrailUtils = {
    table: 'client_portal_audit_trail',

    /**
     * Creates new audit trail in database
     * @param {object} trail - single or an array of Audit Trail
     * @return {Error|Knex.QueryBuilder<TRecord, number[]>}
     */
    createAuditTrail: function (trails) {
        const table = auditTrailUtils.table;
        if (!trails) {
            return new Error('Missing audit')
        }
        //Assign the resource before creation
        Helper.assignAuditTrailResource(trails) ;
        return knex(table).insert(Object.values(trails)) ;
    },

    /**
     * Creates new audit trail in database
     * @param {object} trail
     * @return {Error|Knex.QueryBuilder<TRecord, number[]>}
     */
    getAuditTrailUsenames: function () {
        const table = auditTrailUtils.table;
        return knex.distinct('username')
            .table(table) ;
    },

    /**
     * Get Audit trail objects from the DB by filter,sorts and pagination
     * @param parsedFilters
     * @param parsedSort
     * @param pagination
     * @param parsedRangesFilters
     * @returns {*}
     */
    getAuditTrail: function (parsedFilters, parsedSort, pagination, parsedRangesFilters) {
        const table = auditTrailUtils.table;
        const kn = knex(table).select('id', 'date', 'data' , 'path','username','method','resource');
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

        if (parsedSort.length) {
            kn.modify(function (queryBuilder) {
                parsedSort.forEach(function (sort) {
                    queryBuilder.orderBy(sort.filterName, sort.filterValue);
                });
            })
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
        console.log('debug sql --> ', kn.toQuery());
        return kn.paginate({perPage: pagination.perPage, currentPage: pagination.currentPage, isLengthAware: true})
    },

}

module.exports =  auditTrailUtils ;