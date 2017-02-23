---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/5
title: 'Step 5: Running Your Node.js Web App Locally'
course: Project 1 Course
fb-title: 'Step 5: Running Your Node.js Web App Locally'
description: In this step, we learn how to run our Node.js web app on our local computer.
image: https://s3.amazonaws.com/spark-school/tutorials/nodejs-to-heroku/coding-on-a-laptop.jpg
---

<p class="info">
I am running this tutorial on a Mac.  If you are on Windows or Linux, a few things will be slightly different.  I make a note of these things, but if you have issues, leave a comment and I'll check it out.
</p>

{% include nodejs-to-heroku-tutorial-toc.html %}

## Running our server

Now we have our server written, let's run it. Save "index.js" and go to your terminal.

Early, we talked about how Node.js is used to run Javascript files, so let's use it to run our "index.js" file. To run javascript files, we use the "node" command. The first option passed to the node command is the name of the file we want to run.  Let's run our "index.js" file.

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
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/6">Start Step 6: Add HTML For Home, Contact And About Page!</a>
</p>
