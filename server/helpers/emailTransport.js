require('dotenv').config();
const nodemailer = require('nodemailer');
const Hbs = require('nodemailer-express-handlebars');
const processEnv = process.env;

exports.GmailTransport = nodemailer.createTransport({
    service: processEnv.GMAIL_SERVICE_NAME,
    host: processEnv.GMAIL_SERVICE_HOST,
    secure: processEnv.GMAIL_SERVICE_SECURE,
    port: processEnv.GMAIL_SERVICE_PORT,
    auth: {
        user: processEnv.GMAIL_USER_NAME,
        pass: processEnv.GMAIL_USER_PASSWORD
    }
})

exports.SMTPTransport = nodemailer.createTransport({
    host: processEnv.SMTP_SERVICE_HOST,
    port: processEnv.SMTP_SERVICE_PORT,
    secure: processEnv.SMTP_SERVICE_SECURE,
    debug: processEnv.NODE_ENV === 'development',
    auth: {
        user: processEnv.SMTP_USER_NAME,
        pass: processEnv.SMTP_USER_PASSWORD
    }
});

exports.useViewWithTransport = (transport) => {
    const handlebarOptions = {
        viewEngine: {
            extName: '.handlebars',
            partialsDir: 'views/email/partials',
            defaultLayout: false
        },
        viewPath: 'views/email',
        extName: '.handlebars',
        layoutsDir: 'views/email/layouts'
    };
    transport.use('compile', Hbs(handlebarOptions));
}