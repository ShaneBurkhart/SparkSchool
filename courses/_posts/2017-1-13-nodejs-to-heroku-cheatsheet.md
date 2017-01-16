---
layout: default
permalink: /cheat-sheets/nodejs-and-heroku
title: Node.js And Heroku Cheatsheet
disable-comments: true
disable-header: true
---

### Navigate to project directory

##### Terminal
```bash
cd ~/Desktop/NodeApp
```

### Create package.json file for project

##### Terminal
```bash
npm init
```

### Install Express.js library with npm

##### Terminal
```bash
npm install express --save
```

### Create Express.js app

##### index.js
```javascript
var express = require('express');
var app = express();
```

### Create GET route to homepage ("/")

##### index.js
```javascript
app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});
```

**req** - [Express Request object](http://expressjs.com/en/4x/api.html#req)

**res** - [Express Response object](http://expressjs.com/en/4x/api.html#res)

### Catch all page not found route.  Make sure it's the last route!

##### index.js
```javascript
app.use(function (req, res) {
  res.status(404).sendFile(__dirname + '/404.html');
});
```

### Start our server and listen for requests on port 8080

##### index.js
```javascript
app.listen(8080, function() {
  console.log('Web server listening on port 8080!');
});
```

### Example Express.js web app

##### index.js
```javascript
'use strict'

var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});

app.get('/about', function (req, res) {
  res.sendFile(__dirname + '/about.html');
});

app.get('/contact', function (req, res) {
  res.sendFile(__dirname + '/contact.html');
});

app.use(function (req, res) {
  res.status(404).sendFile(__dirname + '/404.html');
});

app.listen(8080, function() {
  console.log('Web server listening on port 8080!');
});
```

### Starting our server

##### Terminal
```bash
node index.js
```

### Visit the server in the browser

[http://127.0.0.1:8080](http://127.0.0.1:8080)

<p class="info">
The server blocks terminal input and listens continuously for web requests.  To stop the server and run commands in the terminal, hold control and press the "c" key.
</p>

### Get Node.js version

##### Terminal
```bash
node --version
```

### Example final package.json

##### package.json
```json
{
  "name": "NodeApp",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node index.js"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.14.0"
  },
  "engines": {
    "node": "6.9.4"
  }
}
```

### Ignore built files in Git

##### .gitignore
```
/node_modules
npm-debug.log
.DS_Store
/*.env
```

### Tell your app to listen on PORT environment variable

##### index.js
```javascript
'use strict'

var express = require('express');
var app = express();

var port = process.env.PORT || 8080;

app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});

app.get('/about', function (req, res) {
  res.sendFile(__dirname + '/about.html');
});

app.get('/contact', function (req, res) {
  res.sendFile(__dirname + '/contact.html');
});

app.use(function (req, res) {
  res.status(404).sendFile(__dirname + '/404.html');
});

app.listen(port, function () {
  console.log('Web server listening on port ' + port + '!');
});
```

### Run your Heroku app locally

##### Terminal
```bash
heroku local web
```

### Initializing Git repository

##### Terminal
```bash
git init
```

### Add files to staging to be committed

##### Terminal
```bash
git add .
```

### Commit files with commit message

##### Terminal
```bash
git commit -m "Initial commit.  Deploying to Heroku."
```

### Login to Heroku

##### Terminal
```bash
heroku login
```

### Create Heroku app

##### Terminal
```bash
heroku create
```

### Deploy your app to Heroku

##### Terminal
```bash
git push heroku master
```
