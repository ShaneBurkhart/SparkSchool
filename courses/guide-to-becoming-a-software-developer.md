---
layout: default
permalink: /ebooks/guide-to-becoming-a-software-developer
title: Complete Guide To Becoming A Software Developer
disable-comments: true
---

The truth is you don't need a college degree to get a job as a software developer.  How do I know?  Because I don't have a college degree and have worked as a software developer at Yelp, Carfax, and a startup called SumoMe. 

It turns out that 55% of software developers don't have a degree in computer science or any related field, according to Stack Overflow's 2016 survey. This means that over half of software developers don't have a college degree related to their job.  It's obvious software companies don't care if you have a college degree, but what do they care about then?

Companies want to see that you have real experience and don't care about your formal qualifications.  This opens endless opportunities for people to teach themselves software development.  And with the growing number of learning resources, there's no reason you need a college degree to get a job as a software developer. 

Even with the abundance of learning resources, there aren't many great guides to help people get a job.  This guide fixes that by laying out a step-by-step path to becoming a software developer.  I know this method works because it is the same one I used to get 3 reputable tech jobs.

The entire process will take around 500-700 hours of teaching yourself to code, building a portfolio, and applying to companies.  That may seem like a lot of time, so I've broken it into three main steps: learning, practicing, and applying.  I'll go into more details below.

<p class="info">
I'm going to focus on web development since it's a growing field and nearly everything is moving to the web.  Even if you want to pursue a different form of software development, the basic steps still apply.  You will need to Google your own learning resources, though.
</p>

## Learning  

Right now, you more than likely have little to no programming experience, but that's okay.  The first step to becoming a software developer is learning how to program.  Since you are learning web development, you need to learn how to build web applications.  But what is a web application?

A web application, or web app for short, is simply a website that interacts with the user to manage data.  You probably use web apps all the time and didn't even know it.  Facebook and Dropbox are great examples of common web apps.

Learning how to build a complete web app will take around 200 hours. You won't be an expert, but after 200 hours, you should know everything you need to build your own projects.
 
You would more than likely get overwhelmed if you tried to learn everything about web apps at once.  So instead, I recommend starting with a small, but functional project and building on it from there.  With that in mind, I split the learning portion into 3 projects that gradually build on each other.  Let's get started on your first web app!

### Project 1: Build and deploy a simple web app

Since you more than likely don't have any programming experience, it's important to learn some fundamentals immediately.  For your first project, I suggest building a web app that only renders a few web pages.  You need to learn the following in this project:

#### How websites work

Since you are learning web development, you need to understand the basics of the internet.  What this really means is understanding what happens when a browser makes a request to a website.  You need to understand the difference between client and server, what makes up a URL and what happens when a web browser requests a web page.

[Here is a great article on how websites work!](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works)

#### Basics of building a web server

Websites run on web servers. Web Server is a fancy name for a computer that is connected to the internet and serves web pages to the user's browser.  There are a lot of programming languages you can use to create web servers, but I recommend Javascript since it is relatively fast, easy-to-use and is used by a lot of big tech companies like Netflix, PayPal, and LinkedIn.  

To write web servers with Javascript, you use Node.js.  Node.js is a program that runs Javascript code on a web server.  You'll hear a lot of people use Node.js and Javascript interchangeably when talking about web servers.  

#### How to deploy your app to the web

When learning, I find it's really important to deploy projects to the internet. Seeing the final product will help you stay motivated because you see real results rather than blindly creating something you won't use.  To deploy your web app, I recommend using Heroku.

Heroku makes deploying a Node.js web app simple by providing already configured servers for your app.  All you have to do is send Heroku your code and tell them how to start your web app.  They do the rest!

#### All of this in one tutorial

Piecing together programming concepts as a beginner is difficult and time-consuming. I created a free tutorial that will walk you through all of the above concepts. The tutorial takes you from no programming experience to building and deploying your first web app from scratch.

