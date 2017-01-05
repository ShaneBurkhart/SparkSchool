'use strict'

var path = require('path');
var errorUtil = require('../util/error');

module.exports = function (app) {
  app.get('/', function (req, res, next) {
    res.redirect('/signup');
  });
};
