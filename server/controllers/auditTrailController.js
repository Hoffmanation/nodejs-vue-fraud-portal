const auditTrailUtils = require('../models/auditTrail');
const helpers = require('../helpers/helper');

/**
 * Create new Audit Trail/s
 * This method accept an array of object to support bulk inserts
 * @param req
 * @param res
 */
exports.createAuditTrail = (req, res) => {
    let trails = req.body.params
    auditTrailUtils.createAuditTrail(trails).then(response => {
        return res.json(response);
    }).catch(e => {
        return res.status(400).json({message: 'Error while creating audit trail'});
    });
}


/**
 * Get all Audit Trail Usenames available in the DB
 * @param req
 * @param res
 * @returns {Promise|*|Knex.ColumnBuilder|Promise<any>}
 */
exports.getAuditTrailUsenames = (req, res) => {
    auditTrailUtils.getAuditTrailUsenames().then(response => {
        return res.json(response);
    }).catch(e => {
        return res.status(400).json({message: 'Error while retrieving audit trail usenames'});
    });
}


/**
 * Get all Audit Trail Resources available in the DB
 * @param req
 * @param res
 * @returns {Promise|*|Knex.ColumnBuilder|Promise<any>}
 */
exports.getAuditTrailResources = (req, res) => {
    try {
        return res.json(helpers.getEnums());
    } catch (error) {
        return res.status(400).json({message: 'Error while retrieving audit trail resources'});
    }
    ;
}


/**
 * Gets All Audit Trails with filters, ranges, sort and pagination
 * @param req
 * @param req.query.filter
 * @param req.query.ranges
 * @param req.query.sort
 * @param req.query.perPage=10
 * @param req.query.currentPage=1
 * @param res
 */
exports.getAditTrail = function (req, res) {
    const query = req.query;
    const filters = req.query.filters;
    let ranges = req.query.ranges;
    const sort = req.query.sort;

    if (ranges) {
        let newVal;
        if (ranges.hasOwnProperty('timestamp|smallEquals')) {
            newVal = ranges['timestamp|smallEquals']
            delete ranges['timestamp|smallEquals']
            ranges['date|smallEquals'] = newVal;
        }

        if (ranges.hasOwnProperty('timestamp|bigEquals')) {
            newVal = ranges['timestamp|bigEquals']
            delete ranges['timestamp|bigEquals']
            ranges['date|bigEquals'] = newVal;
        }
    }

    if (filters && filters.data) {
        let mod = filters.data;
        filters.data = '*' + mod + '*';
    }
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
    const auditTrailsObjects = auditTrailUtils.getAuditTrail(groupedFilters, parsedSort, pagination, parsedRangesFilters).then(data => {
        return res.json(data);
    }).catch(e => {
        res.status(404).send({
            code: 404,
            message: e.message
        });
    });
};