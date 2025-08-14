/*
can only follow another user one time.
cannot follow ourselves.

followers
id leader_id follower_id (check leader_id <> follower_id) (unique(leader_id, follower_id))

User ID would be the user who is being followed.
Following ID of the person who is doing the following.

one user can only follow another user exactly one time
can never have any row or any two rows with an identical leader and follower ID

who has the most followers?
who has the least the usernames of people?
who are following a particular user?

created_at: for figuring out how long someone has been following another person. 
*/