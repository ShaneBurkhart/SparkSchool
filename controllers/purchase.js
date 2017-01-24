'use strict'

var ActiveCampaign = require('activecampaign');
var stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);
var activeCampaign = new ActiveCampaign(
  "https://sparkschool.api-us1.com",
  process.env.ACTIVE_CAMPAIGN_KEY
);

var TWITTER_CLONE_DESC = "Twitter Clone Course - Spark School";

module.exports = function (app) {
  app.post('/:type/signup', function (req, res) {
    var type = req.params.type || 'become-a-software-dev-email-series';
    var email = req.body.email;
    var origin = req.body.origin || '/';
    var thankYouPage = '/become-a-software-dev-email-series-thank-you';

    if (!/\S+@\S+.\S+/.test(email)) {
      return res.redirect([
        origin,
        '?email=' + email,
        '&error=' + encodeURIComponent('That email is invalid.'),
        '#sign-up',
      ].join(''));
    }

    var contact = {
      'email': email,
      // Take later list
      'p[7]': '7',
    };

    switch (type) {
      case 'nodejs-tutorial':
        contact['p[7]'] = '7';
        thankYouPage = '/take-tutorial-later-thank-you';
        break;
      case 'become-a-software-dev-email-series':
      default:
        contact['p[8]'] = '8';
        thankYouPage = '/become-a-software-dev-email-series-thank-you';
        break;
    }

    if (process.env.APP_ENV === 'development') contact.tags = 'development';

    var acCallback = function () { res.redirect([
      thankYouPage,
      '?email=' + email,
    ].join('')); };

    activeCampaign.api('contact/add', contact).then(acCallback, acCallback);
  });

  app.post('/twitter-clone/purchase', function (req, res) {
    var email = req.body.email;
    var origin = req.body.origin || '/';
    var stripeToken = req.body.stripeToken;

    if (!/\S+@\S+.\S+/.test(email)) {
      return res.redirect([
        origin,
        '?email=' + email,
        '&error=' + encodeURIComponent('That email is invalid.'),
        '#sign-up',
      ].join(''));
    }

    var charge = stripe.charges.create({
      amount: 1000,
      currency: "usd",
      source: stripeToken,
      description: TWITTER_CLONE_DESC,
      receipt_email: email,
    }, function(err, charge) {
      if (err) {
        return res.redirect([
          origin,
          '?email=' + email,
          '&error=' + encodeURIComponent(err.message),
          '#sign-up',
        ].join(''));
      }

      var acCallback = function () { res.redirect('/twitter-clone-thank-you'); };
      var contact = {
        'email': email,
        // Twitter clone list
        'p[1]': '1',
      };

      activeCampaign.api('contact/add', contact).then(acCallback, acCallback);
    });
  });
}
