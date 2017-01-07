'use strict'

module.exports = function (req, res, next) {
  // Add to res.locals so it's accessible from our views.
  res.locals.current_user = req.user;
  res.locals.current_path = req.path;
  next()
};
