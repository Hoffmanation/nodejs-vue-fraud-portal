const riskGauge = require('../models/riskGauge');
const riskEvents = require('../models/riskEvents');
const helpers = require('../helpers/helper');

exports.getCurrencySymbol = function (req, res) {
    return res.json({currencySymbol: process.env.CURR_SYM, currency: process.env.CURR});
}

/**
 * Gets Today's/This Month's :
 * 1.Customers count
 * 2."VERY_HIGH" DB-transactions by unique customer
 * 3."VERY_HIGH" DB-transaction percent by unique customer
 * @param req
 * @param res
 * @param isYesterdayRequest
 * @param todaysDataRes
 */
exports.getTodaysCustomerGauge = function (req, res) {
    const isYesterdayRequest = req.query.isYesterdayRequest;
    let todaysDataRes = {};
    const todaysSuspiciousCustomers = riskGauge.getTodaysCustomers(isYesterdayRequest).then(data => {
        todaysDataRes['todaysCustomers'] = parseInt(data[0].count);
        return res.json(todaysDataRes);
    }).catch(e => {
        res.status(404).send({code: 404, message: e.message});
    });
};

/**
 * Gets Today's/This Month's :
 * 1.Suspicious customers count
 * 2."VERY_HIGH" DB-transactions by unique customer
 * 3."VERY_HIGH" DB-transaction percent by unique customer
 * @param req
 * @param res
 * @param isYesterdayRequest
 * @param todaysDataRes
 */
exports.getTodaysSuspiciousCustomerGauge = function (req, res) {
    const isYesterdayRequest = req.query.isYesterdayRequest;
    let todaysDataRes = {};
    const todaysSuspiciousCustomers = riskGauge.getTodaysSuspiciousCustomers(isYesterdayRequest).then(data => {
        const todaysSuspiciousCustomers = parseInt(data[0].count);
        todaysDataRes['todaysSuspiciousCustomers'] = todaysSuspiciousCustomers;
        return res.json(todaysDataRes);
    }).catch(e => {
        res.status(404).send({code: 404, message: e.message});
    });
};


/**
 * Gets Today's/This Month's :
 * 1."TRANSACTION"-Checkpoint count
 * 2."VERY_HIGH" DB-transaction by unique "TRANSACTION"-Checkpoint
 * 3."VERY_HIGH" DB-transaction percent by unique "TRANSACTION"-Checkpoint
 * @param req
 * @param res
 * @param isYesterdayRequest
 * @param todaysDataRes
 */
exports.getTodaysTransactionGauge = function (req, res) {
    const isYesterdayRequest = req.query.isYesterdayRequest;
    let todaysDataRes = {};
    const todaysTransaction = riskGauge.getTodaysTransactions(isYesterdayRequest).then(data => {
        todaysDataRes['TodaysTransactions'] = data[0].count;
        const todaysSuspiciousTransactions = riskGauge.getTodaysSuspiciousTransactions(isYesterdayRequest).then(data => {
            todaysDataRes['todaysSuspiciousTransactions'] = data[0].count;
            todaysDataRes['todaysSuspiciousTransactionPercent'] = todaysDataRes['todaysSuspiciousTransactions'] / todaysDataRes['TodaysTransactions'] * 100;
            return res.json(todaysDataRes);
        }).catch(error => {
            res.status().send({status: 404, message: error.message});
        })
    }).catch(error => {
        res.status(404).send({status: 404, message: error.message})
    });

};


/**
 * Gets Today's/This Month's :
 * 1."TRANSACTION"-Checkpoint amount sum by unique currency
 * 2."VERY_HIGH" severity and "TRANSACTION"-Checkpoint DB-transaction amount sum by unique currency
 * 3."VERY_HIGH" severity and "TRANSACTION"-Checkpoint DB-transaction amount sum percent by unique currency
 * @param req
 * @param res
 * @param isYesterdayRequest
 * @param todaysDataRes
 */
exports.getTodaysAmountGauge = function (req, res) {
    const isYesterdayRequest = req.query.isYesterdayRequest;
    let todaysDataRes = {};
    const todaysTransactionsAmountSum = riskGauge.getTodaysTransactionsAmountSum(isYesterdayRequest).then(data => {
        todaysDataRes['todaysTransactionsAmountSum'] = data;
        const todaysSuspiciousTransactionsAmountSum = riskGauge.getTodaysSuspiciousTransactionsAmountSum(isYesterdayRequest).then(data => {
            let amountSum = todaysDataRes['todaysTransactionsAmountSum'][0].sum;
            let suspicionAmountSum = data[0].sum;
            let todaysSuspiciousAmountPercent = suspicionAmountSum / amountSum * 100;
            todaysDataRes['todaysSuspiciousAmountPercent'] = todaysSuspiciousAmountPercent;
            return res.json(todaysDataRes);
        }).catch(error => {
            res.status().send({status: 404, message: error.message});
        })
    }).catch(error => {
        res.status(404).send({status: 404, message: error.message})
    });
};


/**
 * Gets Today's/This Month's :
 * 1."VERY_HIGH" severity and "TRANSACTION"-Checkpoint DB-transaction sum
 * 2."MEDIUM" severity and "TRANSACTION"-Checkpoint DB-transaction sum
 * 3."LOW" severity and "TRANSACTION"-Checkpoint DB-transaction sum
 * @param req
 * @param res
 * @param isYesterdayRequest
 * @param todaysDataRes
 */
