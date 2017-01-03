'use strict'

module.exports = function(app) {
  require('./home.js')(app);
  require('./user.js')(app);
  require('./courses.js')(app);
};
