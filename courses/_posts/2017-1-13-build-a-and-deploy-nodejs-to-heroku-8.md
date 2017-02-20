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

## Get the full course!

Congratulations!  You just built your first Node.js web server from scratch and deployed it to the web with Heroku. **But there's more to learn!**

This was a sample of [my full course that teaches you how to build Twitter in 7 days.](https://trysparkschool.com/twitter-clone-course?utm_source=beginner_tutorial&utm_campaign=twitter_clone&utm_medium=link&utm_content=end) In the full course, you will **learn everything you need to know to build your own projects from scratch!**

I highly recommend this course if you want to get a job as a software developer as quickly as possible!

**This is my favorite course because it's where I see students make the transition to a software developer!**

<div class='content-upgrade'>
    <a class='button' href='https://trysparkschool.com/twitter-clone-course?utm_source=beginner_tutorial&utm_campaign=twitter_clone&utm_medium=button&utm_content=end'>Make the transition to a software developer!</a>
</div>

**Don't waste another second!** Get the full course now to change your career and start your journey as a software developer!

Cheers,<br>
Shane
