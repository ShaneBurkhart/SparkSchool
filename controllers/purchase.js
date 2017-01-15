'use strict'

var ActiveCampaign = require('activecampaign');
var stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);
var activeCampaign = new ActiveCampaign(
  "https://sparkschool.api-us1.com",
  process.env.ACTIVE_CAMPAIGN_KEY
);

var TWITTER_CLONE_DESC = "Twitter Clone Course - Spark School";

module.exports = function (app) {
  app.post('/twitter-clone/purchase', function (req, res) {
    var email = req.body.email;
    var stripeToken = req.body.stripeToken;
    // TODO Add email with paid tag

    var charge = stripe.charges.create({
      amount: 1000,
      currency: "usd",
      source: stripeToken,
      description: TWITTER_CLONE_DESC,
    }, function(err, charge) {
      if (err) {
        return res.redirect([
          '/source-code-thank-you',
          '?email=' + email,
          '&error=' + err.message,
        ].join(''));
      }

      // TODO redirect to thank you page
      res.redirect('/');
    });
  });
}
