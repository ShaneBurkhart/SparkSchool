'use strict'

var express = require('express');
var app = express();

var db = require('./db/db');
var addControllers = require('./controllers/index');

app.engine('html', require('pug').renderFile);
app.set('views', './views');
app.set('view engine', 'pug');

addControllers(app);

app.use(function(err, req, res, next) {
  console.log(err.message);

  switch(err.name) {
    case 'PageNotFoundError':
      return res.status(404).send(err.message);
    default:
      return res.status(500).send('There was an internal error.');
  }
});

app.listen(80, function() {
  console.log('Listening on port 8080');
});
