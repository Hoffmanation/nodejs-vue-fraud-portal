const Helper = require('../helpers/helper');
const uuidv4 = require('uuid/v4')
const adminPassword = 'admin'
exports.seed = function (knex) {
    return knex('users').del()
        .then(function () {
            return knex('users').insert([
                {
                    id: uuidv4(),
                    name: 'Super Admin',
                    role: 'superAdmin',
                    email: 'superadmin@email.com',
                    password: Helper.hashPassword(adminPassword),
                    verified: true,
                    secret: 'secret'
                },
                {
                    id: uuidv4(),
                    name: 'Admin',
                    role: 'admin',
                    email: 'admin@email.com',
                    password: Helper.hashPassword(adminPassword),
                    verified: true,
                    secret: 'secret'
                }
            ]);
        });
};


