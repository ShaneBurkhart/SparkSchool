'use strict'

var User = require('../models/user');

module.exports = function (req, res, next) {
  var userId = req.cookies.ssuid;

  if (!userId) return res.redirect('/login');

  User.findById(userId, function (err, user) {
    if (!user) return res.redirect('/login');
    next();
  });
};
