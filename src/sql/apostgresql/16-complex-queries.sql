SELECT * FROM users ORDER BY id DESC LIMIT 3;

SELECT u.username,p.caption FROM users u 
JOIN posts p ON p.user_id = u.id
WHERE u.id = 200;

SELECT u.username, count(l.user_id) FROM likes l 
JOIN users u ON u.id = l.user_id
GROUP BY u.username;