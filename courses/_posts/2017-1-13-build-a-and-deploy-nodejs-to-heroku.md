---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku
title: Build A Node.js Web App From Scratch And Deploy It To The Web Using Heroku
fb-title: Build A Web App From Scratch And Deploy It To The Web
description: Go from no programming experience to building your own Node.js web app from scratch and deploying it to the web with Heroku.
image: https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/coding-on-a-laptop.jpg
---

If you've ever thought about building a web app but don't have any programming experience, this tutorial is the perfect place to get started.

In this tutorial, I'm going to walk you step-by-step through building a Node.js web app from scratch.  When we are done creating our web app, I'll show you how to deploy it to the web using Heroku.  By the end of this tutorial, you'll have a Node.js web app that is running on the web.

Let's get started!

<p class="info">
I am running this tutorial on OS X.  If you are on Windows or Linux, a few things will be slightly different.  I do my best to make a note of these things, but if you have issues, leave a comment and I'll check it out.
</p>

### Table of Contents
- [Prerequisites](#prerequisites)
- [Creating the project](#creating-the-project)
- [How web servers work](#how-web-servers-work)
- [Writing our web server](#writing-our-web-server)
- [Running our server](#running-our-server)
- [Add HTML files](#add-html)
- [Getting our project ready for deploy](#getting-ready-for-deploy)
- [Committing your files](#committing-your-files)
- [Deploying your app to Heroku](#deploying-your-app-to-heroku)
- [Get the cheat sheet!](#get-the-cheat-sheet)

<span id="prerequisites" class="anchor"/>

## Prerequisites

You need to do these things before getting started.  Don't worry, all of the tools and services we use in this tutorial are free.

### Install Node.js

Visit [https://nodejs.org/en/download/](https://nodejs.org/en/download/) and download the installer for your operating system. Run it and use the defaults.

If you're on Linux, [here's a guide to installing Node.js on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04).

### Install Git

Git is a version control tool that Heroku uses to deploy web apps.  Visit [https://git-scm.com/downloads](https://git-scm.com/downloads) and download the installer for your operating system.  Run it with the default settings.

### Install a text editor

When coding, it's important to have a good text editor.  You can use whichever you want, but I recommend [Sublime Text 3](https://www.sublimetext.com).  Visit [https://www.sublimetext.com/3](https://www.sublimetext.com/3) and download the installer for your operating system.  Run it with the default settings.

### Create a Heroku account

Creating a Heroku account is free and easy.  Visit [https://signup.heroku.com/](https://signup.heroku.com/) to create an account.

### Install Heroku toolbelt

We need to also install the Heroku toolbelt so we can interface with Heroku from our project.  [Here's a guide to install Heroku toolbelt](https://devcenter.heroku.com/articles/heroku-cli).

<span id="creating-the-project" class="anchor"/>

## Creating the project

We need a place to store our project files, so let's create a directory (folder) to store them in.  In this tutorial, I'm going to call my directory "NodeApp" and put it on my Desktop.  Go ahead and do that now.

Now that we have a project directory, let's navigate to it from the command line.  On OS X and Linux, we can open the command line with an application called "Terminal" and on Windows, it's called "Git Bash".  For the rest of the tutorial, I'll refer to this program as the command line or terminal interchangeably.  Open this program now.

When your terminal opens, navigate to our project directory with the following.

##### Terminal
```bash
cd ~/Desktop/NodeApp
```

Before we can write our web server, we need to create a "package.json" file in the root of our project directory.  This file stores information about the project as well as keeps track of the Node.js libraries we want to install.

Libraries are also sometimes called packages and generally, are software projects that help you do a specific task.  We are going to use the Express.js library since it makes creating web servers much easier.

"npm" stands for Node Package Manager and is used to manage node libraries. To create a package.json file, run the following command in the terminal after navigating to our project directory.

##### Terminal
```bash
npm init
```

The command will prompt for various pieces of information.  You can press enter until the command is finished to use the defaults. When the command is done, it will have created a "package.json" file in the root of your project directory.

With npm initialized, we can install libraries for our project.  The first library we need is Express.js ([http://expressjs.com/](http://expressjs.com/)).  This is a pretty standard web server library and makes it much easier to create web servers.

To install libraries, we use the "npm" command followed by the word "install" followed by the name of the library we want to install.  To tell npm we want to save this library in our package.json file, we add the "--save" option at the end.  Below is what this looks like for Express.js:

##### Terminal
```bash
npm install express --save
```

If you open the package.json file, you should see "express" listed under "dependencies"

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/package-json-after-init.png)

<p class="info">
Npm creates a directory called "node_modules" in the root of our project that holds all of the installed packages for the project.  We won't ever have to do anything with this.
</p>

<span id="how-web-servers-work" class="anchor"/>

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

<span id="running-our-server" class="anchor"/>

## Running our server

Now we have our server written, let's run it. Save "index.js" and go to your terminal.

To run javascript files, we use the "node" command.  [Node.js](https://nodejs.org/en/) is a Javascript environment that runs Javascript code for us. The first option passed to the node command is the name of the file we want to run.  Let's run our "index.js" file.

##### Terminal
```bash
node index.js
```

To visit our app in the browser, we need to request the "localhost" domain on port 8080 where our web server is listening.

<p class="info">
Localhost is a special domain that points to the local computer.  It is the same as "127.0.0.1" which is the internal IP address of your computer.
</p>

<p class="info">
The server blocks terminal input and listens continuously for web requests.  To stop the server and run commands in the terminal, hold control and press the "c" key.
</p>

Unfortunately, if you visit [http://localhost:8080](http://localhost:8080) in the browser, you'll get an error because we haven't created the HTML files we are trying to render.  Let's do that now.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/no-home-page-html-error.png)

<span id="add-html" class="anchor"/>

## Add HTML files

HTML and CSS are out of the scope of this tutorial since we are focusing on building and deploying a Node.js server.  If you want to learn about these, Codecademy has a good [HTML/CSS course](https://www.codecademy.com/learn/web).

Add "index.html", "about.html", "contact.html" and "404.html" files to the root of our project.

##### index.html
```html
<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="padding-top: 70px;">
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <a class="navbar-brand" href="/">Node App</a>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/contact">Contact</a></li>
          </ul>
        </div>
      </nav>
      <div class="jumbotron">
        <div class="container">
          <h1>The Homepage</h1>
          <p>This is a jumbotron section where you can put information that you want to stand out!</p>
          <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <h3>Section 1</h3>
            <p>You can add sub information about your website here.  Check the bootstrap docs to add to this page.</p>
          </div>
          <div class="col-md-4">
            <h3>Section 2</h3>
            <p>You can add sub information about your website here.  Check the bootstrap docs to add to this page.</p>
          </div>
          <div class="col-md-4">
            <h3>Section 3</h3>
            <p>You can add sub information about your website here.  Check the bootstrap docs to add to this page.</p>
          </div>
        </div>
      </div>
    </body>
</html>
```
##### about.html
```html
<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="padding-top: 70px;">
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <a class="navbar-brand" href="/">Node App</a>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/contact">Contact</a></li>
          </ul>
        </div>
      </nav>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              <h1>About Node App <small>All you need to know</small></h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <h3>Section 1</h3>
            <p>You can add sub information about your website here.  Check the bootstrap docs to add to this page.</p>
          </div>
          <div class="col-md-6">
            <h3>Section 2</h3>
            <p>You can add sub information about your website here.  Check the bootstrap docs to add to this page.</p>
          </div>
        </div>
      </div>
    </body>
</html>
```

##### contact.html
```html
<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="padding-top: 70px;">
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <a class="navbar-brand" href="/">Node App</a>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/contact">Contact</a></li>
          </ul>
        </div>
      </nav>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              <h1>Contact Us</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <h2>Enter your information</h2>
            <form>
              <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" placeholder="Email">
              </div>
              <div class="form-group">
                <label for="message">Message</label>
                <textarea class="form-control" id="message"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </body>
</html>
```

##### 404.html
```html
<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style="padding-top: 70px;">
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <a class="navbar-brand" href="/">Node App</a>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/contact">Contact</a></li>
          </ul>
        </div>
      </nav>
      <div class="jumbotron">
        <div class="container">
          <h1>Oooopps...</h1>
          <p>This page couldn't be found.  Click the link below to go to the home page.</p>
          <p><a class="btn btn-primary btn-lg" href="/" role="button">Homepage</a></p>
        </div>
      </div>
    </body>
</html>
```

<p class="info">
I'm using a common CSS library called Bootstrap to style the page.  If you want to add to these pages, you can read the <a href="http://getbootstrap.com/getting-started/">Bootstrap docs here</a>.
</p>

Save those files and visit [http://localhost:8080](http://localhost:8080) in your browser. You should see the following.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/final-home-page.png)

Now that our server is working, let's deploy it to Heroku.

<span id="getting-ready-for-deploy" class="anchor"/>

## Getting our project ready for deploy

To deploy to Heroku, we need to add a few things to our package.json.  The first is the Node.js version we are using.  You can check this by running the following.

##### Terminal
```bash
node --version
```

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/terminal-nodejs-version.png)

My node version is "6.9.4".  Let's add this to the bottom of our package.json file. Your package.json file will now look like the following.

##### package.json
```json
{
  "name": "NodeApp",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
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

Next, let's specify a start script in package.json.  We are adding this part to the "scripts" section.  Your package.json will look like the following.

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

Now that we've specified the start script, let's add a ".gitignore" file to our project.  This file tells git to ignore the files listed in it.  Create the ".gitignore" file in the root of your project and add the following.

##### .gitignore
```
/node_modules
npm-debug.log
.DS_Store
/*.env
```

Next, we need to have our server listen for the "PORT" environment variable.  Heroku requires us to listen on the port it specifies with that variable.   Your "index.js" file will now look like the following.

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

All we did was add a "port" variable to the top of the file that checks for the "PORT" environment variable and if it doesn't exist, sets the port to 8080 for development.  Then we changed our "app.listen()" call to take the "port" variable and added the "port" variable to our "console.log" output.

We can make sure everything is working correctly by running our app locally with Heroku Toolbelt.  Run the following in your terminal.

##### Terminal
```bash
heroku local web
```

You'll see the following.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/heroku-running-nodejs-locally.png)

Visit [http://localhost:5000](http://localhost:5000) in your browser and make sure you can see your website.

If everything is working correctly, you're ready to deploy your app to the web.

<span id="committing-your-files" class="anchor"/>

## Committing your files

Heroku uses Git to deploy so we need to make our project a git repository.  We only need to do this once for our project.

##### Terminal
```bash
git init
```

Now we need to add our project files to our git repository.  To commit files, we first add them to staging.  This command will add all changed files to staging.

##### Terminal
```bash
git add .
```

Now we need to commit the files in staging and add a message.

##### Terminal
```bash
git commit -m "Initial commit.  Deploying to Heroku."
```

Your files are now committed, let's deploy them to Heroku.

<p class="info">
Anytime you make changes to your project, you need to commit your files before pushing.  You can refer back here to see how.  There's no need to run "git init" again.
</p>

<span id="deploying-your-app-to-heroku" class="anchor"/>

## Deploying your app to Heroku

Let's first login to Heroku in our Terminal.

##### Terminal
```bash
heroku login
```

Enter your Heroku login credentials.  When it asks for your password, you'll type but you won't see any characters appear.  They are still being entered, just type your password and press enter.

Let's create a Heroku server for our app.

##### Terminal
```bash
heroku create
```

This will print a URL where you can view your website.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/heroku-create-url.png)

Let's push our code to our new server.

##### Terminal
```bash
git push heroku master
```

This will take a minute to run, but when it's finished, you should be able to visit the URL printed above to see your website.

If you want to create a custom domain name, you can read this [guide on adding a custom domain to your Heroku app](https://devcenter.heroku.com/articles/custom-domains).

<span id="get-the-cheat-sheet" class="anchor"/>

## Get the cheat sheet!

We covered a lot in this tutorial and it's hard to remember it all.  That's why I created a cheat sheet that contains all of the code snippets and commands we used in this tutorial. This is extremely useful to have so you can quickly reference things we learned in this tutorial on your future projects.

If you plan on building your own web apps, I highly recommend you get the cheat sheet.  Click the button below to get the cheat sheet.

<p class="content-upgrade">
	<a class="button" data-sumome-listbuilder-id="5859efd3-b1aa-480e-9e27-04a0ace84935">Click here to get the FREE cheat sheet!</a>
</p>

Congratulations!  You just built your first Node.js web server from scratch and deployed it to the web with Heroku.  From here, you can modify the app to fit your needs.

I would love to see what you guys build with this tutorial!  When you deploy your site, show it off by commenting below with a link to your websites.

<div class="meet-the-author">
	<div class="graphic">
		<img class="circle" src="https://s3.amazonaws.com/spark-school/me_and_yogi.png" alt="Shane Burkhart with his dog, Yogi." />
	</div>
	<div class="description">
		<h3>Meet The Instructor</h3>
		<p>Hey, I'm Shane! I’ve been a software developer for a little over 5 years now, and have worked at Yelp, Carfax, and a startup called SumoMe.
		<p>The crazy part is I didn’t go to school to be a software developer. In fact, I am completely self-taught.</p>
		<p>I've spent the last 5 years teaching myself software development and over time, I have learned what works and what doesn't. Now, I want to use my knowledge to help you learn as efficiently as possible.</p>
	</div>
</div>
