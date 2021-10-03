const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const riskEventUtils = require('../models/riskEvents');
const fs = require('fs');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const jsonFile = require(process.env.JSON_CONFIGURATION_FILE_PATH);
//mailer config
const emailTransport = require('./emailTransport');
const SMTPTransport = emailTransport.GmailTransport;
const processEnv = process.env;

const Helper = {

    /**
     *This method will compute and assign a 'resource' attribute to each one of the audit trail object
     * Because the 'Path URL' of the controller/rout not always contains the 'Resource/Action' to user tried to make we need to assign it manually
     * @param {Array} trails - the Audit Trail object array to assign 'Resource' attribute to it
     */
    assignAuditTrailResource(trails) {
        let auditTrailResources = this.getEnums().AuditTrailResources;
        Object.values(trails).forEach(val => {

            let trailPath = val.path;
            if (trailPath.includes('login'))
                val.resource = auditTrailResources.LOGIN

            if (trailPath.includes('logout'))
                val.resource = auditTrailResources.LOGOUT

            else if (val.method == 'post' && trailPath == 'users')
                val.resource = auditTrailResources.CREATE_USER

            else if (val.method == 'delete' && trailPath.includes('users'))
                val.resource = auditTrailResources.DELETE_USER

            else if (val.method == 'post' && trailPath.includes('register?registration_number=') && val.data.includes('confirmPassword'))
                val.resource = auditTrailResources.USER_VERIFICATION

            else if (val.method == 'post' && trailPath.includes('register?registration_number='))
                val.resource = auditTrailResources.EMAIL_REGISTRATION

            else if (val.method == 'post' && trailPath.includes('reset-password/'))
                val.resource = auditTrailResources.RESET_PASSWORD

            else if (val.method == 'put' && trailPath.includes('users/'))
                val.resource = auditTrailResources.UPDATE_USER

            else if (val.method == 'get' && trailPath.includes('users'))
                val.resource = auditTrailResources.GET_USERS

            else if (val.method == 'get' && trailPath.includes('risk-events'))
                val.resource = auditTrailResources.RISK_EVENTS

        });
    },

    createDynamicDashboardResponse(data) {
        let response = {};
        let severity = new Map()
        severity.set('VERY_HIGH', new Set())
        severity.set('MEDIUM', new Set())
        severity.set('LOW', new Set())

        let checkpoint = new Map()
        checkpoint.set('REGISTER', new Set())
        checkpoint.set('TRANSACTION', new Set())
        checkpoint.set('LOGIN', new Set())
        checkpoint.set('GENERAL', new Set())
        checkpoint.set('ADD_PAYMENT_METHOD', new Set())

        let customers = new Set();
        let suspiciousCustomers = new Set();
        let todaysSuspiciousTransactions = [];

        Object.values(data.data).forEach(val => {
            if (val.userid) {
                customers.add(val.userid);
            }

            if (val.userid && val.severity == 'VERY_HIGH' && val.checkpoint == 'TRANSACTION') {
                suspiciousCustomers.add(val.userid)
            }

            if (val.severity == 'VERY_HIGH' && val.checkpoint == 'TRANSACTION') {
                todaysSuspiciousTransactions.push(val)
            }

            if (val.severity) {
                switch (val.severity) {
                    case 'VERY_HIGH':
                        severity.get('VERY_HIGH').add(val);
                        break;
                    case 'MEDIUM':
                        severity.get('MEDIUM').add(val);
                        break;
                    case 'LOW' :
                        severity.get('LOW').add(val);
                        break;
                }
            }
            if (val.severity) {
                switch (val.checkpoint) {
                    case 'REGISTER':
                        checkpoint.get('REGISTER').add(val);
                        break;
                    case 'TRANSACTION':
                        checkpoint.get('TRANSACTION').add(val);
                        break;
                    case 'LOGIN' :
                        checkpoint.get('LOGIN').add(val);
                        break;
                    case 'GENERAL' :
                        checkpoint.get('GENERAL').add(val);
                        break;
                    case 'ADD_PAYMENT_METHOD' :
                        checkpoint.get('ADD_PAYMENT_METHOD').add(val);
                        break;
                }
            }


        })


        response['todaysCustomers'] = customers.size;
        response['todaysSuspiciousCustomers'] = suspiciousCustomers.size;
        response['todaysSuspiciousCustomersPercent'] = response['todaysSuspiciousCustomers'] / response['todaysCustomers'] * 100;

        response['todaysSuspiciousTransactions'] = todaysSuspiciousTransactions.length;
        let TodaysTransactions = checkpoint.get('TRANSACTION').size
        response['todaysSuspiciousTransactionPercent'] = response['todaysSuspiciousTransactions'] / TodaysTransactions * 100;

        let todaysTransactionsAmountSum = 0;
        let todaysTransactionsSuspiciousAmountSum = 0;
        for (let event of checkpoint.get('TRANSACTION')) {
            if (event.amount) todaysTransactionsAmountSum += event.amount
            if (event.amount && event.severity == 'VERY_HIGH') todaysTransactionsSuspiciousAmountSum += event.amount
        }
        response['todaysSuspiciousAmountPercent'] = todaysTransactionsSuspiciousAmountSum / todaysTransactionsAmountSum * 100;

        let todaysVeryHighSeverityTransactions = [];
        let todaysMediumSeverityTransactions = [];
        let todaysLowSeverityTransactions = [];

        severity.get('VERY_HIGH').forEach(val => {
            if (val.checkpoint == 'TRANSACTION') todaysVeryHighSeverityTransactions.push(val.amount)
        });
        severity.get('MEDIUM').forEach(val => {
            if (val.checkpoint == 'TRANSACTION') todaysMediumSeverityTransactions.push(val.amount)
        });
        severity.get('LOW').forEach(val => {
            if (val.checkpoint == 'TRANSACTION') todaysLowSeverityTransactions.push(val.amount)
        });

        response['todaysVeryHighSeverityTransactions'] = todaysVeryHighSeverityTransactions.length;
        response['todaysMediumSeverityTransactions'] = todaysMediumSeverityTransactions.length;
        response['todaysLowSeverityTransactions'] = todaysLowSeverityTransactions.length;


        response['todaysVeryHighSeverityAmounts'] = todaysVeryHighSeverityTransactions.reduce((a, b) => a + b, 0)
        response['todaysMediumSeverityAmounts'] = todaysMediumSeverityTransactions.reduce((a, b) => a + b, 0)
        response['todaysLowSeverityAmounts'] = todaysLowSeverityTransactions.reduce((a, b) => a + b, 0);


        response['todaysRegistersData'] = checkpoint.get('REGISTER').size;
        response['todaysLoginsData'] = checkpoint.get('LOGIN').size;
        response['todaysGeneralsData'] = checkpoint.get('GENERAL').size;
        response['todaysAddPaymentMethodsData'] = checkpoint.get('ADD_PAYMENT_METHOD').size;
        response['todaysTransactionsData'] = checkpoint.get('TRANSACTION').size;

        return response;
    },

    createRiskCsvFile(data) {
        fs.truncate(riskEventUtils.riskFilePath, 0, function () {
            console.log('The CSV file was truncated')
        })

        let constArray = [];
        let headers = data.data[0];

        if (!headers) return riskEventUtils.riskFilePath;

        Object.keys(headers).forEach(key => {
            constArray.push({id: key, title: key.charAt(0).toUpperCase() + key.slice(1)});
        })

        const csvWriter = createCsvWriter({
            path: riskEventUtils.riskFilePath,
            header: constArray
        });

        csvWriter
            .writeRecords(data.data)
            .then(() => console.log('The CSV file was written successfully'));

        return csvWriter.fileWriter.path;
    },


    getCsvContent(filePath, callback) {
        fs.readFile(filePath, function (err, data) {
            callback(data.toString());
        });
    },

    /**
     * Function will return a new date object from last 24 hours or last 30
     * days depends on the signature passed boolean
     * @param isYesterdayRequest - Determine if the request for last 24 hours or last 30 days
     * @returns {Date}
     */
    // getDateHelper(isYesterdayRequest) {
    //     let date = null
    //     if (isYesterdayRequest === "true") {
    //         let last24Hours = Date.now() - (8.64e+7);
    //         date = new Date(last24Hours);
    //     } else {
    //         let last30Days = Date.now() - (2.592e+9);
    //         date = new Date(last30Days);
    //     }
    //     return date
    // },

    getDateHelper(isYesterdayRequest) {
        let date = new Date();
        if (isYesterdayRequest === "true") {
            return '2020-06-05 00:00:00.000000';
        }
        else {
            return '2020-01-01 00:00:00.000000'
        }
    },

    /**
     * Hash Password Method
     * @param {string} password
     * @returns {string} returns hashed password
     */
    hashPassword(password) {
        return bcrypt.hashSync(password, bcrypt.genSaltSync(8))
    },
    /**
     * comparePassword
     * @param {string} hashPassword
     * @param {string} password
     * @returns {Boolean} return True or False
     */
    comparePassword(hashPassword, password) {
        return bcrypt.compareSync(password, hashPassword);
    },
    /**
     * isValidEmail helper method
     * @param {string} email
     * @returns {Boolean} True or False
     */
    isValidEmail(email) {
        return /\S+@\S+\.\S+/.test(email);
    },
    /**
     * Generate Token, this is used when decrypting also.
     * @param {string} id
     * @param {string} userRole
     * @returns {string} token
     */
    /**
     *
     * @param {object} object
     * @param {string} object.id
     * @param {string} object.userRole
     * @param {string} object.name
     * @param {string} object.email
     * @return {undefined|*}
     */
    generateToken(object) {
        if (!object.id || !object.userRole) {
            return false
        }
        const token = jwt.sign({
                userId: object.id,
                role: object.userRole,
                name: object.name,
                email: object.email
            },
            process.env.SECRET, {expiresIn: process.env.TOKEN_EXPIRES_IN || '7d'}
        );
        return token;
    },
    /**
     * @example
     * ?filters[severity]=VERY_HIGH&filters[severity]=LOW&sort[score]=asc&sort[userid]=desc
     * ?filters[timestamp|>]=2019-01-01T00:00:00Z&sort[timestamp]=desc
     * ?filters[severity]=VERY_HIGH&filters[severity]=LOW&ranges[timestamp|>]=2020-01-01&ranges[timestamp|<]=2020-01-02&filters[checkpoint]=TRANSACTION&sort[timestamp]=desc
     * @param {object} uriObject
     * @example
     * {"timestamp|>": "2020-01-01","timestamp|<": "2020-01-02"}
     * {"severity": ["VERY_HIGH","LOW"]}
     * {"checkpoint: TRAN*A*}
     * {"timestamp": "desc"}
     * @return {[]|object[]<object.filterName,object.filterValue>}
     * @example returns
     */
    parseUrl(uriObject) {

        if (uriObject) {
            let newUriObject = {};
            let replaceObject = false;
            for (const [key, value] of Object.entries(uriObject)) {
                let keyA = key;
                let valueA = value;

                if (keyA.includes('smallEquals')) {
                    let newKey = keyA.replace('smallEquals', '>=')
                    newUriObject[newKey] = valueA;
                    replaceObject = true;
                } else if (keyA.includes('bigEquals')) {
                    let newKey = keyA.replace('bigEquals', '<=')
                    newUriObject[newKey] = valueA;
                    replaceObject = true;
                }
            }
            if (replaceObject) uriObject = newUriObject;
        }

        const allowedOperators = ['<', '<=', '>', '>=', '=', '*'];
        const arr = [];
        for (let singleFilter in uriObject) {
            if (uriObject.hasOwnProperty(singleFilter)) {
                let sf = uriObject[singleFilter];
                //maybe better solution then checking of object|array ?
                if (typeof sf === 'object') {
                    for (let i = 0; i < sf.length; i++) {
                        let filterObject = {};
                        let parts = singleFilter.split('|');
                        filterObject.filterName = parts[0];
                        if (sf[i].includes('*')) {
                            filterObject.operator = 'LIKE';
                            filterObject.filterValue = sf[i].replace(/\*/g, '%')
                        } else {
                            if (parts.length > 1) {
                                filterObject.operator = allowedOperators.includes(parts[1]) ? parts[1] : '='
                            }
                            filterObject.filterValue = sf[i];
                        }
                        arr.push(filterObject)
                    }
                } else {
                    let filterObject = {};
                    let parts = singleFilter.split('|');
                    filterObject.filterName = parts[0];
                    if (uriObject[singleFilter].includes('*')) {
                        filterObject.operator = 'LIKE';
                        filterObject.filterValue = uriObject[singleFilter].replace(/\*/g, '%')
                    } else {
                        if (parts.length > 1) {
                            filterObject.operator = allowedOperators.includes(parts[1]) ? parts[1] : '='
                        }
                        filterObject.filterValue = uriObject[singleFilter];
                    }
                    arr.push(filterObject)
                }
            }
        }
        return arr;
    },
    /**
     * @summary Enums globally defined
     * @return {{CheckPointType: {REGISTER: string, LOGIN: string, TRANSACTION: string, UPDATE_DETAILS: string, GENERAL: string, ADD_PAYMENT_METHOD: string, LAUNCH: string}, RiskLevel: {VERY_HIGH: string, HIGH: string, MEDIUM: string, LOW: string, EXPIRED: string, FAIL: string}, CheckPointStatus: {DENIED: string, CANCELLED: string, APPROVED: string}}}
     */
    getEnums() {
        CheckPointType = {
            LAUNCH: 'LAUNCH',
            REGISTER: 'REGISTER',
            LOGIN: 'LOGIN',
            TRANSACTION: 'TRANSACTION',
            UPDATE_DETAILS: 'UPDATE_DETAILS',
            ADD_PAYMENT_METHOD: 'ADD_PAYMENT_METHOD',
            GENERAL: 'GENERAL'
        };


        CheckPointStatus = {
            APPROVED: 'APPROVED',
            DENIED: 'DENIED',
            CANCELLED: 'CANCELLED'
        };

        RiskLevel = {
            LOW: 'LOW',
            MEDIUM: 'MEDIUM',
            HIGH: 'HIGH',
            VERY_HIGH: 'VERY_HIGH',
            FAIL: 'FAIL',
            EXPIRED: 'EXPIRED'
        };

        AuditTrailResources = {
            LOGIN: 'Login',
            LOGOUT: 'Logout',
            DELETE_USER: 'Delete User',
            CREATE_USER: 'Create User',
            UPDATE_USER: 'Update User',
            EMAIL_REGISTRATION: 'Email Registration',
            USER_VERIFICATION: 'User Verification',
            RESET_PASSWORD: 'Reset Password',
            GET_USERS: 'Get Users',
            RISK_EVENTS: 'Risk Events',

        }

        return {CheckPointType, CheckPointStatus, RiskLevel, AuditTrailResources}
    },
    /**
     * @example groupBy(someArray, 'filters')
     * @summary vanilla js groupBy
     * @param {array|object} objectArray
     * @param {string} property
     * @return {object}
     */
    groupBy(objectArray, property) {
        return objectArray.reduce(function (acc, obj) {
            let key = obj[property];
            if (!acc[key]) {
                acc[key] = []
            }
            acc[key].push(obj);
            return acc
        }, {})
    },
    /**
     * @summary Removes empty objects from object
     * @param {object} obj
     */
    removeEmptyObjectProperties(obj) {
        Object.keys(obj).forEach(key => {
            if (obj && obj[key] && typeof obj[key] === "object") {
                this.removeEmptyObjectProperties(obj[key]);
                if (!Object.keys(obj[key]).length) {
                    delete obj[key];
                }
            }
        });
    },
    /**
     * @function Handle json file configuration with
     * @param {json} json
     * @param {*} fields
     * @param {string} role
     * @return {object}
     */
    remapJson(json, fields, role) {
        for (let singleFieldDef in fields) {
            if (fields.hasOwnProperty(singleFieldDef)) {
                for (let jsonField in json) {
                    if (json.hasOwnProperty(jsonField)) {
                        if (jsonField === singleFieldDef && typeof json[jsonField] !== "object") {
                            let temp = json[jsonField];
                            delete json[jsonField]
                            if (fields[singleFieldDef][role] !== false) {

                                if (fields[singleFieldDef].fieldType && fields[singleFieldDef].fieldType === "uppercase") {
                                    json[fields[singleFieldDef].label] = temp.replace(/_/g, " ").toLowerCase()
                                        .split(' ')
                                        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
                                        .join(' ');
                                } else if (fields[singleFieldDef].fieldType && fields[singleFieldDef].fieldType === "timestamp") {
                                    let dt = new Date(temp)
                                    let month = dt.getMonth() + 1 < 10 ? "0" + (dt.getUTCMonth() + 1) : (dt.getUTCMonth() + 1)
                                    let days = dt.getUTCDate() < 10 ? "0" + dt.getUTCDate() : dt.getUTCDate()
                                    let hours = dt.getUTCHours() < 10 ? "0" + dt.getUTCHours() : dt.getUTCHours()
                                    let minutes = dt.getUTCMinutes() < 10 ? "0" + dt.getUTCMinutes() : dt.getUTCMinutes()
                                    json[fields[singleFieldDef].label] =
                                        days + "/" + month + "/" + dt.getFullYear() + " " + hours + ":" + minutes

                                } else if (fields[singleFieldDef].fieldType && fields[singleFieldDef].fieldType === "integer") {

                                    json[fields[singleFieldDef].label] = parseInt(temp, 10);
                                } else if (fields[singleFieldDef].fieldType && fields[singleFieldDef].fieldType === "split") {
                                    json[fields[singleFieldDef].label] = temp.replace(/_/g, " ");
                                } else if (fields[singleFieldDef].fieldType && fields[singleFieldDef].fieldType === "amount") {
                                    let Stringvalue = String(temp);
                                    let decimalSplit = Stringvalue.split('.')

                                    if (decimalSplit.length > 0) {
                                        temp = temp.toFixed(2);
                                    } else {
                                        temp = Stringvalue + ".00";
                                    }
                                    json[fields[singleFieldDef].label] = temp;
                                } else {
                                    json[fields[singleFieldDef].label] = temp;
                                }
                            }
                        } else if (jsonField === singleFieldDef && !Object.keys(json[jsonField]).length) {
                            // console.log(jsonField, 'doesnt have child we should delete it')
                            delete json[jsonField]
                        } else if (jsonField === singleFieldDef && typeof json[jsonField] === "object" && (fields[singleFieldDef] && fields[singleFieldDef].fields)) {
                            let temp2 = json[jsonField]
                            delete json[jsonField]
                            json[fields[singleFieldDef].label] = temp2;
                            this.remapJson(json[fields[singleFieldDef].label], fields[singleFieldDef].fields, role)
                        }
                    }
                }
            }
        }
        return json
    },
    /**
     * Getter for static file configuration
     *
     * @return {[]}
     */
    getJsonConfig() {
        return jsonFile && jsonFile.fields ? jsonFile.fields : undefined;
    },
    /**
     * Function for sending email
     * @param {string} to - to email string
     * @param {string} [from] - from email string
     * @param {object} content - object containing properties
     * @param {string} content.template - template name in folder
     * @param {string} content.subject - subject in email
     * @param {string} content.registration_number - registration_number in email
     */
    sendEmail(to, content, from) {
        return new Promise((resolve, reject) => {
            //setting up transport for sending gmail/smtp ...
            emailTransport.useViewWithTransport(SMTPTransport);

            const HelperOptions = {
                from: from || processEnv.EMAIL_FROM,
                to: to,
                subject: content.subject,
                template: content.template,
                context: content
            };

            //verify SMTP server params in config file
            SMTPTransport.verify((err, success) => {
                if (err) reject(err)
                //send email
                SMTPTransport.sendMail(HelperOptions, (error, info) => {
                    if (error) reject(error)
                    resolve(info);
                });
            })
        })
    },
    encryptXor(text, key) {
        let result = '';
        for (let i = 0; i < text.length; i++) {
            result += String.fromCharCode(text.charCodeAt(i) ^ key.charCodeAt(i % key.length));
        }
        return result;
    }
};
module.exports = Helper;
