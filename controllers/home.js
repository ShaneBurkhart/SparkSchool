'use strict'

var path = require('path');
var gidUtil = require('../util/gid');
var errorUtil = require('../util/error');
var ensureGid = require('../middleware/ensure-gid');

module.exports = function (app) {
  app.get('/', function (req, res, next) {
    res.render('landing-pages/build-twitter-clone', {
      currentPath: '/build-twitter-clone',
    });
  });

  // Catch all check for existing landing pages.
  app.get('/*', ensureGid, function (req, res, next) {
    var path = req.path;
    var gidCookie = req.cookies.ssgid;
    var priceInCents = gidUtil.PRICES[gidCookie] || gidUtil.PRICES[DEFAULT_PRICE_ID];

    res.render('landing-pages' + path, {
      price: Math.floor(priceInCents / 100),
    }, function (err, html) {
      if (err) return next(new errorUtil.PageNotFoundError(path));
      res.send(html);
    });
  });
};
