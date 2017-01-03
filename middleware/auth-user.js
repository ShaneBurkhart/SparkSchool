'use strict'

var User = require('../models/user');

module.exports = function (role) {
  return function (req, res, next) {
    var userId = req.cookies.ssuid;

    if (!userId) return res.redirect('/login');

    User.findById(userId, function (err, user) {
      if (!user) return res.redirect('/login');

      if (role) {
        switch (role) {
          case 'paid':
            if (user.status !== 'paid') return res.redirect('/beta/purchase');
        }
      }

      req.user = user;
      next();
    });
  };
};
