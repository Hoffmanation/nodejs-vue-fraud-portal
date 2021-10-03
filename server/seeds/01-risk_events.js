const fs = require('fs');
//demo data for risk_events with row sql file. this should be as object :(, but for sake of speed made it like this
exports.seed = function (knex) {
    return new Promise((resolve, reject) => {
        const sql = fs.readFileSync('./seeds/01-risk_events.sql').toString();
        resolve(knex.raw(sql))
    })
};