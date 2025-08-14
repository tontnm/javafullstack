/*
hashtags in 
	caption of a post
	a comment
	a user biography

Option 1 
hashtags_posts			posts
id title post_id		id caption user_id

hashtags_comments		posts
id title comment_id		id caption user_id

hashtags_users			posts
id title user_id		id caption user_id

if create posts_hashtags, comments_hashtags and users_hashtags
- figure out which hashtags in comments.
- hashtag is really popular inside of user biographies
- hashtag popular inside of comments or inside of posts.

Option 2
one table with post ID, comment ID and user ID 

We only have to model things that we eventually expect to query.

tags inside of a caption, we want to run a query to figure out who the most popular users are.
user should get some kind of notification.

So before we start to go to down down this path of creating these three separate tables to model the relationship between a hashtag and a post, a comment or a user, we kind of have to ask ourselves the exact same question.

Do we actually expect.

run query with hashtags in comments?
which hashtags by which users in their biography?
use these tables?

search for posts that contain a hash tag
hash tags used inside of a post caption are somehow modeled inside the database.

find the total uses of a hashtag across the entire platform: posts, comments, user bio. Choose option 2

"title" would be the actual hashtag that is being used.
"post_id" would be the post that is making use of that hashtag.

option 1 (performance issues: duplicate title -> storage db issues)
hashtags			posts
id title post_id	id url user_id


option 2 (list out string 1 time, store simple integer then point back to appropriate string, int is more space effective than string)
hashtags	hashtags_posts			posts
id title	id hashtag_id post_id	id url user_id

why we are not storing the number of posts, followers and following on the user's table as separate columns.
Posts, followers and following are all tied to one specific user.


A post is going to have a user ID as well that points at the user who created it, 
and followers is also going to have probably some kind of user ID column that points at the user ID who is being followed.

user's		posts				followers
id serial	user_id integer		user_id integer

--posts
select count(*) from posts where user_id = 123;

--followers
select count(*) from followers where user_id = 123;

# post and # followers are "derived data"
*/