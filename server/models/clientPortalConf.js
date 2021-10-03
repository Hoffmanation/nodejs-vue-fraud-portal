const knex = require('../db/connection');
const clientPortalConfUtils = {
    table: 'client_portal_configuration',
    currency: process.env.CURR,

    /**
     * @summary Functions used for getting unique fraud-transactions
     * @return {Knex.QueryBuilder|*}
     */
    getClientPortalConfigurationbyKey: function(key) {
        const table = clientPortalConfUtils.table;
        return knex.table(table)
            .where('key', key) ;
    },

}

module.exports = clientPortalConfUtils;