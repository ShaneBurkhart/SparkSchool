---
layout: default
permalink: /tutorials/build-and-deploy-nodejs-app-to-heroku/6
title: 'Step 6: Getting Your Node.js App Ready For Deploy To Heroku'
fb-title: 'Step 6: Getting Your Node.js App Ready For Deploy To Heroku'
description: In this step, we are getting our Node.js web app ready to be deployed to our Heroku web server.
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
- **Step 6: Getting your Node.js app ready for deploy to Heroku**
- [Step 7: Commiting your files with Git](/tutorials/build-and-deploy-nodejs-app-to-heroku/7)
- [Step 8: Deploying your web app to Heroku](/tutorials/build-and-deploy-nodejs-app-to-heroku/8)

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

<p class="next-lesson">
    <a class="button block" href="/tutorials/build-and-deploy-nodejs-app-to-heroku/7">Start Step 7: Committing Your Files To Git!</a>
</p>
