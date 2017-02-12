'use strict'

var db = require('../db/db');

var INSERT_QUERY = [
  'INSERT INTO Referral(',
    'referrer_active_campaign_id, canonical_email, ip_address',
  ') VALUES ($1, $2, $3) RETURNING id',
].join(' ');

var SPAM_QUERY = [
  'SELECT * FROM Referral',
  'WHERE canonical_email = $1 OR ip = $2',
  'LIMIT 1',
].join(' ');

var REFERRAL_COUNT_QUERY = [
  'SELECT * FROM Referral',
  'WHERE referrer_active_campaign_id = $1',
].join(' ');

var Referral = {
  checkSpam: function (email, activeCampaignContactId, ip, callback) {
    var canonicalEmail = email.replace(/\+.*@/, '@');

    db.query(SPAM_QUERY, [canonicalEmail, ip], function (err, results) {
      var rows = results.rows;
      if (!rows.length) return callback(null);

      var row = rows[0];

      if (row.ip === ip) return callback('Someone has already signed up from this IP address.');
      if (row.canonical_email === canonicalEmail) return callback('Someone has already signed up with that email.');

      callback(null);
    });
  },

  getReferralCount: function (activeCampaignContactId, callback) {
    db.query(REFERRAL_COUNT_QUERY, [activeCampaignContactId], function (err, results) {
      var rows = results.row;
      if (err || !rows.length) callback('There was an error.', 0);

      callback(rows[0]);
    });
  },

  create: function (email, activeCampaignContactId, ip, callback) {
    // Add referral to db
    // Add referral to list
    // Increment attribute on contact
  }
};

module.exports = Referral;
