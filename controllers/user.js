'use strict'

var User = require('../models/user');
var authUser = require('../middleware/auth-user');
var restrictUser = require('../middleware/restrict-user');

var PRICES = {
  '632f0aa6-5bc9-4fa3-a0f4-d6b08e24638d': 1000,
  '8079f7a9-0bac-47d9-90df-775fc4c0c9c7': 2000,
  'bce8d35a-eb30-4bf7-aab5-b6b9e0c89199': 3000,
  '9cd6fc90-78f8-425f-9f58-dbbaef819a44': 4000,
  '9b0e60c6-2408-4fb3-a6c2-b7fd3c33a13f': 5000,
};
var DEFAULT_PRICE_ID = '632f0aa6-5bc9-4fa3-a0f4-d6b08e24638d';

function login(res, userId) {
  res.cookie('ssuid', userId, { httpOnly: true });
}

function logout(res) {
  res.clearCookie('ssuid');
}

module.exports = function (app) {
  app.get('/login', restrictUser(), function (req, res) {
    var email = req.query.email || '';
    var error = req.query.error || '';

    res.render('user/login', { email: email, error: error });
  });

  app.post('/user/session/create', restrictUser(), function (req, res) {
    var user = { email: req.body.email };
    var password = req.body.password;

    User.checkPassword(user, password, function (err, user) {
      if (err) return res.render('user/login', { user: user, error: err });

      login(res, user.id);

      return res.redirect('/courses');
    });
  });

  app.post('/user/session/destroy', function (req, res) {
    logout(res);
    res.redirect('/login');
  });

  app.get('/signup', restrictUser(), function (req, res) {
    // We are using gid to map to price uuids.
    var gidCookie = req.cookies.ssgid;
    var gidParam = req.query.gid || DEFAULT_PRICE_ID;
    var priceInCents = PRICES[gidCookie] || PRICES[DEFAULT_PRICE_ID];

    if (!gidCookie) {
      res.cookie('ssgid', gidParam, { httpOnly: true });
      priceInCents = PRICES[gidParam];
    }

    res.render('user/new', { price: Math.floor(priceInCents / 100) });
  });

  app.post('/user/create', restrictUser(), function (req, res) {
    var gidCookie = req.cookies.ssgid || DEFAULT_PRICE_ID;
    var priceInCents = PRICES[gidCookie] || PRICES[DEFAULT_PRICE_ID];
    var user = {
      full_name: req.body.full_name,
      email: req.body.email,
      password: req.body.password,
    };

    User.create(user, function (err, id) {
      if (err) {
        return res.render('user/new', {
          user: user,
          error: err,
          price: Math.floor(priceInCents / 100),
        });
      }

      login(res, id);

      res.redirect('/beta/purchase');
    });
  });

  app.get('/beta/purchase', authUser(), restrictUser('paid'), function (req, res) {
    var gidCookie = req.cookies.ssgid || DEFAULT_PRICE_ID;
    var priceInCents = PRICES[gidCookie] || PRICES[DEFAULT_PRICE_ID];

    res.render('user/beta-purchase', {
      stripePublicKey: process.env.STRIPE_PUBLIC_KEY,
      price: Math.floor(priceInCents / 100),
    });
  });

  app.post('/beta/purchase', authUser(), restrictUser('paid'), function (req, res) {
    var stripeToken = req.body.stripeToken;
    var gidCookie = req.cookies.ssgid || DEFAULT_PRICE_ID;
    var priceInCents = PRICES[gidCookie] || PRICES[DEFAULT_PRICE_ID];
    var user = req.user;

    User.addCustomerAndCharge(user, stripeToken, priceInCents, function (err) {
      if (err) {
        console.log(err);
        // TODO add error to query.
        return res.redirect('/beta/purchase');
      }

      res.redirect('/courses');
    });
  });
};
