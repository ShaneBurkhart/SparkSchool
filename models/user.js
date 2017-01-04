'use strict'

var bcrypt = require('bcrypt');
var db = require('../db/db');
var stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

// Bcrypt stuff
var SALT_ROUNDS = 10;

var FIND_BY_ID_QUERY= 'SELECT * FROM Users WHERE id = $1';
var FIND_BY_EMAIL_QUERY= 'SELECT * FROM Users WHERE email = $1';

var INSERT_QUERY = [
  'INSERT INTO Users(',
    'full_name, email, password_digest',
  ') VALUES ($1, $2, $3) RETURNING id',
].join(' ');

var User = {
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

  addCustomerAndCharge: function (user, stripeToken, price, callback) {
    console.log('addCustomerAndCharge');
    this.addCustomer(user, stripeToken, function (err, user) {
      if (err) return callback(err);

      console.log('Added customer');
      User.chargeCustomer(user, price, function (err) {
        if (err) return callback(err);

        console.log('Charged customer');
        User.makePaid(user, function (err) {
          if (err) return callback(err);
          console.log('Made paid');
          callback();
        });
      });
    });
  },

  addCustomer: function (user, stripeToken, callback) {
    var query = 'UPDATE Users SET stripe_customer_id = $1 WHERE id = $2';

    var customer = stripe.customers.create({
      card: stripeToken,
      email: user.email,
    }, function (err, customer) {
      if (err) return callback(err);

      user.stripe_customer_id = customer.id;

      var params = [user.stripe_customer_id, user.id];

      db.query(query, params, function (err, results) {
        if (err) return callback(err);
        callback(undefined, user);
      });
    });
  },

  chargeCustomer: function (user, price, callback) {
    var charge = stripe.charges.create({
      amount: price,
      currency: "usd",
      customer: user.stripe_customer_id,
      description: "Spark School Beta Access"
    }, function(err, charge) {
      if (err) callback(err);
      callback();
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

module.exports = User;
