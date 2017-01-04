'use strict'

var stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

var User = require('../models/user');
var authUser = require('../middleware/auth-user');


function login(res, userId) {
  res.cookie('ssuid', userId, { httpOnly: true });
}

function logout(res) {
  res.clearCookie('ssuid');
}

module.exports = function (app) {
  app.get('/login', function (req, res) {
    var email = req.query.email || '';
    var error = req.query.error || '';

    res.render('user/login', { email: email, error: error });
  });

  app.post('/user/session/create', function (req, res) {
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

  app.get('/signup', function (req, res) {
    res.render('user/new');
  });

  app.post('/user/create', function (req, res) {
    var user = {
      full_name: req.body.full_name,
      email: req.body.email,
      password: req.body.password,
    };

    User.create(user, function (err, id) {
      if (err) return res.render('user/new', { user: user, error: err });

      login(res, id);

      res.redirect('/beta/purchase');
    });
  });

  app.get('/beta/purchase', authUser(), function (req, res) {
    res.render('user/beta-purchase');
  });

  app.post('/beta/purchase', authUser(), function (req, res) {
    var stripeToken = req.body.stripeToken;

    var charge = stripe.charges.create({
      amount: 1000,
      currency: "usd",
      source: stripeToken,
      description: "Spark School Beta Access"
    }, function(err, charge) {
      if (err && err.type === 'StripeCardError') {
        console.log(err);
        // TODO add error to query.
        return res.redirect('/beta/purchase');
      }

      User.makePaid(req.user, function (err) {
        if (err) {
          // TODO add error to query.
          return res.redirect('/beta/purchase');
        }

        res.redirect('/courses');
      });
    });
  });
};
