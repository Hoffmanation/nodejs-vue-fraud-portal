const knex = require('../db/connection');
const Helper = require('../helpers/helper');
const gaugeUtils = {
    table: 'risk_events',
    currency: process.env.CURR,



    /**
     * @summary Function used for getting unique customer
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysCustomers: function (isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.countDistinct('userid')
            .table(table)
            .where('timestamp', ">",date)
    },


    /**
     * @summary Functions used for getting unique fraud-customer's
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysSuspiciousCustomers: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.countDistinct('userid')
            .table(table)
            .where('timestamp', ">",date)
            .where('severity', 'VERY_HIGH')
            .where('checkpoint', 'TRANSACTION')
            .where('status', 'APPROVED');
    },


    /**
     * @summary Functions used for getting unique fraud-transactions
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysSuspiciousTransactions: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.table(table).count("*")
        .where('timestamp', ">",date)
        .where('severity', 'VERY_HIGH')
        .where('checkpoint', 'TRANSACTION')
        .where('status', 'APPROVED');
    },


    /**
     * @summary Functions used for getting transactions
     * @return {Knex.QueryBuilder|*}
     */
     getTodaysTransactions: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.table(table)
        .count("*")
        .where('timestamp', ">",date)
        .where('checkpoint', 'TRANSACTION')
        .where('status', 'APPROVED');
    },


    /**
     * @summary Functions used for getting unique fraud-transactions where severity is 'VERY-HIGH' by currency
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysSuspiciousTransactionsAmountSum: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.table(table)
            .sum("amount")
            .where('timestamp', ">",date)
            .where('severity', 'VERY_HIGH')
            .where('checkpoint', 'TRANSACTION')
            .where('status', 'APPROVED');
            //.where("currency" , gaugeUtils.currency);
    },

    /**
     * @summary Functions used for getting unique fraud-transactions by currency
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysTransactionsAmountSum: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.table(table)
            .sum("amount")
            .where('timestamp', ">",date)
            .where('checkpoint', 'TRANSACTION')
            .where('status', 'APPROVED');
            //.where("currency" , gaugeUtils.currency);
    },



    /**
     * @summary Functions used for getting 'LOW' Severity Transactions's
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysSeverityTransactions: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.table(table).count('*').select('severity')
            .where('timestamp', ">",date)
            .where('checkpoint', 'TRANSACTION')
            .where('status', 'APPROVED').groupBy('severity');
    },




    /**
     * @summary Functions used for getting all Severities Transactions's amount
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysSeverityAmounts: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.table(table)
            .sum("amount").select('severity')
            .where('timestamp', ">",date)
            .where('checkpoint', 'TRANSACTION')
            .where('status', 'APPROVED').groupBy('severity');
    },

    /**
     * @summary Functions used for getting all Checkpoints row count
     * @return {Knex.QueryBuilder|*}
     */
    getTodaysCheckpointRequests: function(isYesterdayRequest) {
        const table = gaugeUtils.table;
        let date = Helper.getDateHelper(isYesterdayRequest)
        return knex.table(table)
            .count("*").select('checkpoint')
            .where('timestamp', ">",date)
            .groupBy('checkpoint');

    },

};

module.exports = gaugeUtils;
