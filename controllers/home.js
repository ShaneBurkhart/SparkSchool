'use strict'

var path = require('path');
var errorUtil = require('../util/error');

module.exports = function (app) {
  app.get('/', function (req, res, next) {
    var relativePath = [__dirname, '..', 'index.html'].join('/');
    var absolutePath = path.resolve(relativePath);

    res.sendFile(absolutePath, function (err) {
      if (err) next(new errorUtil.PageNotFoundError(req.path));
    });
  });
};
