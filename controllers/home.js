'use strict'

var path = require('path');
var gidUtil = require('../util/gid');
var errorUtil = require('../util/error');
var ensureGid = require('../middleware/ensure-gid');

module.exports = function (app) {
  app.get('/', function (req, res, next) {
    var gidCookie = req.cookies.ssgid;
    var priceInCents = gidUtil.PRICES[gidCookie] || gidUtil.PRICES[gidUtil.DEFAULT_PRICE_ID];

    res.render('landing-pages/homepage-saas-course', {
      currentPath: '/homepage-saas-course',
      price: Math.floor(priceInCents / 100),
    });
  });

  // Catch all check for existing landing pages.
  app.get('/*', ensureGid, function (req, res, next) {
    var path = req.path;
    var gidCookie = req.cookies.ssgid;
    var priceInCents = gidUtil.PRICES[gidCookie] || gidUtil.PRICES[gidUtil.DEFAULT_PRICE_ID];
    var query = req.query || {};

    // SumoMe isn't URI encoding emails when sending them as GET vars.
    // We need to replace spaces with plus signs.
    if (query.email) query.email = query.email.replace(/ /g, '+');

    // Check if path has extension and 404 if does.  Landing pages don't have
    // extensions.
    if (/\/[^\/]+\.[^\/]+$/.test(path)) return next(new errorUtil.PageNotFoundError(path));

    res.render('landing-pages' + path, {
      query: query,
      price: Math.floor(priceInCents / 100),
      stripePublicKey: process.env.STRIPE_PUBLIC_KEY,
    }, function (err, html) {
      if (err) return next(new errorUtil.PageNotFoundError(path));
      res.send(html);
    });
  });
};
