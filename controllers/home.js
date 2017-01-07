'use strict'

var path = require('path');
var errorUtil = require('../util/error');
var ensureGid = require('../middleware/ensure-gid');

module.exports = function (app) {
  app.get('/', function (req, res, next) {
    res.render('landing-pages/build-twitter-clone');
  });

  app.get('/saas-course-beta', ensureGid, function (req, res, next) {
    res.render('landing-pages/saas-course');
  });
};
