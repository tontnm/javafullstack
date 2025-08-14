/*
show the most popular users - the users who were tagged the most

So two big downsides to this first solution.
- cannot copy over the IDs of all the different photo tags and caption tags to this new tags table, have duplicate IDs inside them
- other queries already written out inside of our application that made reference to specifically the photo tags or caption tags tables. because we're deleting those tables.
- rewrite possibly some big portions of our code base just to make sure that we refer to this new tags table.

When to use View?
- use View to not repeat queries a lot.
*/
SELECT username, count(*)
FROM users
JOIN (
	SELECT user_id FROM caption_tags
	UNION ALL
	SELECT user_id FROM photo_tags
) AS tags ON tags.user_id = users.id
GROUP BY username 
ORDER BY count(*) DESC;

-- solution#1
CREATE TABLE tags (
	id serial PRIMARY KEY,
	created_at timestamp WITH time ZONE DEFAULT current_timestamp,
	updated_at timestamp WITH time ZONE DEFAULT current_timestamp,
	user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	post_id integer NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
	x integer,
	y integer
);

INSERT INTO tags(created_at,updated_at,user_id,post_id,x,y)
SELECT created_at,updated_at,user_id,post_id,x,y
FROM photo_tags;

INSERT INTO tags(created_at,updated_at,user_id,post_id)
SELECT created_at,updated_at,user_id,post_id
FROM caption_tags;

--solution#2
CREATE VIEW tags AS (
	SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
	UNION ALL
	SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
);
SELECT username, count(*)
FROM users
JOIN tags ON tags.user_id = users.id
GROUP BY username 
ORDER BY count(*) DESC;

-----------------------------------
CREATE VIEW recent_posts AS (
	SELECT * FROM posts ORDER BY created_at DESC
);
------------------------------------
CREATE OR REPLACE VIEW recent_posts AS (
	SELECT * FROM posts ORDER BY created_at DESC LIMIT 15
);
DROP VIEW recent_posts;