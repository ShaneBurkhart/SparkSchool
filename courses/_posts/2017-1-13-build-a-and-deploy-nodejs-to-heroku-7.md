---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/7
title: 'Step 7: Committing Your Node.js Web App To Git'
fb-title: 'Step 7: Committing Your Node.js Web App To Git'
description: In this step, we are creating a Git repository and committing our project files so we can deploy to Heroku.
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
- **Step 7: Commiting your files with Git**
- [Step 8: Deploying your web app to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/8)

## Initializing your project as a Git repository

Heroku uses Git to deploy so we need to make our project a git repository.  We only need to do this once for our project.

##### Terminal
```bash
git init
```

<p class="info">
When deploying new changes, you don't need to run this command again.  Instead, skip to the "Committing your files" section below.
</p>

<span data-sumome-listbuilder-embed-id="1778570efe1607df29fa777878e6f0f764db48b346ef4959d0256a69511ce6a5"></span>

## Committing your files

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

<p class="next-lesson">
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/8">Start Step 8: Deploying Your Web App To Heroku!</a>
</p>
