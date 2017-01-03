'use strict'

var path = require('path');

function PageNotFoundError(path) {
  this.name = 'PageNotFoundError';
  this.message = 'Couldn\'t find page: ' + path;
}

module.exports = function (app) {
  app.get('/courses/*', function (req, res, next) {
    var relativePath = __dirname + '/../courses/_site' + req.path + '.html';
    var absolutePath = path.resolve(relativePath);

    res.sendFile(absolutePath, function (err) {
      if (err) next(new PageNotFoundError(req.path));
    });
  });
};
