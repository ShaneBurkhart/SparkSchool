---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/2
title: 'Step 2: Creating Your Project and Installing Express.js'
fb-title: 'Step 2: Creating Your Project and Installing Express.js'
description: In this step, we are creating a directory for our Node.js app, initializing package.json and installing Express.js.
image: https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/coding-on-a-laptop.jpg
---

<p class="info">
I am running this tutorial on a Mac.  If you are on Windows or Linux, a few things will be slightly different.  I make a note of these things, but if you have issues, leave a comment and I'll check it out.
</p>

### Table of Contents
- [Introduction](/tutorials/build-and-deploy-nodejs-app-to-heroku/intro)
- [Step 1: Setup and installation](/tutorials/build-and-deploy-nodejs-app-to-heroku/1)
- **Step 2: Creating your project and installing Express.js**
- [Step 3: Writing your first web app with Node.js and Express.js](/tutorials/build-and-deploy-nodejs-app-to-heroku/3)
- [Step 4: Running your Node.js web app locally](/tutorials/build-and-deploy-nodejs-app-to-heroku/4)
- [Step 5: Add HTML for home, contact, and about pages](/tutorials/build-and-deploy-nodejs-app-to-heroku/5)
- [Step 6: Getting your Node.js app ready for deploy to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/6)
- [Step 7: Commiting your files with Git](/tutorials/build-and-deploy-nodejs-app-to-heroku/7)
- [Step 8: Deploying your web app to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/8)


## Creating your project folder

We need a place to store our project files, so let's create a directory (folder) to store them in.  In this tutorial, I'm going to call my directory "NodeApp" and put it on my Desktop.  Go ahead and do that now.

Now that we have a project directory, let's navigate to it from the command line.  On OS X and Linux, we can open the command line with an application called "Terminal" and on Windows, it's called "Git Bash".  For the rest of the tutorial, I'll refer to this program as the command line or terminal interchangeably.  Open this program now.

When your terminal opens, navigate to our project directory with the following.

##### Terminal
```bash
cd ~/Desktop/NodeApp
```

Now that we've navigated to our project directory, we need to initialize our project.

<span data-sumome-listbuilder-embed-id="1778570efe1607df29fa777878e6f0f764db48b346ef4959d0256a69511ce6a5"></span>

## Creating package.json for your project

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

<p class="next-lesson">
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/3">Start Step 3: Writing Your First Web App!</a>
</p>
