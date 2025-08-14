/*
Schema migrations are all about making very careful and well-planned changes to the structure of your database.
So we are talking about adding columns to a table, removing columns, changing the name of a column, adding tables, removing tables, and so on.

you are an engineer working at Instagram in charge of managing their database.
you are working at Instagram, you have to make a couple of changes to the structure of the database.


We are pretending that you are an engineer working at Instagram.
You are in charge of specifically the comments table.
In order to make changes to the comments table, you are working with two separate copies of Postgres.
One copy of Postgres is hosted on your local machine.
Another copy of Postgres is hosted on Amazon Web Services.
There are two copies of this database for you to work with so that you can make changes to the copy of Postgres on your local machine and just test out that these changes are working as expected.

So you essentially have a development environment on your computer.
Once all those changes are working the way you expect on your local machine, you then make those changes to the production database hosted on AWS.
So all of your actual user data lives inside of this database over here.

This entire flow of having a local development environment separate from a production environment is extremely common.
So this whole setup is totally fine, totally reasonable.
So let's imagine that you show up to work one day and you get some feedback from some other developers.

And these other developers tell you that on the comments table there is that contents column and the feedback is the name of this column is not good.

Contents and comments already sound very similar.
The name of the table is very similar to this column name.

In addition, it's really challenging to remember if this is contents or content.
So the feedback that you are getting from other developers is that this column name needs to change.
Do you say?

Okay, well, that's a simple change.

You and I in this course haven't really discussed how to rename columns yet, but just, you know, it's a very simple and easy process.
So you decide that all you should have to do is rename that column. Very simple, very straightforward change.
So on your local machine, you would take that comments table, you would run a statement like this right here, which will rename that column from contents to body. That is your solution.

You say we're going to have a new column called Body.
Now, you're not actually moving any data around here or anything like that. You are just renaming the column.

This is a very inexpensive, very fast, very easy operation inside of Postgres.
So this is, in theory, a very low risk change. So again, you go ahead and make this change on your local machine.

When you run that statement, you don't get any errors or anything like that.
And so you figure, hey, everything looks good, Let's go ahead and make this change to our production database hosted on Amazon Web Services.

So you go ahead and open up Pgadmin. You connect to your production database hosted on AWS and run that same kind of statement right there.
Now, just, you know, doing something like this, connecting to your production database and making a change to the structure of that database using pgadmin, that is something that's going to get you into trouble for reasons that we're going to see very quickly.

So you go ahead and make this change to your production database. And lo and behold. About 0.001 seconds.
After you make that change, sirens start going off in your office, alarm bells are going off and you start getting emails saying that there are some critical errors coming out of your application.

And so chances are it's all tied to that rename of that column of contents over to body. But what happened? Why are there errors at all?
Well, let's think about the overall structure of your application. Some kind of like Instagram. Like application.

Okay.

So for some kind of Instagram like application, you might have some kind of request coming in to an API server.
This request might be issued whenever some user tries to create a comment. That request will go to some kind of API server.
The API server will then try to extract some comment text from the request itself. Use that text to build up some kind of SQL statement to insert or create a comment and then send that off to the database.

Just one little issue.

You just renamed that contents column over to body, but you never made any changes to the API server itself.
So whenever the API server builds up some statement to insert a new comment, it might still be referring to that contents column and it is not referring to that new body column. So as soon as you run some state statement like this right here, Postgres might throw an error and say, Hey, there is no contents column. We have a body column, but there's definitely not a column called Contents.

And so your API server would start to throw some errors because you are trying to run some invalid SQL statement.

Okay.

So we're going to take a very brief breather right here and reflect on big lesson number one.
Big lesson number one is that any time that we make a change to our database structure, we have to synchronize that and deploy it at the same time that we change our clients as well. So in other words, if we change that contents column over to body inside of our comments table, we need to make sure that it just about the same time we make that change, all of our different clients, such as an API server, are told, Hey, you need to run this new version of code that is going to refer to a body column and not contents anymore.

We can kind of imagine this entire scenario in a sort of time diagram like this right here.
So in this diagram, we've got three columns, one for the database, one for some kind of change that we need to make to our API and then one for the existing running API. So on the top left hand side is the change that we need to make to our database. You are trying to run a command that's going to rename the contents column over to body. That operation is going to be very quick and very inexpensive. You are able to rename a column in just a fraction of a second.

So in theory, what you really want to do here is try to make that change at just about the same time that you start to deploy a new version of your code, a version of that code that's going to refer to the body column instead of contents. Now, even if you try to make these two changes at the same time, you can still run into a little trouble doing an A deployment of some kind of application server might take many seconds or even several minutes.

So there could potentially be some kind of window in time here where you rename that column. And you are still in the process of doing a deployment of your API. In the meantime, you still have the old version of the running with some code that is still referring to the contents column. So the instant that the rename of the column is complete, the existing running API would start throwing errors every time a user tried to insert a new comment because there is no contents column anymore.

It's only after that deploy finishes with some new version of your application code that is referring to the body column correctly.
That the air would start to go away.

So again, there's a kind of a window in here during which any request where you are trying to create a comment would fail.
Now, any time that you see some kind of company ever send you an email that says, Hey, our service is going to be down from maybe 2 a.m. to 3 a.m. on Wednesday morning or something like that. Anytime you hear about some big company with some planned or scheduled downtime changes to the database structure, this is frequently what they are doing during those downtimes.

One way to address this whole situation is to just say, hey, you know what? We're going to take down our entire application. We're going to stop the running.
We're going to make some changes, planned changes to the database. And then once those changes are completed, they will deploy a new version of their application code, bring everything back up and online and tada, everything is working as expected.

However, there are many companies, many scenarios where you need to make changes to the database and you just plain cannot take the application down.

You might be working for a company that has some kind of service level agreement, or SLA is what it's referred to.
And in an SLA you might be required to keep your application online for a vast, vast, vast majority of time out of the year.
So in some scenarios, having a window like this just cannot happen. So we are going to take a look at a couple of different techniques to understand how we can minimize this scheduled downtime where this window right here and make sure that we don't have any scenario where some kind of change to the database is going to result in some kind of errors.

Okay.

So that is kind of part one of our story. Let's now go into part two. Oh, one other very quick item I want to mention here. If you are starting to work at a very large company, one other thing I want to mention here is that if you are planning on making a change to the database and a change to your API server at the same time, those might be two different teams of engineers. So there might be one team of engineers dedicated to maintaining the database and another dedicated to just handling deployments.

So if you're trying to make these two changes at the same time, that kind of assumes that you're going to have these two different teams of engineers working very closely together to kind of schedule this downtime and so on.

And that in its own right is challenging as well because you have these different teams of engineers that might not even know each other, who have to kind of do this coordination on some very important operation.

Okay.

So like I said, that is part number one. So let's now go into part number two. So part number two, let's say that you made that change to the database.
You renamed that column, you saw all those errors. And so you very, very quickly hop back onto Pgadmin and rename that body column back to contents.
So now all the errors went away, but you still need to make this change. I'm sure you can imagine that your manager might be really, really angry that you broke the application. So they might say that moving forward, in order to avoid any issues like this again in the future, you are going to be responsible for the comments table and any related changes to the API that are trying to access the database or specifically that comments table.

So in other words, you are now responsible for this entire series of actions. You have to make the change to the database and the code on the application server as well. And then to make sure that you are doing everything correctly, All the changes you make need to be reviewed by another engineer.
So to make sure that this entire new flow is working as expected, your manager tells you, okay, go ahead, try to change contents to body again, but follow these new procedures.

So you say, okay, no problem, I can do this. You go ahead and make that change on your local machine. Once again, to the comments table. You change contents over to body and you also change some server code as well. We don't really have to worry too much about the code here, but you can definitely take notice that we have references to the body column inside of here. Now, do you test out all these changes locally on your machine? You confirm that they work and you say, okay, time to get a review, time to actually deploy this stuff.

So maybe you post on GitHub or whatever version control you are using a request for a code review and you say, All right, here's the changes I made.
We've got some new version of our code where we are now referencing the body column. So on GitHub, you have created a code review request and it contains all the changed code specifically for the API. Now say for the API here, because throughout this entire course you and I haven't really focused too much on how to kind of codify changes to a database inside of any saved file. In other words, we've really been opening up Pgadmin at all times and then manually running statements to add tables, remove tables, add columns and so on.

So you can kind of imagine that if we took our same level of knowledge right now and created a code review request like the one we have right here, we might not have anything inside of this code review request that says, Hey, here's the actual SQL to be reviewed as well. So I want you to think about the impact of that. We have a code review here where we are asking someone to check these changes out, but inside the code review are only changes to the API.

So let's imagine what would happen. Okay, So we can imagine that maybe your boss decides to take a look at this first code review themselves. So at this point in time on your machine. So that's on the left hand side over here, you have the body column inside the database and you have some code that refers to that body column as well. So for you, everything is working okay. But for your boss, they check out your code to do a review on it. All of the code on the is referring to that body column. But your boss has not done anything whatsoever because there's nothing inside the code review to mention this that the body column needs to be renamed over to contents. So as soon as your boss checks out all this code and tries to test it out locally, whenever they try to insert a new comment, they would get an error that says, Hey, there is no column body because inside the database they still have the contents column.

So what would happen here? Well, chances are your boss would come back and say, Hey, I tried to test out your code but got an error of column body not found.
What is going on here? Fix this. Well, I'm sure you could figure out what was going on really quickly. So maybe you would put up a note that says, Oh, just open up pgadmin and run this statement right here that will rename the column to body and everything should work as expected. After making that change, your boss could then test everything out locally and chances are everything would work as expected. They've now got a version of the database that has a body column, and they've got a version of the API that refers to that body column as well.

So everything works as expected. Your boss would probably say, okay, looks good, go ahead and merge this stuff and deploy it to production and your code review is complete. Almost. So let's imagine that maybe you go ahead and do the deployment. Everything works as expected. But in the meantime, your boss says, I don't want to look at this version of the code anymore on my local machine. So they might go ahead and revert all the changes that you had made to the API on their machine, but they might forget to make any other changes or revert any of the changes to their copy of the database.

So they are once again in a conflicted state. They now have a version of the API on their machine that refers to the contents column, but they've got a version of the database that has the body column. So once again, they could try to create a comment, get an error of something like, Hey, column contents
does not exist and they fail to ever insert a comment. So what would happen here? Well, chances are your boss would come back and say, You just broke everything on my computer. I'm not even running your code anymore and everything is broken. I can't create any comments. And so maybe at that point you would get fired.

Who knows?

So at this point in time. Big lesson number two here. Whenever you are working with other engineers, it is extremely important that you have a very easy way to tie the structure of your database or changes to the structure of your database, to your code as well. So whenever someone checks out or kind of looks at a particular version of your code or your application server, they need to somehow make sure that they've got the correct structure of the database as well.
So at this point in time, out of this video, out of this entire story that we just walked through, we really have these two big lessons. So let's kind of take these lessons into the next video and we're going to start to take a look at schema migrations and understand how they solve both these big issues.

Lesson number one was that whenever we change the structure of our database, we needed to make sure that we changed our clients, that we're connecting to that database at the same time.

Big lesson number two was that whenever we were working with other engineers, we really need a way to tie the structure of our database to some specific version of our code. 
*/