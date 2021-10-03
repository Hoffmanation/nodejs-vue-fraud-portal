exports.up = function (knex) {
    return knex.schema.createTable('users', function (table) {
        table.uuid('id').primary();
        table.string('email').notNullable().unique()
        table.string('password').nullable()
        table.string('name').nullable()
        table.string('role').notNullable()

        //used for 2fa
        table.boolean('verified').defaultTo(false)
        //used for 2fa and verification
        table.uuid('registration_number').nullable()
        table.string('secret').nullable()

        table.timestamps(false, true);
    })
};

exports.down = function (knex) {
    return knex.schema.dropTable('users');
};
