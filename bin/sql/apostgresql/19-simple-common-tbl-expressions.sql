SELECT u.username, tags.created_at
FROM users u
JOIN (
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
) AS tags ON u.id = tags.user_id
WHERE tags.created_at < '2010-01-07';

/*
 Common Table Expression (CTE)
 	2 forms: simple, recursive
*/ 
WITH tags AS (
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
)
SELECT u.username, tags.created_at
FROM users u
JOIN tags ON u.id = tags.user_id
WHERE tags.created_at < '2010-01-07';

SELECT u.username, ct.created_at caption_date
FROM users u
JOIN caption_tags ct ON ct.user_id = u.id 
WHERE ct.created_at < '2010-01-07'
UNION 
SELECT u.username, pt.created_at photo_date 
FROM users u
JOIN photo_tags pt ON pt.user_id = u.id
WHERE pt.created_at < '2010-01-07';
;

SELECT u.username, pt.created_at photo_date 
FROM users u
JOIN photo_tags pt ON pt.user_id = u.id
WHERE pt.created_at < '2010-01-07';