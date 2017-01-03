'use strict'

var path = require('path');
var errorUtil = require('../util/error');
var authUser = require('../middleware/auth-user');

module.exports = function (app) {
  app.get('/courses', authUser('paid'), function (req, res) {
    res.render('courses/index');
  });

  app.get('/courses/*', authUser('paid'), function (req, res, next) {
    var relativePath = __dirname + '/../courses/_site' + req.path + '.html';
    var absolutePath = path.resolve(relativePath);

    res.sendFile(absolutePath, function (err) {
      if (err) next(new errorUtil.PageNotFoundError(req.path));
    });
  });
};
