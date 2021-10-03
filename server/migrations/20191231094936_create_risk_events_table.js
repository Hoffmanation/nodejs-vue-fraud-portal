exports.up = function(knex) {
    return knex.schema.createTable('risk_events', function(table) {
        table.string('severity').notNullable();
        table.specificType('score','float8').notNullable();
        table.timestamp('timestamp').defaultTo(knex.fn.now());
        table.string('sessionid').notNullable();
        table.string('requestid').notNullable();
        table.string('userid').notNullable();
        table.string('checkpoint').notNullable();
        table.specificType('amount','float8');
        table.string('currency')
        table.string('destination')
        table.string('status')
        table.json('json').notNullable()
    })
};

exports.down = function(knex) {
    return knex.schema.dropTable('risk_events');
};
