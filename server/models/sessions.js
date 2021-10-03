const knex = require('../db/connection');
const sessionUtils = {
    table: 'session',
    /**
     * @summary
     * @param {string} property
     * @param {string} value
     * @return {Knex.QueryBuilder|*}
     */
    getSessionByPropertyValue: function (property, value) {
        const table = sessionUtils.table;
        if (!property || !value) {
            return new Error('Missing parameters')
        }
        return knex.select('*').table(table).where(property, value).first();
    },
    deleteSessionBySid: function (sid) {
        if (!sid) {
            return new Error('Missing sid')
        }
        return sessionUtils.getSessionByPropertyValue('sid',sid).then(found => {
            return knex(sessionUtils.table).where({id: found.sid}).del()
        })
    },
};

module.exports = sessionUtils;
