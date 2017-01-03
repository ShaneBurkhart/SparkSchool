'use strict'

var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var express = require('express');
var app = express();

var db = require('./db/db');
var addControllers = require('./controllers/index');

app.engine('html', require('pug').renderFile);
app.set('views', './views');
app.set('view engine', 'pug');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());

addControllers(app);

app.use(function (err, req, res, next) {
  if (!err) return next();

  console.log(err.message);

  switch(err.name) {
    case 'PageNotFoundError':
      res.status(404).send(err.message);
      break;
    default:
      res.status(500).send('There was an internal error.');
      break;
  }

  next();
});

app.listen(80, function () {
  console.log('Listening on port 8080');
});
