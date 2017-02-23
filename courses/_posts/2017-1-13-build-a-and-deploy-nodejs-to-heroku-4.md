---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/4
title: 'Step 4: Telling Your Web Server Where to Listen for Requests'
course: Project 1 Course
fb-title: 'Step 4: Telling Your Web Server Where to Listen for Requests'
description: In this step, we explain how web servers work and we create our first Node.js web app with a home, contact and about page.
image: https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/coding-on-a-laptop.jpg
---

<p class="info">
I am running this tutorial on a Mac.  If you are on Windows or Linux, a few things will be slightly different.  I make a note of these things, but if you have issues, leave a comment and I'll check it out.
</p>

{% include nodejs-to-heroku-tutorial-toc.html %}

## Starting your server

We have our app created and routes defined, but we haven't written any code to start our server yet.  Before we do that, let's talk a little about ports.

IPs uniquely identify computers on the internet, and ports identify a specific channel on the computer.  Ports make it possible to run multiple servers on the same IP address since different ports won't cause them to conflict.

You can specify which port you want to make the request on in the URL.  To do this, put a colon after the domain name followed by the port number you want to request.  Below, we are requesting trysparkschool.com on port 3000.  If you visit that URL in the browser, you'll notice nothing happens since we don't have a server running on that port.

[http://trysparkschool.com:3000](http://trysparkschool.com:3000)

By default, HTTP is done on port 80 and your browser hides this from you.  Try requesting trysparkschool.com on port 80 and you will get the same results as when you don't specify the port.

Typically when developing and running our server locally, we don't listen on port 80.  This is a good idea for many reasons but primarily allows us to run multiple web servers on the same computer.

Now that we know a little about ports, let's write some code to have our server listen on port 8080. The "app" variable has a function called "listen" that tells the server to start listening for web requests.

##### index.js
```javascript
app.listen(8080, function() {
  console.log('Web server listening on port 8080!');
});
```

The first argument is the port we want to run our web server on and the second argument is an anonymous function that gets run when the server starts listening for requests.  This is only called once when the server starts up.

We want to know when our server starts, so the body of our callback function calls the "console.log()" which simply prints the text "Web server listening on port 8080!" to the terminal.

Your final code for "index.js" should look like this:

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

<p class="next-lesson">
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/5">Start Step 5: Running Your Node.js Web App Locally!</a>
</p>
