/*
Views:
- query that get executed everytime you refer to it

Materilized Views:
- query that gets executed only at very specific times, but the results are saved and can be referenced without rerunning the query
*/

SELECT 
	date_trunc('week',COALESCE(posts.created_at,COMMENTS.created_at)) AS week, 
	count(posts.id) AS num_likes_for_posts,
	count(COMMENTS.id) AS num_likes_for_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week;

EXPLAIN ANALYZE SELECT 
	date_trunc('week',COALESCE(posts.created_at,COMMENTS.created_at)) AS week, 
	count(posts.id) AS num_posts,
	count(COMMENTS.id) AS num_comments
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week
ORDER BY week; --Execution Time: 887.851 ms

CREATE MATERIALIZED VIEW weekly_likes AS (
	SELECT 
		date_trunc('week',COALESCE(posts.created_at,COMMENTS.created_at)) AS week, 
		count(posts.id) AS num_likes_for_posts,
		count(COMMENTS.id) AS num_likes_for_comments
	FROM likes
	LEFT JOIN posts ON posts.id = likes.post_id
	LEFT JOIN comments ON comments.id = likes.comment_id
	GROUP BY week
	ORDER BY week
) WITH DATA; 

EXPLAIN ANALYZE SELECT * FROM weekly_likes; --Execution Time: 0.058 ms

REFRESH MATERIALIZED VIEW weekly_likes;