var express = require('express');
var app = express();

function PageNotFoundError(path) {
  this.name = 'PageNotFoundError';
  this.message = 'Couldn\'t find page: ' + path;
}

app.engine('html', require('pug').renderFile);

app.get('/', function(req, res) {
  res.send('Hello world!');
});

app.get('/courses/*', function(req, res, next) {
  var filePath = __dirname + '/courses/_site' + req.path + '.html';

  res.sendFile(filePath, function(err) {
    if (err) next(new PageNotFoundError(req.path));
  });
});

app.use(function(err, req, res, next) {
  console.log(err.message);

  switch(err.name) {
    case 'PageNotFoundError':
      return res.status(404).send(err.message);
    default:
      return res.status(500).send('There was an internal error.');
  }
});

app.listen(80, function() {
  console.log('Listening on port 8080');
});
