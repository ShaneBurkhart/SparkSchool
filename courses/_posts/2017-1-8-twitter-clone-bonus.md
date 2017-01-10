---
layout: default
permalink: /courses/twitter-clone/8/1
title: '8.1 Deploying Your App To The Web With Heroku'
course: Twitter Clone
section: 'Bonus: Deploying Your App To The Web'
---

Heroku provides free hosting that makes it really easy to deploy web apps.  You simply have to add some files to your project and Heroku will do the rest.

Before we can deploy to Heroku, we need to make sure our project is configured correctly.  

```javascript
app.get('/', function () {
	console.log('Hello world!');
});
```

Heroku uses the package.json file to detect if our app is a Node.js app.  
Remember how we added the '--save' option on our npm install commands?  That saved all of our dependencies in package.json and Heroku will use that to install our dependencies.

You package.json should look like the following.  You can see all of the dependencies we installed.

We need to add the node version we are using.  You can find this by running the following command in your Terminal.

node --version

Add that to package.json

"engines": {
	"node": "4.1.1",
}

Update start script in package.json

Update app to use PORT env variable, defaulting to 8080.

Test you app locally to make sure it will work before deploying.  It's never a good idea to push untested to code to a live server.  More than likely there will be an error.

Git is version control that essentially takes snap shots of the code at different points.  These snapshots are called commits and a git repository is a collection of commits.  Usually one git repository for one project.

We aren't going to go over git completely here, but I recommend you create a Github account and put all of your code there.  Just about every project I've made is on my Github account.  You never know when you might need a piece of code from another project.  This is also great to show potential employers because it shows you are actively coding and they can see all of you code.

Init git repository and add .gitignore to ignore our build files.

Now let's add our files to our repository

git add .
git commit -m "Initial commit for Heroku deploy"

heroku login
heroku create

Add the ClearDB MySQL plugin.

heroku addons:create cleardb:ignite