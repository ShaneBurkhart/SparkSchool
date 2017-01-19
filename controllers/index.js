'use strict'

module.exports = function (app) {
  //require('./user.js')(app);
  require('./courses.js')(app);
  require('./purchase.js')(app);
  // MAKE SURE THE HOME CONTROLLER GETS ADDED LAST!
  // The last route in the home controller catches all routes to check
  // them against existing landing pages.
  require('./home.js')(app);
};
