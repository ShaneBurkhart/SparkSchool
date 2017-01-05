'use strict'

var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var express = require('express');
var app = express();

var db = require('./db/db');
var addControllers = require('./controllers/index');
var errorUtil = require('./util/error');

app.engine('html', require('pug').renderFile);
app.set('views', './views');
app.set('view engine', 'pug');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());

app.use(require('./middleware/user'));

addControllers(app);

// Catch 404
app.use(function (req, res, next) {
  next(new errorUtil.PageNotFoundError(req.path));
});

app.use(function (err, req, res, next) {
  if (!err) return next();

  console.log(err.message);

  switch(err.name) {
    case 'PageNotFoundError':
      return res.status(404).render('404');
    default:
      return res.status(500).send('There was an internal error.');
  }

  next();
});

app.listen(80, function () {
  console.log('Listening on port 8080');
});
