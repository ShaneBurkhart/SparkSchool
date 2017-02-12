'use strict'

var Referral = require('../models/referral');

module.exports = function (app) {
  app.get('/r/:ac_contact_id(0-9+)', function (req, res) {
    var activeCampaignContactId = req.params.ac_contact_id;

    // TODO set utm tags for page

    res.redirect([
      '/become-a-software-developer-without-a-college-degree-weekly-email',
      '?referrer=' + activeCampaignContactId,
    ].join(''));
  });

  app.get('/refer-a-friend/:ac_contact_id(0-9+)', function (req, res) {
    var activeCampaignContactId = req.params.ac_contact_id;

    Referral.getReferralCount(activeCampaignContactId, function (err, referralCount) {
      res.render('referral/index', { referralCount: referralCount });
    });
  });
};
