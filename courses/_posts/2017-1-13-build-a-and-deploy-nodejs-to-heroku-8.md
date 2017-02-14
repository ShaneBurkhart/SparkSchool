---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/8
title: 'Step 8: Deploying Your Node.js Web App To Heroku'
course: Project 1 Course
fb-title: 'Step 8: Deploying Your Node.js Web App To Heroku'
description: In this step, we are creating a Heroku web server and deploying our Node.js web app to Heroku.
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
- [Step 5: Add HTML for home, contact, and about pages](/tutorials/build-and-deploy-nodejs-app-to-heroku/5)
- [Step 6: Getting your Node.js app ready for deploy to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/6)
- [Step 7: Commiting your files with Git](/tutorials/build-and-deploy-nodejs-app-to-heroku/7)
- **Step 8: Deploying your web app to Heroku**

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

<span data-sumome-listbuilder-embed-id="0b93adfbc532f959fce02f7126a909cc07424bbe42a7f6750cee50b624a205ad"></span>

Congratulations!  You just built your first Node.js web server from scratch and deployed it to the web with Heroku.  From here, you can modify the app to fit your needs.

I would love to see what you guys build with this tutorial!  When you deploy your site, show it off by commenting below with a link to your websites.

