/* Bad way
* Increase 'likes' column everytime a user click like button
* like once? who unlike? who like this post? user deleted how remove like?
*/

/*
users           likes								posts
id | name       id | user_id | post_id	| type 		id | url
1    A          1    2         1          sad  		1    abc.jpg
2    B          2    3         2          happy		2    def.jpg
3    C          3    2         1 (error)  love 		3    fff.jpg

1. # of likes on post 2
2. name of people who like post 2
3. top 5 most like posts
4. post url that user 3 like
*/
SELECT post_id, count(*)
FROM likes
WHERE post_id = 2;

SELECT name
FROM likes l
JOIN users u ON l.user_id = u.id
WHERE post_id = 2;

SELECT p.id FROM posts p
JOIN likes l ON p.id = l.post_id
GROUP BY user_id
ORDER BY count(*) DESC
LIMIT 5;

SELECT p.url 
FROM posts p
JOIN likes l ON p.id = l.post_id
WHERE l.user_id = 3;

/*
 * 3 ways
 * 1. multiple tables - like_post, like_comment tables
 * 2. one table with many different columns - post_id, comment_id columns
 * 3. polymorphic associations - like_id(plain int), like_type(post,comment)
 * 
 * Which one?
 * 2. post_id, comment__id, at least one of them actually has to be defined
 * 
 * Explain:
 * - just like, no other information associated with a like, no reaction type.
*/
-- track value FROM LEFT TO RIGHT IF NULL THEN ignore, GET NEXT value
SELECT COALESCE(NULL,20,30); -- 20
SELECT COALESCE(NULL,NULL,30); -- 30

ADD CHECK OF 
(
	COALESCE((post_id)::BOOLEAN:INTEGER,0)
	+
	COALESCE((post_id)::BOOLEAN:INTEGER,0)
) = 1

SELECT COALESCE((NULL)::BOOLEAN::INTEGER,0); --0
SELECT NULL::BOOLEAN; --NULL
SELECT NULL::BOOLEAN::INTEGER; --NULL
SELECT 1::BOOLEAN; --true
SELECT 1::BOOLEAN::INTEGER; --1
SELECT COALESCE(1,0); --1
SELECT COALESCE((1)::BOOLEAN::INTEGER,0); --1