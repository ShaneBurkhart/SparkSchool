'use strict'

module.exports = function (app) {
  app.post('/paypal-webhook', function (req, res) {
    res.send(req.body);
  });
};
