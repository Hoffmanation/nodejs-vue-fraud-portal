const riskEvents = require('../models/riskEvents');
const clientPortalConfig = require('../models/clientPortalConf');
const helpers = require('../helpers/helper');

/**
 * Gets All risk events with filters, ranges, sort and pagination
 * @param req
 * @param req.query.filter
 * @param req.query.ranges
 * @param req.query.sort
 * @param req.query.perPage=10
 * @param req.query.currentPage=1
 * @param res
 */
exports.index = function (req, res) {
    const query = req.query;
    const filters = req.query.filters;
    const ranges = req.query.ranges;
    const sort = req.query.sort;

    const pagination = {
        perPage: query.perPage || 10,
        currentPage: query.currentPage || 1
    };

    //parsing query parameter filters
    const parsedFilters = helpers.parseUrl(filters);
    //parsing query parameter sort
    const parsedSort = helpers.parseUrl(sort);
    //parsing ranged query parameter
    const parsedRangesFilters = helpers.parseUrl(ranges);

    //grouping filters
    const groupedFilters = helpers.groupBy(parsedFilters, 'filterName');
    const risk = riskEvents.getRiskEvents(groupedFilters, parsedSort, pagination, parsedRangesFilters,'pagination').then(data => {
        return res.json(data);
    }).catch(e => {
        res.status(404).send({
            code: 404,
            message: e.message
        });
    });
};
/**
 * Gets json from table
 * @param req
 * @param req.params.requestId
 * @param res
 * @return {*}
 */
exports.riskDetailByRequestId = function (req, res) {
    if (!req.params.requestId) {
        return res.json('requestId not found').status(401);
    }
    const riskEventsByUserId = riskEvents.getRiskEventsByRequestId(req.params.requestId).then(data => {
        const jsonResponse = data.json || {};
        const jsonMap = helpers.getJsonConfig() || {"fields": {}}
        const role = req.session.user.role || ''
        //remaping response json
        let remapped = helpers.remapJson(jsonResponse, jsonMap, role);
        helpers.removeEmptyObjectProperties(remapped);
        return res.json(remapped);
    }).catch(e => {
        res.status(404).send({
            code: 404,
            message: e.message
        });
    });
};

exports.downloadCsv = (req, res) =>  {
    const query = req.query;
    const filters = req.query.filters;
    const ranges = req.query.ranges;
    const sort = req.query.sort;

    let pagination = {
        perPage: query.perPage || 10,
        currentPage: query.currentPage || 1
    };

    //parsing query parameter filters
    const parsedFilters = helpers.parseUrl(filters);
    //parsing query parameter sort
    const parsedSort = helpers.parseUrl(sort);
    //parsing ranged query parameter
    const parsedRangesFilters = helpers.parseUrl(ranges);

    //grouping filters
    const groupedFilters = helpers.groupBy(parsedFilters, 'filterName');



    riskEvents.getRiskEvents(groupedFilters, parsedSort, pagination, parsedRangesFilters,'sum').then(data => {
        let rowSum = parseInt(data) ;
        clientPortalConfig.getClientPortalConfigurationbyKey('maxRecordForCSVExport').then(data => {
                 let clientPortalConfig = data[0] ;
                 let maxRowsAllowed = !clientPortalConfig ? rowSum : parseInt(clientPortalConfig.value) ;
                 if(maxRowsAllowed>=rowSum){
                     pagination = {perPage: maxRowsAllowed, currentPage: 1};
                     riskEvents.getRiskEvents(groupedFilters, parsedSort, pagination, parsedRangesFilters,'pagination').then(data => {
                         let abspath = helpers.createRiskCsvFile(data) ;
                         setTimeout(()=> {
                             helpers.getCsvContent(abspath,function(data){return  res.status(201).json(data) ;})
                         } , 500)
                     }).catch(e => {res.status(404).send({code: 404,message: e.message});});
                 }
                 else {return res.status(409).json(clientPortalConfig.message) ; }

                ;})
            .catch(e => {res.status(404).send({code: 404,message: e.message});});})
        .catch(e => {res.status(404).send({code: 404,message: e.message});});
};