const express = require('express');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const path = require('path');
const cors = require('cors');

require("dotenv").config({
    path: path.join(__dirname, ".env")
});

//knex session storage
const KnexSessionStore = require("connect-session-knex")(session);
const knex = require("./db/connection");
const store = new KnexSessionStore({
    knex: knex,
    tablename: "session"
});

const routes = require('./router/routes');

const app = express();

//using pg for session storage
app.use(session({
    store: store,
    secret: process.env.SECRET,
    resave: true,
    saveUninitialized: false
}));

app.use(express.json());

const corsOptionsDelegate = function (req, callback) {
    let corsOptions = {
        origin: req.headers.origin, credentials: true,
        allowedHeaders: ['Content-Type', 'Authorization', 'x-access-token']
    } // reflect (enable) the requested origin in the CORS response
    callback(null, corsOptions) // callback expects two parameters: error and options
}


app.use(cors(corsOptionsDelegate));

app.options('*', cors(corsOptionsDelegate));

app.use(express.urlencoded({extended: false}));
app.use(cookieParser());

app.use(routes);


app.get('*', function (req, res, next) {
    setImmediate(function(){
        next(new Error(res.statusCode + ' Get -Ohh!! Something went wrong'));
    }
      
 );
});

app.use(function (error, req, res, next) {
    res.json({message: error.message});
});

module.exports = app;
