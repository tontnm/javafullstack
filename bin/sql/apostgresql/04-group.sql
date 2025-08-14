/*
 * Grouping - GROUP BY
 * Aggregates - COUNT(), SUM(), AVG(), MIN(), MAX()
 * */
SELECT photo_id, count(*) FROM "comments" GROUP BY photo_id;

/*
 * FROM -> JOIN -> WHERE -> GROUP BY -> HAVING
 * */
SELECT photo_id , count(*) 
FROM comments 
WHERE photo_id < 3 
GROUP BY photo_id 
HAVING count(*) > 1;

SELECT user_id, count(*)
FROM "comments" 
WHERE photo_id < 3 
GROUP BY user_id 
HAVING count(*) > 2; 