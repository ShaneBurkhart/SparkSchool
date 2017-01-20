'use strict'

// Site wide 301 redirect mappings.
// Generally used for backwards compatibility.
var REDIRECTS = {
  '/tutorials/build-and-deploy-nodejs-app-to-heroku': '/tutorials/build-and-deploy-nodejs-app-to-heroku/intro',
};

module.exports = function (req, res, next) {
  var path = req.path.replace(/\/$/, '');
  var redirect = REDIRECTS[path];

  if (redirect) return res.redirect(redirect);

  next();
};