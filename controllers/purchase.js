'use strict'

var ActiveCampaign = require('activecampaign');
var stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);
var activeCampaign = new ActiveCampaign(
  "https://sparkschool.api-us1.com",
  process.env.ACTIVE_CAMPAIGN_KEY
);

var TWITTER_CLONE_DESC = "Twitter Clone Course - Spark School";
var BECOME_DEV_GUIDE_DESC = "The Complete Guide to Becoming a Software Developer- Spark School";

module.exports = function (app) {
  app.post('/:type/signup', function (req, res) {
    var type = req.params.type || 'become-a-software-developer-email-series';
    var email = req.body.email;
    var origin = req.body.origin || '/';
    var thankYouPage = '/become-a-software-developer-email-series-thank-you';

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
    };

    switch (type) {
      case 'nodejs-tutorial':
        contact['p[7]'] = '7';
        thankYouPage = '/take-tutorial-later-thank-you';
        break;
      case 'become-a-software-developer-email-series':
      default:
        contact['p[8]'] = '8';
        thankYouPage = '/become-a-software-developer-email-series-thank-you';
        break;
    }

    if (process.env.APP_ENV === 'development') contact.tags = 'development';

    var acCallback = function () { res.redirect([
      thankYouPage,
      '?email=' + email,
    ].join('')); };

    activeCampaign.api('contact/add', contact).then(acCallback, acCallback);
  });

  app.post('/:product/purchase', function (req, res) {
    var product = req.params.product;
    var email = req.body.email;
    var origin = req.body.origin || '/';
    var stripeToken = req.body.stripeToken;
    var successRedirectURL = '/guide-to-becoming-a-software-developer-thank-you'
    var contact = { 'email': email };
    var chargeOpts = {
      currency: 'usd',
      source: stripeToken,
      receipt_email: email,
    };

    if (!/\S+@\S+.\S+/.test(email)) {
      return res.redirect([
        origin,
        '?email=' + email,
        '&error=' + encodeURIComponent('That email is invalid.'),
        '#sign-up',
      ].join(''));
    }

    switch (product) {
      case 'twitter-clone':
        // Twitter clone list id
        contact['p[11]'] = '11';
        successRedirectURL = '/twitter-clone-thank-you';
        chargeOpts.description = TWITTER_CLONE_DESC;
        chargeOpts.amount = 1000;
        break;
      case 'become-a-developer-guide':
      default:
        // Become software dev guide list id
        contact['p[9]'] = '9';
        successRedirectURL = '/guide-to-becoming-a-software-developer-thank-you';
        chargeOpts.description = BECOME_DEV_GUIDE_DESC;
        chargeOpts.amount = 700;
        break;
    }

    var charge = stripe.charges.create(chargeOpts, function(err, charge) {
      if (err) {
        return res.redirect([
          origin,
          '?email=' + email,
          '&error=' + encodeURIComponent(err.message),
          '#sign-up',
        ].join(''));
      }

      var acCallback = function () { res.redirect(successRedirectURL); };
      activeCampaign.api('contact/add', contact).then(acCallback, acCallback);
    });
  });
}
