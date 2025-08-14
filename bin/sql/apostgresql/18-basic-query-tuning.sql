/*
SELECT * FROM users WHERE username = 'Alyson14';
Parser -> Rewrite -> Planner -> Execute

Planner:
The goal of the planner is to take a look at the query tree, figure out what information you are trying to fetch, and then come up with a series of different plans or strategies that could be used to actually get that information.

So in our case, the planner might realize that you're trying to get some information out of the users table based upon a user name.

So it might say, you know what, we could probably get that information very efficiently by using the user's username index and then use the references or pointers inside there to go and fetch some appropriate users from the user heat file.

The planner might also come up with a plan where it says you know it rather than using the index. We could just go into the user table directly, fetch all the different users and do a one by one search through them.

After coming up with all these different plans, the planner is going to evaluate which one it thinks is going to actually execute the fastest and then choose that plan to actually run.

understanding how a query is actually being executed and figuring out how to improve the performance of that query as well: EXPLAIN , EXPLAIN ANALYZE

cost: amount of time (seconds? milliseconds?) to execute some part of our query plan
*/

EXPLAIN ANALYZE SELECT username, contents
FROM users
JOIN COMMENTS ON COMMENTS.user_id = users.id 
WHERE username = 'Alyson14';

SELECT * FROM pg_stats WHERE tablename = 'users';

CREATE INDEX likes_created_at_idx ON likes (created_at);

SELECT count(*) FROM likes WHERE created_at < '2013-01-01'; --63013
/*
Bitmap Heap Scan on likes  (cost=1207.38..6860.14 rows=64381 width=24)
   ->  Bitmap Index Scan on likes_created_at_idx  (cost=0.00..1191.28 rows=64381 width=0)
*/
EXPLAIN SELECT * FROM likes WHERE created_at < '2013-01-01';

SELECT count(*) FROM likes WHERE created_at > '2013-01-01'; --688996
/*
Seq Scan on likes  (cost=0.00..14248.11 rows=687627 width=24)
*/
EXPLAIN SELECT * FROM likes WHERE created_at > '2013-01-01';

--Remove Index for this query
