---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/5
title: 'Step 5: Add HTML For Home, Contact, and About Page'
course: Project 1 Course
fb-title: 'Step 5: Add HTML For Home, Contact, and About Page'
description: In this step, we are adding HTML for our home, contact and about pages.
image: https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/coding-on-a-laptop.jpg
---

<p class="info">
I am running this tutorial on a Mac.  If you are on Windows or Linux, a few things will be slightly different.  I make a note of these things, but if you have issues, leave a comment and I'll check it out.
</p>

### Table of Contents
- [Introduction](/tutorials/build-and-deploy-nodejs-app-to-heroku/intro)
- [Step 1: Setup and installation](/tutorials/build-and-deploy-nodejs-app-to-heroku/1)
- [Step 2: Creating your project and installing Express.js](/tutorials/build-and-deploy-nodejs-app-to-heroku/2)
- [Step 3: Writing your first web app with Node.js and Express.js](/tutorials/build-and-deploy-nodejs-app-to-heroku/3)
- [Step 4: Running your Node.js web app locally](/tutorials/build-and-deploy-nodejs-app-to-heroku/4)
- **Step 5: Add HTML for home, contact, and about pages**
- [Step 6: Getting your Node.js app ready for deploy to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/6)
- [Step 7: Commiting your files with Git](/tutorials/build-and-deploy-nodejs-app-to-heroku/7)
- [Step 8: Deploying your web app to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/8)

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

<p class="next-lesson">
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/6">Start Step 6: Getting Your Web App Ready For Deploy!</a>
</p>
