const fs = require('fs');
exports.up = function (knex) {
    return new Promise((resolve, reject) => {
        const sql = fs.readFileSync('./migrations/01-modify_risk_events_table.sql').toString();
        resolve(knex.raw(sql))
    })
};

exports.down = function (knex) {

};
