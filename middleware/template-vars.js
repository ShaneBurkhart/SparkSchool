'use strict'

module.exports = function (req, res, next) {
  // Add to res.locals so it's accessible from our views.
  res.locals.currentUser = req.user;
  res.locals.currentPath = req.path;
  next()
};
