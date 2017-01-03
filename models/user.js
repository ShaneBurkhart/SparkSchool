'use strict'

var bcrypt = require('bcrypt');
var db = require('../db/db');

// Bcrypt stuff
var SALT_ROUNDS = 10;

var FIND_BY_ID_QUERY= 'SELECT * FROM Users WHERE id = $1';
var FIND_BY_EMAIL_QUERY= 'SELECT * FROM Users WHERE email = $1';

var INSERT_QUERY = [
  'INSERT INTO Users(',
    'full_name, email, password_digest',
  ') VALUES ($1, $2, $3) RETURNING id',
].join(' ');

module.exports = {
  // Don't do password validation in here.
  validate: function (user, callback) {
    if (!user.full_name) return callback('You must enter a name.');
    if (!user.email) return callback('You must enter an email address.');

    if (!/\S+@\S+.\S+/.test(user.email)) {
      return callback('You must enter a valid email address.');
    }

    this.findByEmail(user.email, function (err, user) {
      if (err) return callback('Sorry, there was an error. Try again later.');

      if (user) return callback('That email is already taken.');

      // Valid user
      return callback();
    });
  },

  create: function (user, callback) {
    this.validate(user, function (err) {
      if (err) return callback(err);

      bcrypt.hash(user.password, SALT_ROUNDS, function (err, hash) {
        if (err) return callback('Sorry, there was an error. Try again later.');

        var params = [user.full_name, user.email, hash];

        db.query(INSERT_QUERY, params, function (err, results) {
          if (err) return callback('Sorry, there was an error. Try again later.');
          var userId = results.rows[0].id;

          callback(undefined, userId);
        });
      });
    });
  },

  checkPassword: function (user, password, callback) {
    this.findByEmail(user.email, function (err, user) {
      if (err || !user) return callback('Invalid email email and password combination.');

      bcrypt.compare(password, user.password_digest, function (err, res) {
        if (err || !res) return callback('Invalid email email and password combination.');
        callback(undefined, user);
      });
    });
  },

  makePaid: function (user, callback) {
    var query = 'UPDATE Users SET status = \'paid\' WHERE id = $1';

    db.query(query, [user.id], function (err, results) {
      if (err) {
        console.log(err);
        return callback('Sorry, there was an error. Try again later.');
      }

      callback();
    });
  },

  findById: function (id, callback) {
    db.query(FIND_BY_ID_QUERY, [id], function (err, results) {
      callback(err, results.rows[0]);
    });
  },

  findByEmail: function (email, callback) {
    db.query(FIND_BY_EMAIL_QUERY, [email], function (err, results) {
      callback(err, results.rows[0]);
    });
  },
};
