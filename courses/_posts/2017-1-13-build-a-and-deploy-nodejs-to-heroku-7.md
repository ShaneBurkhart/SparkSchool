---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/7
title: 'Lesson 7: Committing Your Node.js Web App To Git'
fb-title: 'Lesson 7: Committing Your Node.js Web App To Git'
description: Go from no programming experience to building your own Node.js web app from scratch and deploying it to the web with Heroku.
image: https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/coding-on-a-laptop.jpg
---

<p class="info">
I am running this tutorial on a Mac.  If you are on Windows or Linux, a few things will be slightly different.  I make a note of these things, but if you have issues, leave a comment and I'll check it out.
</p>

### Table of Contents
- [Lesson 1: Setup](/tutorials/build-and-deploy-nodejs-app-to-heroku/1)
- [Lesson 2: Creating Your Project](/tutorials/build-and-deploy-nodejs-app-to-heroku/2)
- [Lesson 3: Writing Your Web App](/tutorials/build-and-deploy-nodejs-app-to-heroku/3)
- [Lesson 4: Running Your Web App Locally](/tutorials/build-and-deploy-nodejs-app-to-heroku/4)
- [Lesson 5: Add HTML For Home, Contact And About Page](/tutorials/build-and-deploy-nodejs-app-to-heroku/5)
- [Lesson 6: Getting Your Project Ready For Deploy](/tutorials/build-and-deploy-nodejs-app-to-heroku/6)
- [Lesson 7: Commiting Your Files With Git](/tutorials/build-and-deploy-nodejs-app-to-heroku/7)
- [Lesson 8: Deploying Your Web App To Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/8)

## Initializing your project as a Git repository

Heroku uses Git to deploy so we need to make our project a git repository.  We only need to do this once for our project.

##### Terminal
```bash
git init
```

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
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/8">Start Lesson 8: Deploying Your Web App To Heroku!</a>
</p>
