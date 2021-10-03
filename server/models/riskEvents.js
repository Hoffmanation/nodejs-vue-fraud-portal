const knex = require('../db/connection');
const riskEventUtils = {
    table: 'risk_events',
    riskFilePath: '../server/risk-data/risk.csv',
    /**
     * @summary Function used for details for specific requestid
     * @param {string} requestid
     * @return {Knex.QueryBuilder|*}
     */
    getRiskEventsByRequestId: function (requestid) {
        const table = riskEventUtils.table;
        if (!requestid) {
            return new Error('Missing requestid')
        }
        //selecting json by requestid
        return knex.select('json').table(table).where('requestid', requestid).first();
    },
    /**
     * @summary Function used to query all records in risk_events table, including sort and filter
     * @param {object[]} parsedRangesFilters
     * @param {object} pagination
     * @param {number|string} pagination.currentPage
     * @param {number|string} pagination.perPage
     * @param {object[]} parsedSort
     * @param {object[]|array[]} parsedFilters-
     * @example of parsedFilters with grouped properties
     *  {
     *   "requestid": [
     *     {
     *       "filterName": "requestid",
     *       "operator": "LIKE",
     *       "filterValue": "d115ca8e-bf49-4e8f-%"
     *     }
     *   ],
     *   "severity": [
     *     {
     *       "filterName": "severity",
     *       "filterValue": "LOW"
     *     }
     *   ],
     *   "checkpoint": [
     *     {
     *       "filterName": "checkpoint",
     *       "operator": "LIKE",
     *       "filterValue": "TRANSA%"
     *     }
     *   ]
     * }
     * @example of parsedRangesFilters:
     * [
     * {
     * "filterName": "score",
     * "operator": ">",
     * "filterValue": "300"
     * },
     * {
     * "filterName": "score",
     * "operator": "<",
     * "filterValue": "11000"
     * }
     * ]
     *
     * @param {string} parsedFilters.filterName
     * @param {string} [parsedFilters.operator= =] - used for operators like <,>,
     * @param {string} parsedFilters.filterValue
     * @param {string} operation - select or sum
     * @return {Knex.QueryBuilder}
     */
    getRiskEvents: function (parsedFilters, parsedSort, pagination, parsedRangesFilters, operation) {
        const table = riskEventUtils.table;
        //change here select returning all risk events
        const kn = knex(table).select('severity', 'score', 'timestamp', 'sessionid', 'requestid', 'userid', 'checkpoint', 'amount', 'currency', 'destination', 'status');
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
                    /*//old parsed filters, not grouped... maybe we will need it someday, maybe as a switch
                        }else{
                            if (parsedFilters.length) {
                                kn.modify(function (queryBuilder) {
                                    queryBuilder.where(function () {
                                        let _self = this;
                                        parsedFilters.forEach(function (filter) {
                                            _self.orWhere(filter.filterName, filter.operator ? filter.operator : '=', filter.filterValue)
                                        });
                                    });
                                })
                            }
                        }

                     */
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
        console.log('debug sql', kn.toQuery());

        if(operation=="sum")  return kn.getSum() ;

        return kn.paginate({perPage: pagination.perPage, currentPage: pagination.currentPage, isLengthAware: true})
    },


    getCountRiskEvents: function () {
        const table = riskEventUtils.table;
        return knex(table).count();
    }
    
};

module.exports = riskEventUtils;
