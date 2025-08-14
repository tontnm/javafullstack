/*
 * JOIN
 * - inner join - combine 2 tables with mutual id, left out record with no mutual id
 * - left join
 * - right join
 * - full join
 * */
SELECT contents, username
FROM comments 
JOIN users ON users.id = comments.user_id;