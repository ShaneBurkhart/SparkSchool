---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku
title: Build A Node.js App From Scratch And Deploy It To Heroku
---

### Table of Contents
- [Prerequisites](#prerequisites)
- [Creating the project](#creating-the-project)
- [How web servers work](#how-web-servers-work)
- [Writing our web server](#writing-our-web-server)
- [Running our server](#running-our-server)
- [Add HTML files](#add-html)
- [Getting our project ready for deploy](#getting-ready-for-deploy)
- [Commiting your files](#committing-your-files)
- [Deploying your app to Heroku](#deploying-your-app-to-heroku)
- [Get the source code](#get-the-source-code)

I am running this on OS X running X.  If you are on Windows, this will be slightly different.

Javascript is a popular language these days.  With the creation of Node.js, Javascript is now used in both the browser and on the server.

Creating you first app can be intimidating, but this guide will show you how to build a Node.js app from scratch and deploy it to the web using Heroku.

Heroku is a company that provides easy-to-use web app hosting.  They make is dead simple to deploy your apps to the web.  What's even better is they have a free tier so it won't cost you a thing.

By the end of this tutorial, you will have a web app that is published to the web with Heroku.

<span id="prerequisites" class="anchor"/>

## Prerequisites

You need to do these things before getting started.  Don't worry, all of the tools and services we use in this tutorial are free.

### Install Node.js

Visit [https://nodejs.org/en/download/](https://nodejs.org/en/download/) and download the installer for your operating system. Run it and use the defaults.

If you're on Linux, [here's a guide to installing Node.js on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04).

### Install Git

Git a version control tool that Heroku uses to deploy web apps.  Visit [https://git-scm.com/downloads](https://git-scm.com/downloads) and download the installer for your operating system.  Run it with default settings.

### Install a text editor

When coding, it's important to have a good text editor.  You can use any you want, but I recommend [Sublime Text 3](https://www.sublimetext.com).  Visit [https://www.sublimetext.com/3](https://www.sublimetext.com/3) and download the installer for you operating system.  Run it with default settings.

### Create a Heroku account

Creating a Heroku account is free and easy.  Visit [https://signup.heroku.com/](https://signup.heroku.com/) to create an account.

### Install Heroku toolbelt

We need to also install the Heroku toolbelt so we can interface with Heroku from our command line.  [Here's a guide to install Heroku toolbelt](https://devcenter.heroku.com/articles/heroku-cli).

<span id="creating-the-project" class="anchor"/>

## Creating the project

We need a place to store our project files, so create let's create a directory to store them in.  In this tutorial, I'm going to call my directory "NodeApp" and put it on my Desktop.  Go ahead and do that now. 

Now that we have a project directory, let's visit navigate to it from the command line.  On OS X and Linux, we can open the command line with an application called "Terminal" and on Windows, it's called "Git Bash".  For the rest of the tutorial, I'll refer to this program as the command line or terminal interchangeably.  Open this program now.

When you terminal opens, navigate to our project directory.

```bash
# Terminal
cd ~/Desktop/NodeApp
```

<p class="info">
The first line of every code snippet is the file where the code belongs or where it should be executed.  You can ignore that line.
</p>

Before we can write our web server, we need to create a "package.json" file in the root of our project directory.  This file stores information about the project as well as keeps track of the Node.js libraries we want to install.

Libraries are also sometimes called packages and generally, are software projects that help you do a specific task.  We are going to use the Express.js library since it makes creating web servers much easier.

"npm" stands for Node Package Manager and is used to manage node libraries. To create a package.json file, run the following command in the terminal in the root of our project directory.

```bash
# Terminal
npm init
```

The command will prompt for various pieces of information.  You can press enter until the command is finished to use the defaults. When the command is done, it will have created a "package.json" file in the root of your project directory.

With npm initialized, we can install libraries for our project.  The first library we need is Express.js ([http://expressjs.com/](http://expressjs.com/)).  This is a pretty standard web server library and makes it much easier to create web servers.

To install libraries, we use the "npm" command followed by the word "install" followed by the name of the library we want to install.  To tell npm we want to save this library in our package.json file, we add the "--save" option at the end.  Below is what this looks like for Express.js:

```bash
# Terminal logged into VM
npm install express --save
```

If you open the package.json file, you should see "express" listed under "dependencies"

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/package-json-after-init.png)

Npm creates a directory called "node_modules" in the root of our project that holds all of the installed packages for the project.  We won't ever have to do anything with this.

<span id="how-web-servers-work" class="anchor"/>

## How web servers work

What happens when we type a url into the browser and press enter?  

The browser will take the requested url and get the domain name from it.  It then uses the domain name to lookup the IP address of the web server.  IP addresses uniquely identify computers on the internet, so no two computers can have the same IP address.

After finding the IP, it sends an HTTP request to the IP it found.  The server receives the request, fetches data it needs and creates a web page to return.  When it's done, it serves the HTML web page (big text file) back to the browser.  The browser then takes the returned HTML and renders it to the user.

Below is a diagram showing the client and server and how they make requests.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/server-client-http-request-diagram.jpg)

If you look at the diagram above, you can see there are two distinct computers to a web request: a web server and the client computer.  Some people will call the client computer the "frontend" and the web server the "backend".

<span id="writing-our-web-server" class="anchor"/>

## Writing our web server

With a basic understanding of how a web server works, let's create one. First, we need to create a file for our server code.  Open your text editor (Sublime Text 3) and select File > New File.  Now select File > Save As and save the file as index.js in our NodeApp directory. 

Like most programming languages, javascript executes code line-by-line starting at the top.  The first line of all of our javascript files needs to say "use strict" wrapped in single quotes.

```javascript
// index.js
'use strict'
```

This enables strict mode which makes development a little more consistent and takes out some of the weird parts of javascript.  To read more about what strict mode does, you can read this [explanation of strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode).

After that, we need to import the Express.js library we installed earlier and save it to a variable.  First, let's explain a bit about javascript.

One of the most common programming concepts is using variables.  Variables are simply used to store information for later.  Each variable has a data type such as numbers and text.

To define variables in javascript, we use the "var" keyword followed by the name we want to give to our variable. Below we are defining a variable called num:

```javascript
// Javascript Example
var num;
```

<p class="info">
Most lines in Javascript end in a semicolon.  There are a few exceptions that we'll go over later, but for the most part, know that a line of Javascript code ends in a semicolon.
</p>

That only defines a variable, but right now it has a value of undefined since we haven't given it a value. We do that with the assignment operator (equals sign) followed by the value we want to assign to the variable.  In the code snippet below, we are assigning the value 3 to the variable "num":

```javascript
// Javascript Example
var num = 3;
```

Now that we understand variables a bit, let's go over how to import libraries.  To import libraries into our file, we use the "require" function.

Functions are simply a section of code that can be executed over and over by name.  We use functions so we don't have to write the same code over and over. Instead we can write the function once and call it multiple times, thus removing duplicate code.

To call functions, we type the name of the function followed by parenthesis.  The parenthesis means we are calling it.

Inside the parenthesis, we can pass values and variables.  These are called arguments and functions can take any number of arguments.  Arguments let us specify options and data that the function can use on that function call.

Functions can also return values, but aren't required to.  This is useful when a function creates something or fetches a value.

A simple example of a function that takes arguments and returns a value would be an "add" function that takes two numbers and returns the sum.  In the code snippet below, we are calling the "add" function and assigning the return value to a variable called "sum".  The variable "sum" would now equal the number 7.

```javascript
// Javascript Example
var sum = add(2, 5);
```

Now that we understand how variables and functions work, let's use the "require" function to import the express library.

```javascript
// app.js
var express = require('express');
```

The Express library returns a function that doesn't take arguments and is used to create an Express app. Let's do that now under our express import.

```javascript
// app.js
var app = express();
```

We now have an "app" variable that we can use to configure our server.  Right now, it doesn't do anything, but we are about to change that.

In HTTP, each request has an HTTP method that helps define the intent of the web request.  The GET method is used to read data and is one of the most common request methods. Your browser uses this method when when requesting a web page.

For our first page, we are going to define a route that listens for a GET request to the homepage.  As we mentioned earlier, the homepage is to the bare domain which is defined as the "/" path.

<p class="info">
When a server is listening for a specific URL and HTTP method, we call that a route.
</p>

Luckily with Express, creating a GET route can easily be created by calling the "get" function on our "app" variable.  The first argument to the "get" function is the path our route is listening for and the second is a function that get's executed when a request matches this route.  Let's define a GET request to the homepage ("/").

```javascript
// app.js
app.get('/', function(req, res) {
  // Our code will go here
});
```

There are a few new things we haven't covered in the above code. First, we are passing an anonymous function as the second argument to the "get" method.

Anonymous functions act the same as regular function but don't have a name.  To define an anonymous function, we use the "function" keyword, followed by parenthesis.  In the parenthesis we have function parameters, separated by commas, which are names given to the arguments passed in.

Following the parentheses, curly braces define the body of the function.  This is where we put the code that the function will execute. To give us space to write code, we put curly braces on different lines.

Notice that the anonymous function has two parameters that Express passes in as arguments on each request.  The first is the parameter "req" (short for "request") and contains data about the request the server received.  The second is "res" (short for "response") which provides methods for sending data back to the server. Express adds methods to these variables to make things easier.

Our route doesn't do anything yet, but let's fix that.  Our goal here is send an HTML file back to the browsers.  Luckily, the "res" variable has a "sendFile" method that lets us specify a file to send to the server.  It takes a single argument and attempts to render that file.  In our case, we are going to pass it the path to "index.html".

```javascript
// index.js
app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});
```

The "__dirname" variable holds the path to our project directory.   We are appending '/index.html' to it since the file will be in the root of our project.

Now that we have one route created, let's make two more for "/about" and "/contact".  Add this to index.js.

```javascript
// index.js
app.get('/about', function (req, res) {
  res.sendFile(__dirname + '/about.html');
});

app.get('/contact', function (req, res) {
  res.sendFile(__dirname + '/contact.html');
});
```

We have our app created and a routes defined, but we haven't written any code to start our server yet.  Before we do that, let's talk a little about ports.

IPs uniquely identify computers on the internet, and ports identify a specific channel on the computer.  Ports make it possible to run multiple servers on the same IP address since different ports won't cause them to conflict.

You can specify which port you want to make the request on in the URL.  To do this, put a colon after the domain name followed by the port number you want to request.  Below, we are requesting trysparkschool.com on port 3000.  If you visit that URL in the browser, you'll notice nothing happens since we don't have a server running on that port.

[http://trysparkschool.com:3000](http://trysparkschool.com:3000)

By default, HTTP is done on port 80 and your browser hides this from you.  Try requesting trysparkschool.com on port 80 and you will get the same results as when you don't specify the port.

Typically when developing and running our server locally, we don't listen on port 80.  This is a good idea for many reasons but primarily allows us to run multiple web servers on the same computer.

Now that we know a little about ports, let's write some code to have our server listen on port 8080. The "app" variable has a method called "listen" that tells the server to start listening for web requests.

```javascript
// index.js
app.listen(8080, function() {
  console.log('Web server listening on port 8080!');
});
```

The first argument is the port we want to run our web server on and the second argument is an anonymous function that gets run when the server starts listening for requests.  This is only called once when the server starts up.

We want to know when our server starts, so the body of our callback function calls the "console.log()" which simply prints the text "Web server listening on port 8080!" to the terminal. 

Your final code for "index.js" should look like this:

```javascript
// index.js
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

app.listen(8080, function() {
  console.log('Web server listening on port 8080!');
});
```

<span id="running-our-server" class="anchor"/>

## Running our server

Now we have our server written, let's run it. Save "index.js" and go to your terminal.

To run javascript files, we use the "node" command.  [Node.js](https://nodejs.org/en/) is a Javascript environment that runs Javascript code for us. The first option passed to the node command is the name of the file we want to run.  Let's run our "index.js" file.

```bash
# Terminal
node index.js
```

To visit our app in the browser, we need to request the "localhost" domain on port 8080 where our web server is listening.

<p class="info">
Localhost is a special domain that points to the local computer.  It is the same as "127.0.0.1" which is the internal IP address of your computer.
</p>

<p class="info">
The server blocks terminal input and listens continuously for web requests.  To stop the server and run commands in the terminal, hold control and press the "c" key.
</p>

Unfortunately if you visit [http://localhost:8080](http://localhost:8080) in the browser, you'll get an error because we haven't created the HTML files we are trying to render.  Let's do that now.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/no-homepage-html-error.png)

<span id="add-html" class="anchor"/>

## Add HTML files

HTML and CSS are out of the scope of this tutorial since we are focusing on building and deploying a Node.js server.  If you want to learn about these, Codecademy has a good [HTML/CSS course](https://www.codecademy.com/learn/web).

Add "index.html", "about.html" and "contact.html" files to the root of our project.

```html
<!-- index.html -->
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

```html
<!-- about.html -->
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

```html
<!-- contact.html -->
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

<p class="info">
I'm using a common CSS library called Bootstrap to style the page.  If you want to add to these pages, you can read the [Bootstrap docs here](http://getbootstrap.com/getting-started/).
</p>

Save those files and visit [http://localhost:8080](http://localhost:8080) in your browser. You should see the following.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/final-homepage.png)

Now that our server is working, let's deploy it to Heroku.

<span id="getting-ready-for-deploy" class="anchor"/>

## Getting our project ready for deploy

To deploy to Heroku, we need to add a few things to our package.json.  The first is the Node.js version we are using.  You can check this by running the following.

```bash
# Terminal
node --version
```

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/terminal-nodejs-version.png)

My node version is "6.9.4".  Let's add this to the bottom of our package.json file. Your package.json file will now look like the following.

```json
// package.json
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

Next let's specify a start script in package.json.  We are adding this part to the "scripts" section.  Your package.json will look like the following.

```json
// package.json
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

```
/node_modules
npm-debug.log
.DS_Store
/*.env
```

Next, we need to have our server listen for the "PORT" environment variable.  Heroku requires us to listen on the port it specifies with that variable.   Your "index.js" file will now look like the following.

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

app.listen(port, function () {
  console.log('Web server listening on port ' + port + '!');
});
```

All we did was add a "port" variable to the top of the file that checks for the "PORT" environment variable and if it doesn't exist, sets port to 8080 for development.  Then we changed our "app.listen()" call to take the "port" variable and added the "port" variable to our "console.log" output.

We can make sure everything is working correctly by running our app locally with Heroku Toolbelt.  Run the following in your terminal.

```bash
# Terminal
heroku local web
```

You'll see the following.

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/package-json-after-init.png)

Visit [http://localhost:5000](http://localhost:5000) in your browser and make sure you can see your web site. 

If everything is working correctly, you're ready to deploy your app to the web. 

<span id="committing-your-files" class="anchor"/>

## Commiting your files

Heroku uses Git to deploy so we need to add our files to our git repo.  To commit files, we first add them to staging.  This command will add all changed files to staging.

```bash
# Terminal
git add .
```

Now we need to commit the files in staging with a message.  

```bash
# Terminal
git commit -m "Initial commit.  Deploying to Heroku."
```

Your files are now committed, let's deploy them to Heroku.

<p class="info">
Anytime you make changes to your project, you need to commit your files before pushing.  You can refer back here to see how.
</p>

<span id="deploying-your-app-to-heroku" class="anchor"/>

## Deploying your app to Heroku

Let's first login to Heroku. 

```bash
# Termainl
heroku login
```

Enter your Heroku login credentials.  When it asks for your password, you'll type but you won't see any characters appear.  They are still being inputted.  Just type your password and press enter. 

Now let's create a server for our app.

```bash
# Terminal
heroku create
```

This will print a URL where you can view your website.  

![](https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/heroku-create-url.png)

Let's push our code to our new server.  

```bash
# Terminal
git push heroku master
```

This will take a minute to run, but when it's finished, you should be able to visit the URL you got above to see your website.

If you want to create a custom domain name, you can read this guide on adding a custom domain to your Heroku app.

<span id="get-the-source-code" class="anchor"/>

## Get the source code

I understand it's hard to follow the tutorial at times.  You can click here to download the source code.

[Get the source code!]()

Congrats on creating your first server!  We are done for today's tutorial.  You just built and deployed your first web server from scratch.  