exports.getTodaysTransactionsBySeverity = function (req, res) {
    const isYesterdayRequest = req.query.isYesterdayRequest;
    let todaysDataRes = {};
    let responseHelper = {};
    const getTodaysSeverityTransactions = riskGauge.getTodaysSeverityTransactions(isYesterdayRequest).then(data => {
                for (let index  in data) {let entry = data[index];responseHelper[entry.severity] = entry.count}
                todaysDataRes['todaysVeryHighSeverityTransactions'] = responseHelper['VERY_HIGH'] || 0;
                todaysDataRes['todaysMediumSeverityTransactions'] = responseHelper['MEDIUM'] || 0;
                todaysDataRes['todaysLowSeverityTransactions'] = responseHelper['LOW'] || 0;
                return res.json(todaysDataRes);
            }).catch(error => {
                res.status(404).send({status: 404, message: error.message})
            })
};


/**
 * Gets Today's/This Month's :
 * 1."VERY_HIGH" severity and "TRANSACTION"-Checkpoint DB-transaction amount
 * 2."MEDIUM" severity and "TRANSACTION"-Checkpoint DB-transaction amount
 * 3."LOW" severity and "TRANSACTION"-Checkpoint DB-transaction amount
 * @param req
 * @param res
 * @param isYesterdayRequest
 * @param todaysDataRes
 */
exports.getTodaysAmountsBySeverity = function (req, res) {
    const isYesterdayRequest = req.query.isYesterdayRequest;
    let todaysDataRes = {};
    let responseHelper = {};
            const todaysSeverityAmounts = riskGauge.getTodaysSeverityAmounts(isYesterdayRequest).then(data => {
                for (let index  in data) {let entry = data[index];responseHelper[entry.severity] = entry.sum}
                todaysDataRes['todaysVeryHighSeverityAmounts'] = responseHelper['VERY_HIGH'] || 0;
                todaysDataRes['todaysMediumSeverityAmounts'] = responseHelper['MEDIUM'] || 0;
                todaysDataRes['todaysLowSeverityAmounts'] = responseHelper['LOW'] || 0;
                return res.json(todaysDataRes);
            }).catch(error => {
                res.status(404).send({status: 404, message: error.message})
            });
};


/**
 * Gets Today's/This Month's :
 * 1."TRANSACTION"-Checkpoint DB-transaction sum
 * 2."LOGIN"-Checkpoint DB-transaction sum
 * 3."GENERAL"-Checkpoint DB-transaction sum
 * 4."ADD-PAYMENT-METHOD"-Checkpoint DB-transaction sum
 * 5."REGISTER"-Checkpoint DB-transaction sum
 * @param req
 * @param res
 * @param isYesterdayRequest
 * @param todaysDataRes
 */
exports.getTodaysRequests = function (req, res) {
    const isYesterdayRequest = req.query.isYesterdayRequest;
    let todaysDataRes = {};
    let responseHelper = {};
    const  getTodaysCheckpointRequests = riskGauge. getTodaysCheckpointRequests(isYesterdayRequest).then(data => {
                        for (let index  in data) {let entry = data[index];responseHelper[entry.checkpoint] = entry.count}
                        todaysDataRes['todaysTransactionsData'] = responseHelper['TRANSACTION'] || 0;
                        todaysDataRes['todaysLoginsData'] = responseHelper['LOGIN'] || 0;
                        todaysDataRes['todaysGeneralsData'] = responseHelper['GENERAL'] || 0;
                        todaysDataRes['todaysAddPaymentMethodsData'] = responseHelper['ADD_PAYMENT_METHOD'] || 0;
                        todaysDataRes['todaysRegistersData'] = responseHelper['REGISTER'] || 0;
                        return res.json(todaysDataRes);
                    }).catch(error => {
                        res.status(404).send({status: 404, message: error.message})
                    });
};


exports.riskEventsDynamicDashboard = (req, res) => {
    const query = req.query;
    const filters = req.query.filters;
    let ranges = req.query.ranges;
    const sort = req.query.sort;

/*    if (!ranges) ranges = {} ;

    if (!ranges['timestamp|smallEquals'] && !ranges['timestamp|bigEquals'] ) {
        ranges['timestamp|smallEquals'] = helpers.getDateHelper("true").toISOString() ;
    }*/



    //parsing query parameter filters
    const parsedFilters = helpers.parseUrl(filters);
    //parsing query parameter sort
    const parsedSort = helpers.parseUrl(sort);
    //parsing ranged query parameter
    const parsedRangesFilters = helpers.parseUrl(ranges);

    //grouping filters
    const groupedFilters = helpers.groupBy(parsedFilters, 'filterName');
    riskEvents.getCountRiskEvents().then(data => {
        const pagination = {perPage: data[0].count , currentPage: query.currentPage || 1};
        const risk = riskEvents.getRiskEvents(groupedFilters, parsedSort, pagination, parsedRangesFilters).then(data => {
            let response = helpers.createDynamicDashboardResponse(data)
                return res.json(response);
        }).catch(e => {res.status(404).send({code: 404, message: e.message});});})
        .catch(e => {res.status(404).send({code: 404, message: e.message});});

}