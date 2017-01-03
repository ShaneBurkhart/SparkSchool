'use strict'

var User = require('../models/user');

function login(res, userId) {
  res.cookie('ssuid', userId, { httpOnly: true });
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

  app.get('/signup', function (req, res) {
    res.render('user/new');
  });

  app.post('/user/create', function (req, res) {
    var user = {
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      email: req.body.email,
      password: req.body.password,
    };

    User.create(user, function (err, id) {
      if (err) return res.render('user/new', { user: user, error: err });

      login(res, id);

      res.redirect('/courses');
    });
  });
};
