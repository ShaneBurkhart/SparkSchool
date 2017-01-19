---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/3
title: 'Step 3: Writing Your First Web App With Node.js And Express.js'
fb-title: 'Step 3: Writing Your First Web App With Node.js And Express.js'
description: Go from no programming experience to building your own Node.js web app from scratch and deploying it to the web with Heroku.
image: https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/coding-on-a-laptop.jpg
---

<p class="info">
I am running this tutorial on a Mac.  If you are on Windows or Linux, a few things will be slightly different.  I make a note of these things, but if you have issues, leave a comment and I'll check it out.
</p>

### Table of Contents
- [Introduction](/tutorials/build-and-deploy-nodejs-app-to-heroku/intro)
- [Step 1: Setup and installation](/tutorials/build-and-deploy-nodejs-app-to-heroku/1)
- [Step 2: Creating your project and installing Express.js](/tutorials/build-and-deploy-nodejs-app-to-heroku/2)
- **Step 3: Writing your first web app with Node.js and Express.js**
- [Step 4: Running your Node.js web app locally](/tutorials/build-and-deploy-nodejs-app-to-heroku/4)
- [Step 5: Add HTML for home, contact, and about pages](/tutorials/build-and-deploy-nodejs-app-to-heroku/5)
- [Step 6: Getting your Node.js app ready for deploy to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/6)
- [Step 7: Commiting your files with Git](/tutorials/build-and-deploy-nodejs-app-to-heroku/7)
- [Step 8: Deploying your web app to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/8)

## How web servers work

What happens when we type an URL into the browser and press enter?

The browser will take the requested URL and get the domain name from it.  It then uses the domain name to lookup the IP address of the web server.  IP addresses uniquely identify computers on the internet, so no two computers can have the same IP address.

After finding the IP, it sends an HTTP request to the IP it found.  The server receives the request, fetches data it needs and creates a web page to return.  When it's done, it serves the HTML web page (big text file) back to the browser.  The browser then takes the returned HTML and renders it to the user.

Below is a diagram showing the client and server and how they make requests.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/server-client-http-request-diagram.jpg)

If you look at the diagram above, you can see there are two distinct computers to a web request: a web server and the client computer.  Some people will call the client computer the "frontend" and the web server the "backend".

<span id="writing-our-web-server" class="anchor"/>

## Writing our web server

With a basic understanding of how a web server works, let's create one. First, we need to create a file for our server code.  Open your text editor (Sublime Text 3) and select File > New File.  Now select File > Save As and save the file as "index.js" in our NodeApp directory.

Like most programming languages, javascript executes code line-by-line starting at the top.  The first line of all of our javascript files needs to say "use strict" wrapped in single quotes.

##### index.js
```javascript
'use strict'
```

This enables strict mode which makes development a little more consistent and takes out some of the weird parts of javascript.  To read more about what strict mode does, you can read this [explanation of strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode).

After that, we need to import the Express.js library we installed earlier and save it to a variable.  First, let's explain a bit about javascript.

One of the most common programming concepts is using variables.  Variables are simply used to store information for later.  Each variable has a data type such as numbers and text.

To define variables in javascript, we use the "var" keyword followed by the name we want to give to our variable. Below we are defining a variable called num:

##### Javascript Example
```javascript
var num;
```

<p class="info">
Most lines in Javascript end in a semicolon.  There are a few exceptions that we'll go over later, but for the most part, know that a line of Javascript code ends in a semicolon.
</p>

That only defines a variable, but right now it has a value of "undefined" since we haven't given it a value. We do that with the assignment operator (equals sign) followed by the value we want to assign to the variable.  In the code snippet below, we are assigning the value 3 to the variable "num":

##### Javascript Example
```javascript
var num = 3;
```

Now that we understand variables a bit, let's go over how to import libraries.  To import libraries into our file, we use the "require" function.

Functions are simply a section of code that can be executed over and over by name.  We use functions so we don't have to write the same code over and over. Instead, we can write the function once and call it multiple times, thus removing duplicate code.

To call functions, we type the name of the function followed by parenthesis.  The parenthesis means we are calling it.

Inside the parenthesis, we can pass values and variables.  These are called arguments and functions can take any number of arguments.  Arguments let us specify options and data that the function can use on that function call.

Functions can also return values but are not required to.  This is useful when a function creates something or fetches a value.

A simple example of a function that takes arguments and returns a value would be an "add" function that takes two numbers and returns the sum.  In the code snippet below, we are calling the "add" function and assigning the return value to a variable called "sum".  The variable "sum" would now equal the number 7.

##### Javascript Example
```javascript
var sum = add(2, 5);
```

Now that we understand how variables and functions work, let's use the "require" function to import the express library.

##### index.js
```javascript
var express = require('express');
```

The Express library returns a function that doesn't take arguments and is used to create an Express app. Let's do that now under our express import.

##### index.js
```javascript
var app = express();
```

We now have an "app" variable that we can use to configure our server.  Right now, it doesn't do anything, but we are about to change that.

In HTTP, each request has an HTTP method that helps define the intent of the web request.  The GET method is used to read data and is one of the most common request methods. Your browser uses this method when requesting a web page.

For our first page, we are going to define a route that listens for a GET request to the home page.  As we mentioned earlier, the home page is to the bare domain which is defined as the "/" path.

<p class="info">
When a server is listening for a specific URL and HTTP method, we call that a route.
</p>

Luckily with Express, creating a GET route can easily be created by calling the "get" function on our "app" variable.  The first argument to the "get" function is the path our route is listening for and the second is a function that gets executed when a request matches this route.  Let's define a GET request to the home page ("/").

##### index.js
```javascript
app.get('/', function(req, res) {
  // Our code will go here
});
```

There are a few new things we haven't covered in the above code. First, we are passing an anonymous function as the second argument to the "get" method.

Anonymous functions act the same as a regular function but don't have a name.  To define an anonymous function, we use the "function" keyword, followed by parenthesis.  In the parenthesis, we have function parameters separated by commas, which are names given to the arguments passed in.

Following the parentheses, curly braces define the body of the function.  This is where we put the code that the function will execute. To give us space to write code, we put curly braces on different lines.

Notice that the anonymous function has two parameters that Express passes in as arguments on each request.  The first is the parameter "req" (short for "request") and contains data about the request the server received.  The second is "res" (short for "response") which provides functions for sending data back to the server. Express adds functions to these variables to make things easier.

Our route doesn't do anything yet, but let's fix that.  Our goal here is to send an HTML file back to the browsers.  Luckily, the "res" variable has a "sendFile" method that lets us specify a file to send to the server.  It takes a single argument and attempts to render that file.  In our case, we are going to pass it the path to "index.html".

##### index.js
```javascript
app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});
```

The "__dirname" variable holds the path to our project directory.   We are appending '/index.html' to it since the file will be in the root of our project.

Now that we have one route created, let's make two more for "/about" and "/contact".  Add this to index.js.

##### index.js
```javascript
app.get('/about', function (req, res) {
  res.sendFile(__dirname + '/about.html');
});

app.get('/contact', function (req, res) {
  res.sendFile(__dirname + '/contact.html');
});
```

We have three routes now, but what if the user's web request doesn't match one of these routes?  We can define a catch-all route as the last route that will return the HTTP status code of 404 (page not found) and sends the "404.html" file.

To create a catch-all route, we call the "use" function on the "app" variable.  The only argument "use()" takes is an anonymous function that handles a request.

##### index.js
```javascript
app.use(function (req, res) {
  res.status(404).sendFile(__dirname + '/404.html');
});
```

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
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/4">Start Lesson 4: Running Your Web App Locally!</a>
</p>
