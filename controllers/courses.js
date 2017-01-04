'use strict'

var path = require('path');
var Course = require('../models/course');
var errorUtil = require('../util/error');
var authUser = require('../middleware/auth-user');

module.exports = function (app) {
  app.get('/courses', authUser('paid'), function (req, res) {
    res.render('courses/index');
  });

  // TODO add authUser('paid') middleware and whitelist twitter clone and ebay scraper.
  app.get('/courses/:course([\-a-z]+)/:section([0-9]+)/:lesson([0-9]+)', function (req, res, next) {
    var courseName = req.params.course;
    var sectionNumber = req.params.section;
    var lessonNumber = req.params.lesson;
    var relativePath = [__dirname, '..', 'courses', '_site', 'courses', courseName, sectionNumber, lessonNumber].join('/') + '.html';
    var absolutePath = path.resolve(relativePath);

    if (!Course.courseNames.includes(courseName)) {
      return next(new errorUtil.PageNotFoundError(req.path));
    }

    res.sendFile(absolutePath, function (err) {
      if (err) next(new errorUtil.PageNotFoundError(req.path));
    });
  });
};
