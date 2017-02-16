'use strict'

var async = require('async');
var uuidV4 = require('uuid/v4');
var sixpack = require('sixpack-client');

var AB_CLIENT_ID_COOKIE = 'ssab';

// Array of all A/B tests. Each test specifies the page its "path" and "conversion_path".
var TESTS = [
  {
    name: 'first_test',
    path: '/become-a-software-developer-guide',
    conversion_path: 'the-full-guide-to-becoming-a-software-developer',
    alternatives: ['blue', 'yellow'],
  }
];

function getSession(req, res) {
  var clientId = req.cookies[AB_CLIENT_ID_COOKIE] || uuidV4();
  res.cookie(AB_CLIENT_ID_COOKIE, clientId);

  return new sixpack.Session({
    client_id: clientId,
    base_url: 'http://sixpack.trysparkschool.com:5000',
    ip_address: req.ip,
    user_agent: req.headers['user-agent'],
  });
}

// Loads tests for various routes and adds their values to template variables.
module.exports = function (req, res, next) {
  var path = req.path.replace(/\/$/, '');
  var abSession = getSession(req, res);

  res.locals.abTests = res.locals.abTests || {};

  console.log(path);
  async.each(TESTS, function (test, testCallback) {
    console.log(test.name);
    console.log(test.path);
    // Async load and convert tests if they match the current path.
    if (path === test.path) {
      // Add A/B test to templates if on path
      abSession.participate(test.name, test.alternatives, function (err, sixpackRes) {
        var alternative = test.alternatives[0];
        console.log(err);
        console.log(sixpackRes);
        if (!err) alternative = sixpackRes.alternative.name;

        res.locals.abTests[test.name] = alternative;

        testCallback();
      });
    } else if (path === test.conversion_path) {
      // Add conversion if on conversion_path
      abSession.convert(test.name, function (err, res) { testCallback(); });
    }
  }, function () {
    // Runs when all tests are done running.
    next();
  });
};

