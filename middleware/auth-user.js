'use strict'

var User = require('../models/user');

module.exports = function (role) {
  return function (req, res, next) {
    var user = req.user;
    if (!user) return res.redirect('/login');

    if (role) {
      switch (role) {
        case 'paid':
          if (user.status !== 'paid') return res.redirect('/beta/purchase');
      }
    }

    next();
  };
};
