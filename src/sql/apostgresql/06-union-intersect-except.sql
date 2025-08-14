/* UNION - join results of 2 queries and remove duplicate rows
 * - same column, name, data type
 * UNION ALL - join results of 2 queries
 * */
(
	SELECT * FROM largeproducts ORDER BY price DESC LIMIT 4 -- 1,2,3
)
UNION 
(
	SELECT * FROM largeproducts ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1,2,3,4

(
	SELECT * FROM largeproducts ORDER BY price DESC LIMIT 4 -- 1,2,3
)
UNION ALL
(
	SELECT * FROM largeproducts ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1,1,2,3,4

/* INTERSECT - find rows common in the result of 2 queries, remove duplicate
 * INTERSECT ALL - find rows common in the result of 2 queries
 * */
(
	SELECT * FROM largeproducts ORDER BY price DESC LIMIT 4 -- 1,1,2,3
)
INTERSECT  
(
	SELECT * FROM largeproducts ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1

(
	SELECT * FROM largeproducts ORDER BY price DESC LIMIT 4 -- 1,1,2,3
)
INTERSECT ALL
(
	SELECT * FROM largeproducts ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1,1

/* EXCEPT - find rows belong to first query, not second, remove duplicate
 * EXCEPT ALL - find rows belong to first query, not second, duplicate
 * */
(
	SELECT * FROM largeproducts ORDER BY price DESC LIMIT 4 -- 1,2,3,4
)
EXCEPT  
(
	SELECT * FROM largeproducts ORDER BY price / weight DESC LIMIT 4 -- 2,4,5,6
); -- 1,3

(
	SELECT * FROM largeproducts ORDER BY price DESC LIMIT 4
)
EXCEPT ALL
(
	SELECT * FROM largeproducts ORDER BY price / weight DESC LIMIT 4
);