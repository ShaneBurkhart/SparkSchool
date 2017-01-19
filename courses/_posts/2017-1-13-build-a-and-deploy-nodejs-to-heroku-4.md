---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/4
title: 'Step 4: Running Your Node.js Web App Locally'
fb-title: 'Step 4: Running Your Node.js Web App Locally'
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
- [Step 3: Writing your first web app with Node.js and Express.js](/tutorials/build-and-deploy-nodejs-app-to-heroku/3)
- **Step 4: Running your Node.js web app locally**
- [Step 5: Add HTML for home, contact, and about pages](/tutorials/build-and-deploy-nodejs-app-to-heroku/5)
- [Step 6: Getting your Node.js app ready for deploy to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/6)
- [Step 7: Commiting your files with Git](/tutorials/build-and-deploy-nodejs-app-to-heroku/7)
- [Step 8: Deploying your web app to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/8)

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

<p class="next-lesson">
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/5">Start Lesson 5: Add HTML For Home, Contact And About Page!</a>
</p>
