'use strict'

var path = require('path');
var errorUtil = require('../util/error');
var ensureGid = require('../middleware/ensure-gid');

module.exports = function (app) {
  app.get('/', function (req, res, next) {
    res.render('landing-pages/build-twitter-clone');
  });

  // Catch all check for existing landing pages.
  app.get('/*', ensureGid, function (req, res, next) {
    var path = req.path;

    res.render('landing-pages' + path, function (err, html) {
      if (err) return next(new errorUtil.PageNotFoundError(path));
      res.send(html);
    });
  });
};
