const fs = require('fs');
exports.up = function(knex) {
    return new Promise((resolve, reject) => {
        const sql = fs.readFileSync('./migrations/02-create_session_table.sql').toString();
        resolve(knex.raw(sql))
    })
};

exports.down = function(knex) {

};
