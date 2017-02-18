'use strict'

var async = require('async');
var ActiveCampaign = require('activecampaign');
var activeCampaign = new ActiveCampaign(
  "https://sparkschool.api-us1.com",
  process.env.ACTIVE_CAMPAIGN_KEY
);

var ENTRIES_PER_REFERRAL = 3;
// This cookie holds the id of the ActiveCampaign contact that signed up on this computer.
var GIVEAWAY_ID_COOKIE_NAME = 'ssgiveid'
// Since ids for ActiveCampaign contacts start at 1 and increment, I'm disguising that
// id by appending a string.
var ID_DISGUISE = '9458120';

function cleanId(rawId) {
  if (!rawId) return undefined;
  return rawId.replace(new RegExp(ID_DISGUISE + '$'), '');
}

module.exports = function (app) {
  // URL shortener for emails and links
  app.get('/g/:referrerId', function (req, res) {
    var referrerId = req.params.referrerId;
    res.redirect('/learn-software-development-giveaway?rid=' + referrerId);
  });

  app.get('/learn-software-development-giveaway', function (req, res) {
    var giveawayId = cleanId(req.cookies[GIVEAWAY_ID_COOKIE_NAME]);
    if (giveawayId) return res.redirect('/learn-software-development-giveaway-thank-you');

    res.render('giveaway/index');
  });

  app.get('/learn-software-development-giveaway-thank-you', function (req, res) {
    var referrerId = cleanId(req.params.rid);
    var giveawayId = req.cookies[GIVEAWAY_ID_COOKIE_NAME];

    // Ths cookie shows tracking once and should be deleted when used.
    // This is safe since we always redirect to thank you page after setting
    // this cookie.
    res.clearCookie('sstrack');

    if (!referrerId) return res.render('giveaway/thank-you', { giveawayId: giveawayId });

    var options = { 'ids': '' + referrerId };

    activeCampaign.api('contact/list', options).then(function (results) {
      var contact = results[0];
      if (!contact) return res.render('giveaway/thank-you', { giveawayId: giveawayId });

      // 1 is "Giveaway Entries" field on ActiveCampaign contacts.
      var currentGiveawayEntries = parseInt(contact.fields['1'].val, 10) || 1;

      res.render('giveaway/thank-you', { currentGiveawayEntries: currentGiveawayEntries });
    }, function () {
      res.render('giveaway/thank-you', { giveawayId: giveawayId });
    });

    res.render('giveaway/thank-you', { giveawayId: giveawayId });
  });

  app.post('/learn-software-development-giveaway', function (req, res) {
    var email = req.body.email;
    var referrerId = cleanId(req.body.rid);

    if (!/\S+@\S+.\S+/.test(email)) {
      return res.redirect([
        '/learn-software-development-giveaway',
        '?email=' + email,
        '&rid=' + req.body.rid,
        '&error=' + encodeURIComponent('That email is invalid.'),
        '#sign-up',
      ].join(''));
    }

    async.parallel([
      function addContact(addContactCallback) {
        var contact = {
          'email': email,
          'p[14]': '14',
        };

        if (process.env.APP_ENV === 'development') contact.tags = 'development';

        activeCampaign.api('contact/add', contact).then(function (results) {
          var contact = results[0];
          if (!contact) return addContactCallback('There was an error when adding the contact to ActiveCampaign.');

          res.cookie(GIVEAWAY_ID_COOKIE_NAME, contact.id + ID_DISGUISE, { httpOnly: true });
          addContactCallback();
        }, function () {
          addContactCallback('There was an error when adding the contact to ActiveCampaign.');
        });
      },

      function addReferrerEntries(addReferrerEntriesCallback) {
        if (!referrerId) return addReferrerEntriesCallback();
        var options = { 'ids': '' + referrerId };

        activeCampaign.api('contact/list', options).then(function (results) {
          var contact = results[0];
          if (!contact) return addReferrerEntriesCallback();

          // 1 is "Giveaway Entries" field on ActiveCampaign contacts.
          var currentGiveawayEntries = parseInt(contact.fields['1'].val, 10);
          // Each contact gets 1 entry for themselves
          if (!currentGiveawayEntries) currentGiveawayEntries = 1;

          var options = { 'id': referrerId, 'field[1,0]': currentGiveawayEntries + ENTRIES_PER_REFERRAL };
          var acCallback = function () { addReferrerEntriesCallback(); };

          // The field notation is dumb as shit. The first number in square notation is the field id.
          // The second is always zero. The value is the value set to the field.
          activeCampaign.api('contact/edit', options).then(acCallback, acCallback);
        }, function () {
          addContactCallback('There was an error when getting referrer from ActiveCampaign.');
        });
      }
    ], function (err) {
      if (err) console.log(err);

      // This cookie shows tracking once and should be deleted when used.
      // This is safe since we always redirect to thank you page after setting
      // this cookie.
      res.cookie('sstrack', true, { httpOnly: true });

      res.redirect('/learn-software-development-giveaway-thank-you');
    });

  });
};