[Click here to take the tutorial!](https://trysparkschool.com/tutorials/build-and-deploy-nodejs-app-to-heroku/intro)  

The tutorial should take around 10-20 hours, so pace yourself.  Because it's your first project, you will get frustrated at times.  If you run into trouble, don't get discouraged. Instead, take a break, come back later with a fresh perspective.

<p class="info">
Remember, learning is about consistently working towards your goal.  You are inevitably going to run into issues. Don't get discouraged &mdash; it's part of learning.
</p>

### Project 2: Making your web app interactive

Up until now, you have created only static web pages.  In this project, you will store data and dynamically populate web pages with that data. Creating dynamic web pages and allowing users to manipulate data is what separates a web app from a website. This is the foundation of every web app. 

You should focus on the following in this project.  

#### Database/SQL

A database is simply a place where you can manage and store information. There are a lot of different databases, but I recommend learning MySQL since it’s general purpose and widely used.  

To read and write to your database, you use a programming language called SQL (Simple Query Language).  As the name implies, the language is simple and doesn't need to be learned intimately.  Instead, there are a handful of commands that cover most uses.

[Codecademy has a good tutorial on SQL](https://www.codecademy.com/learn/learn-sql)

[Here's how you can implement MySQL with Node.js](https://www.sitepoint.com/using-node-mysql-javascript-client/)

#### HTML/CSS 

Every web page uses HTML and CSS to render web pages. HTML is used to define the structure of elements on a web page while CSS is used to position and style those elements. 

You don't need to spend a lot of time learning HTML or CSS intimately.  Only learn basic syntax and use a reference for the rest. 

[Codecademy has a good tutorial on HTML and CSS](https://www.codecademy.com/learn/web)

[HTML reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)

[CSS reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)

#### Create dynamic web pages

You need to learn how to fetch data from the database and render that data on a web page. To do this, you use a templating language.  Templating languages pass data to HTML files to populate elements with data.

For this project, I recommend a templating language that closely resembles HTML.  This will make learning easier.  My recommendation is to start with EJS.

[Here's how you can use EJS with Node.js](https://coligo.io/templating-node-and-express-apps-with-ejs/)

[EJS reference](http://www.embeddedjs.com/)

#### Command line.  

When you perform an action on a computer, like click a button, a command is sent to the computer to tell it what to do.  You don't see this happen because the operating system hides it from you. However, you need to run commands manually when developing software. To do this, you use the command line.

Like HTML and CSS, you don't need to learn the command line intimately.  You will constantly use the command line and will naturally pick it up as you go.  Instead, it's more important to understand the structure of a command and how to run it.

[Here's a guide to learn the command line.](https://www.codecademy.com/learn/learn-the-command-line)

<p class="info">
The windows command line is lacking a lot of features Mac OS X and Linux have.  There are ways to get around this and my <a href="">Twitter clone course</a> addresses this.  If you are on Windows, I highly recommend taking the Twitter clone course.
</p>

#### My course teaches you all of this

In the above sections, I listed learning resources for each technology that will teach you everything you need to know to build project 2. Having said that, learning each technology separately isn't the most efficient way to learn. 

A more efficient method is to learn as you are building the project.  This method gives you a more hands-on approach and helps you understand why you are learning each piece.  Luckily I have a course that does just that.

In my course, you will build a small version of Twitter. The course teaches you all of the above concepts and walks you step-by-step through building a web app that can manage Tweets.  I highly recommend this course if you want to become a developer as quickly as possible.

[Click here to view the Twitter clone course!]()

### Project 3: Adding complexity to your web app

#### Project design

As your projects grow bigger, they inevitably grow harder to maintain.  To fix this, you need to understand common design practices that make maintaining code easier.  A common pattern right now is Model View Controller or MVC for short.  It is designed to keep your web app modular so each part is easy to maintain.  

[Here's a good explanation of how MVC web apps work.](https://realpython.com/blog/python/the-model-view-controller-mvc-paradigm-summarized-with-legos/)

#### User authentication

Nearly every web app has users, so you need to learn how to store passwords, log users in and manage what privileges each user has.  This is one of the harder concepts to grasp, but after doing it yourself, you'll quickly understand what's going on.

[Guide to password hashing and why it's important](https://crackstation.net/hashing-security.htm)

[Here's how to implement user authentication with Node.js](https://scotch.io/tutorials/easy-node-authentication-setup-and-local)

#### Take credit card payments

Most software companies take credit cards, so you'll need to know how to process them.  Making a web server secure enough to store credit cards is a time-consuming process filled with security checks and audits.  Fortunately, processing credit cards is easier than ever if you use a 3rd party payments service.

Third party providers make it so your server never touches a credit card.  Instead, they do all of the heavy-lifting for you.  One of the best online payments providers is Stripe.  They ease the process of taking credit cards and provide a number of guides on how to use their software.  On top of that, they only charge per transaction so you only pay for what you use.

[One time payments with Stripe with Node.js.](https://nairteashop.org/getting-started-with-stripe-part-2/)

[Subscription payments with Node.js example.](https://github.com/eddywashere/node-stripe-membership-saas)

#### Git

Git is a tool that takes snapshots of your code at specific points in time.  This is called version control and early every professional software project uses Git. Being able to take snapshots of your code will save you a lot of headache in the long run.  Undo can only go so far.

As well as keeping history, Git makes it easy for multiple people to collaborate on a project.  Two people can work on the same line of code at the same time without issues. Git is a must have if you are working on a project with other developers.

[Here's a 15 minute tutorial on Git](https://try.github.io/levels/1/challenges/1)

[Simple guide/reference for Git](http://rogerdudler.github.io/git-guide/)

#### Create portfolio with Github

Github is a company that makes it easy to store Git projects in the cloud.  After a project is uploaded, anyone who visits your account can see the code in your project.  I cannot stress how useful this is for building portfolios as a software developer.  Having an active Github account with a few projects will go a long way when applying for jobs. 

[How to upload your project to Github](https://guides.github.com/activities/hello-world/)

#### Interfacing with web APIs

API stands for Application Program Interface and means a way for programs to communicate with an application. More specifically, web APIs are used to communicate with other websites. It's common for web apps to interface with web APIs.  This project uses them to communicate third party services such as Stripe for taking credit cards.

#### Client-side Javascript

Node.js runs Javascript code on a web server, but you can also run Javascript code in the browser.  Since you already know Javascript, it will be easy for you to jump into writing Javascript code for the browser.

I recommend trying basic client-side Javascript with jQuery.  jQuery is a simple library that makes it easy to manipulate HTML and element styles among other things. With the basic Javascript knowledge you already have, it should be pretty easy to pick up.

[Here's a good course on jQuery](https://www.codecademy.com/learn/jquery)

#### Tools to write HTML/CSS more efficient

HTML and CSS are verbose and tedious to write.  You can change your templating language to one that cuts out extra symbols to make writing HTML more efficient.  The Pug templating language is good for this.

[Use Pug with Node.js](https://expressjs.com/en/guide/using-template-engines.html)
[Pug documentation](https://pugjs.org/api/getting-started.html)

There are also languages that compile down to CSS files to make writing CSS more efficient.  These are called CSS preprocessors and I recommend learning Sass. It is my favorite.  

[Saas documentation](http://sass-lang.com/guide)

You will need to compile Sass down to CSS, so you need to setup a tool to do that.  There are a few options, but I recommend Gulp.  Gulp uses a file called "gulpfile.js" which defines tasks to build your project.  You can define a Gulp task to do whatever you want, but they are primarily used to build client-side assets (Javascript, CSS, images, fonts, etc.) 

[Gulp](http://gulpjs.com/)
[Compile Sass with Gulp tutorial](https://css-tricks.com/gulp-for-beginners/)

#### I'm working on a course

It's especially hard to find tutorials that encompass all of the above concepts.  Because of this, I can't recommend a complete tutorial.  Instead, you'll need to piece things together from the above tutorials.  Because that's not ideal for you, I'm working on a course that will teach you everything from project 3.  I'll be sure to let you know when it is released.

## Practicing

Now that you can code, you need to practice your skills on real projects.  Your goal for this section is to build a portfolio and acquire enough experience to get a job as a software developer.  This means you need to try to mimic working in a software company as much as possible.  

There are any number of ways to do this, but ideally, you should be working with other people.  Software companies want to see that you can work on a team and have experience working on projects with other developers.  Working with others will also help you learn faster since you can share information with each other.

As well as working on a project with someone, your project should be built without following a tutorial.  This forces you to solve your own problems rather being told what to do.  It's important that you know how to find solutions to issues that run into. Developers call this debugging and you will get very good at it.

Although this section isn't labeled "learning" you are still learning a great deal about how to be a software developer.  This kind of learning, however, is about how to solve problems rather than learning syntax or design.  

You may already have a project idea in mind, but if you need some help with an idea, I've made a list to help you find projects to work on.

### Project Ideas

You can find a software project to work on just about anywhere.  Whether you want to build your own idea, solve a problem for a friend or contribute to the community, there's a never-ending supply of projects to work on.

Since you are building a portfolio of projects, every project you work on should be pushed to your Github given that you are allowed to post it publicly.  Building a portfolio takes time so it is important to start early.

#### Personal projects

These are projects that you build because you have an idea for a website or web app.  A lot of people have some kind of problem they want to solve.  For instance, you might want to automate your grocery shopping by building a web app that easily lets you select recipes you want to eat for the week.  

To find ideas for personal projects, think about pain points in your life that you think could be solved or optimized with software.  Finding ideas will naturally become easier as you learn more about programming and what it can do.  

Employers love it when people solve real world problems with software.  There isn't really a better project for your portfolio than one that you built because you wanted to see it happen.  It doesn't matter if it is simple or complex as long as you built it without following a tutorial.

This is also a great way to stay motivated since you are building projects for yourself and can see immediate results as you are working. 

#### Build a business or service

This is similar to building a personal project, but if you see someone with a problem that could be optimized or solved with a website, then there are likely others with the same issue.  Make a solution to that problem and offer it to them either free or for a fee.  If you solved their problem well enough, then they will more than likely give you money for the solution.

This is also a really good project to have in your portfolio since you are doing exactly what a software company does on a daily basis.  Every software company solves problems users have and you have first-hand experience doing it.

#### Open source projects 

Open source projects are projects whose code is public and anyone can contribute to.  Nearly every tool used for software development is free because of contributions to open source projects.  Every software company uses open source projects so it's natural for developers to want to give back to the community. 

Github is full of open source projects to contribute to.  [Here's are some beginner friendly projects.](https://github.com/MunGell/awesome-for-beginners)

#### Donate your skills for cheap or free

The need for software developers is higher than ever and the truth is they are expensive to hire.  This causes software at companies and organizations that aren't tech-focused to have poor quality.  Charities, nonprofits, and small businesses don't usually prioritize developer talent, but you can help them out.  

All you have to do is let them know you are a developer who wants to help out with their website.  Tell them you will work for free or at a cheaper rate.  In exchange, you get real experience working on software used by real companies.  And you get to help people along the way.  Everyone wins!

#### Consulting/freelancing

This is a little more difficult for beginner software developers since people hiring consultants or freelancers want to see previous projects.  Having said that, there are a few sites that can make it easier to find work.  

[Here's a list of 50 places you can find freelance research.](http://www.hongkiat.com/blog/50-freelance-job-sites-for-designers-programmers-best-of/)

Ideally, you want to work on web apps projects, but even helping someone with HTML, CSS, and Wordpress can be a good experience.

#### Offer your help on projects friends are doing

If you know someone in the software industry right now, you might ask them what projects they are working on.  Let them know that you are learning and would be more than happy to contribute in any way you can.  Don't be pushy on this because some people want to work on their projects alone.  Just offer help and they will pursue it if they want.

#### Imitate features of other sites

Mimicking features from other software companies is one of the best ways to get real experience working at a software company.  You won't be able to mimic the whole site, but you can implement specific features for your own projects. To do this, pick a feature on a site, and figure out how you would implement it. You will run into similar issues the original developers did which teaches you real world experience.

The key to getting experience is to do stuff on your own without a tutorial.  [Stack Overflow](http://stackoverflow.com/) is a great resource to find answers to your questions.  You can also reference previous tutorials, but I wouldn't copy and paste.  You want to build a portfolio of projects you created, not ones that you cobbled together.

You'll also learn how to read other people's code when searching for solutions to problems.  This is important when working at a software company because you are working in code that other people wrote.  You need to be able to analyze a piece of code and determine what it does.

Another useful skill you will pick up is how to read software documentation. Software documentation contains everything you need to know about using a particular piece of software. You will quickly learn how to read software documentation when searching for solutions to your issues.

I cannot stress this enough. Start building a Github portfolio right now! Employers go crazy for an active Github account and it shows that you not only know what you are doing, but are also passionate about your work.  All you need is one good project built from scratch without a tutorial that you can talk about technically.  You get bonus points if you worked on it with someone else.

Once you have some experience and a portfolio to show employers, it's time to start applying to software companies. 

## Applying

You've spent 500 hours acquiring experience and are finally ready to start applying to companies.  This is the moment you have been waiting for!

During this time, you still need to work on projects and build your portfolio, but you will also spend time applying to companies.

Remember, you are a beginner so you will get a lot of companies saying no.  Don't get discouraged!  Rejection is expected.  You only need one company to say yes, so you need to play the numbers game by applying to a lot of companies.

Even though it's hard not to, don't view rejection as negative.  Every time you fail an interview, you learn how to never make that same mistake again and are now one step closer to getting a job.  A lot of interviews are similar, so next time, you will be prepared.

Before you get into the interview process, let's talk a little about writing a resume and creating a cover letter.

#### Writing your resume

Your resume should be tailored towards tech and the company you are applying for.  Since you don't want to spend a lot of time rewriting your resume for each company, I recommend making a general tech resume and modifying it for each company.  You simply need to re-order things so the more relevant point to the company come sooner.  

For instance, if you have Javascript and Ruby projects and the company you are applying for develops in Ruby, make sure to put your Ruby projects towards the beginning. Don't make companies guess if you have what it takes to work there &mdash; show them.

[Here's an awesome discussion on creating tech resumes.](https://www.quora.com/How-can-a-software-engineer-write-a-killer-resume)

#### Writing cover letters

Some companies require a cover letter to go with your resume.  This is your opportunity catch the company's attention and set yourself apart from other applicants.  Like your resume, I recommend writing a general cover letter and modifying it for each company.

My cover letters generally consist of 3 to 4 paragraphs.  The first paragraph or two are tailored to the value you bring to the company.  Show them why you would be a good fit to work at their company specifically.

Following that, I have a couple general paragraphs about myself.  These usually tell my story and talk about how hard I've worked to get here.  Cover letters give you an opportunity to show your personality and connect with the company. Don't be afraid to talk about yourself.

Software companies want to know that you have some experience, are willing to learn and are passionate about what you do.  Don't make them guess.  Instead, address their concerns in your cover letter and show them examples of work you've done that illustrates each of those points. 

#### Start applying

The best plan for applying to companies is to apply regularly.  Like I said above, applying is a numbers game and you need to give yourself time to figure it out.  Applying to every company at once will more than likely overwhelm you with interviews, so instead, I recommend doing a couple interviews a week.

The first thing you'll want to do is make a big list of all companies that you are interested in working for.  Add companies you find to a spreadsheet with a link to their application page, a little about what they do and what technologies they use (if you can find it).  I recommend shooting for at least 20 companies, but you should put more down if you can.  The more you list, the higher your chances are of finding a job.

Having trouble finding software companies in your area? Try some of these tips:

[How to find entry level software developer jobs?](https://www.quora.com/How-do-I-search-for-entry-level-software-developer-jobs)
[List of places to find software developer jobs.](https://www.quora.com/What-are-the-best-job-boards-for-software-engineers)

Once you have a solid list of companies, you can start applying to a few a week.  You are only doing a few at a time because the interview process is time-consuming and you will get overwhelmed or burned out.  

Your first few interviews are more than likely going to go poorly.  That is completely okay. You've never interviewed with a software company before, so how can you expect to be good at it?  Instead, take each interview as an opportunity to learn and grow more confident in your skills.  Interviewers will usually give you feedback if you ask for it.  No one can blame you for wanting to learn and improve yourself (if they do then you don't want to work there anyways).

#### The interview process

I could talk about the software company interview processes for days, but there's already a book that has all of the answers.  It's called Cracking the Coding Interview and is recommended by just about every developer in the industry.  The book primarily covers the interview process at big tech companies, but the same concepts still apply to small companies.  I'll talk more about this in the "Landing a job at a big tech company" section below.  If you want to nail your interview, I highly recommend getting a copy of Cracking the Coding Interview! 

[Click here to get your copy of Cracking the Coding Interview!](http://amzn.to/2l9TSUV)

#### Follow up!

I can't stress how important it is to follow up!  Don't be annoying. But if you haven't received a response in a few days to a week, send your recruiter a friendly "how's it going" email.  As long as you aren't pushy, this shows interest and provides a good opportunity to ask for feedback. Remember, the more feedback you get, the quicker you will learn.

#### Landing a job at a big company

As a new developer, it's going to be hard to work at big tech companies like Google or Microsoft.  They get so many applications that their interview process is designed to specifically avoid making bad hires.  This means they have a higher standard for hiring since they can be picky, which makes it hard to even get an interview.

On the other side of the spectrum, smaller companies are generally going to be easier to get jobs at because their volume of applications is much lower.  Their interview process is optimized to get as many proficient developers as they can.  They are alright with hiring someone that is a beginner as long as you can prove you know what you are doing.  A lot of smaller companies are also primarily focused on product, so coding ability is a lesser concern than getting the job done.  This means you have the greatest chance of landing your first job at a smaller tech company.

**Don't give up your dreams of working at Google just yet, though!**

After your first job, you'll have no problem getting interviews and opportunities at large tech companies.  Your goal at your first job should be to learn as much as you can about working in a tech company.  Pay attention to how things work, what processes they use, and industry standards.  Even with the practice you have, you will still a lot to learn at your first job.  After about a year or so, you will have the experience to get a job at just about any tech company you want.

### Make finding a job easier

Cold applying for jobs is time-consuming and full of rejection. The easiest method to find a job is through referrals from employees that already work there. Companies are more willing to hire a referral than a cold applicant.

That's great, but you're probably asking yourself, "how can I do that if I don't know anyone in the industry?"

You're right, you don't know anyone yet. But it is really easy to find software developers in your area. Most cities have software or programming groups that meet periodically.  Even if a group isn't directly related to the work you are doing, being around software developers of any kind is beneficial.  Here's a list of places to find meetups:

- **Meetup.com** - a lot of groups use meetup for their community.  
- **Facebook Groups** - you can find a local facebook group, or join one remotely.  I recommend trying to find a local group.
- **Conferences** - depending on where you live, there are sometimes small conferences for different technologies or projects. Google for "software conferences in X".
- **Hackathons/Startup Weekends** - hackathons are events where participants build a project or business in a few days.  This is a great way to work on cool projects and be around passionate developers.  Google for "startup weekend near X" or "hackathons near X".

Your goal at these events is to meet people and be friendly.  Talk for a while and suggest that you exchange emails so you can grab a coffee sometime. Continue to nurture these relationships consistently and job opportunities will come naturally.  The developer community is helpful, so they will let you know if they see openings.

<p class="info">
I am not telling you to ask every software developer you meet for a job.  More than likely, you'll get anything but a warm response.  You want to meet people, make friends, and cultivate relationships.  Opportunities will naturally arise and when the time is right.  You can extend an occasional inquiry, but don't be pushy.
</p>

### It's up to you now

I can only tell you what to do, I can't do it for you.  Ultimately, becoming a software developer is a time-consuming process, but it will be more than worth it at the end.  I know if you follow this guide and consistently work towards your goal, you will come out with not only a new skill set but also a good job to go with it.

This process is what I used to teach myself how to be a software developer and I've worked at Yelp, Carfax and a startup called SumoMe.  I wouldn't offer you this guide if I didn't 100% believe you can use it to get a job as a software developer.  

Happy coding,
Shane