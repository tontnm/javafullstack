/*
store the caption of a post.

Tag people and add location.

Add location.

create Latitude and Longitude tied to the post

Tagging people.

So when we tag a person, that means that we are going to physically tap somewhere on this phone or on this screen or on the photo itself right here then mention or tag some other Instagram user to a specific location inside the photo.

tags in a caption 
tags in a photo.

tag in caption affect any other part of our app?

Let me give you some examples of that.

show a list of posts where a particular user was mentioned?
find every post where Dwayne Johnson was mentioned.
show a list of the most often mentioned users?

notify a user that they have been mentioned?

So again, just because some text is highlighted doesn't mean that we have to store something inside the database.

whether or not that mention needs to trigger some other kind of behavior or 
if we want to somehow produce some metrics or somehow link to back to this thing.

That is when we need to start to think about storing this mention as some record inside of our database.

If you get mentioned, we want to somehow notify you.

So I think that these are all features that we'd probably want to have, which implies that we need to somehow store a list of people who get mentioned inside of a particular post.

one post can mention many different users.

a tag is added to a very specific spot in a photo, center, right, top
So it has to be inside the database: x coordinate, y coordinate

tag in caption
tag in photo

Solution #1
one single table of tags to model a mention inside of a caption and mentions on a photo
x, y = null is a tag in a caption
user_id is who was mentioned
post_id that mention was added to
question: how often some given user is being mentioned inside of any number of posts

Solution #2
2 tables: photo_tags(user_id,post_id,x,y), caption_tags(user_id,post_id)
question: 
- expect to query for caption tags?
- expect to have to run queries against caption tags like ten times more frequently than for photo tags? sol2
- do we ever want to add in more functionality to a photo tag? sol2
- do we want to add in the ability to add a comment to a photo tag or add a like to a photo tag? sol2
- not worry about the impact on caption_tag

*/