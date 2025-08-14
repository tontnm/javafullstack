/* Sub-queries
 * - It can place to 4 places: 
 * -	select(a value), - 2nd popular
 * -	from(rows,a value), 
 * -	join(rows,a value), 
 * -	where(a column, 1 or more values) - 1st popular
 * - Shape of data: 
 * -	many columns, many rows: 
 * -	-	must have alias
 * -	-	can only use returned columns name of sub-queries
 * -	1 column, many rows
 * -	1 column, 1 row 
 * -	-	optional alias
 * */
SELECT p1.name, (SELECT count(name) FROM products)
FROM (SELECT * FROM products) AS p1
JOIN (SELECT * FROM products) AS p2 ON p1.id = p2.id
WHERE p1.id IN (SELECT id FROM products);

SELECT name, price, (
	SELECT max(price) FROM products
)
FROM products
WHERE price > 867;

SELECT p.name, p.price_weight_ratio
FROM (
	SELECT name, price/weight AS price_weight_ratio FROM products
) AS p
WHERE price_weight_ratio > 5;

SELECT avg(p.order_count) FROM (
	SELECT user_id, count(*) AS order_count FROM orders GROUP BY user_id
) AS p;

/* Operator in WHERE clause will define the return values of sub queries
 * >, <, >=, <=, =, <> or != : single value
 * > ALL/SOME/ANY,< ALL/SOME/ANY,>= ALL/SOME/ANY,<= ALL/SOME/ANY, = ALL/SOME/ANY, <> ALL/SOME/ANY : single value
 * IN, NOT IN: single column
 */

/* Correlated Subqueries - nested loop */
SELECT name, department, price
FROM products AS p1
WHERE p1.price = (
	SELECT max(price) FROM products AS p2 WHERE p2.department = p1.department
);

/* Select without a From */
SELECT (
	SELECT max(price) FROM products
), (
	SELECT avg(price) FROM products
);

