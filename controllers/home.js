'use strict'

var path = require('path');
var gidUtil = require('../util/gid');
var errorUtil = require('../util/error');
var ensureGid = require('../middleware/ensure-gid');

module.exports = function (app) {
  app.get('/', function (req, res, next) {
    var gidCookie = req.cookies.ssgid;
    var priceInCents = gidUtil.PRICES[gidCookie] || gidUtil.PRICES[gidUtil.DEFAULT_PRICE_ID];

    res.render('landing-pages/become-a-software-developer-without-a-college-degree-weekly-email', {
      currentPath: '/become-a-software-developer-without-a-college-degree-weekly-email',
      price: Math.floor(priceInCents / 100),
      stripePublicKey: process.env.STRIPE_PUBLIC_KEY,
    });
  });

  // Catch all check for existing landing pages.
  app.get('/*', ensureGid, function (req, res, next) {
    var path = req.path;
    var gidCookie = req.cookies.ssgid;
    var priceInCents = gidUtil.PRICES[gidCookie] || gidUtil.PRICES[gidUtil.DEFAULT_PRICE_ID];

    // Check if path has extension and 404 if does.  Landing pages don't have
    // extensions.
    if (/\/[^\/]+\.[^\/]+$/.test(path)) return next(new errorUtil.PageNotFoundError(path));

    res.render('landing-pages' + path, {
      price: Math.floor(priceInCents / 100),
      stripePublicKey: process.env.STRIPE_PUBLIC_KEY,
    }, function (err, html) {
      if (err) {
        console.log(err);
        return next(new errorUtil.PageNotFoundError(path));
      }
      res.send(html);
    });
  });
};
