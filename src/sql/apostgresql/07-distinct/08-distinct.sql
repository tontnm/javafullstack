/* DISTINCT
 * - use only with SELECT
 * - use with count()
 * - similar to group by (group by is better, it allow use many aggregate function)
 */
 SELECT DISTINCT department FROM products; -- remove hết duplicate, lấy cái unique
SELECT count(DISTINCT department) FROM products; -- đếm số lượng department unique

-- department + name combined is always unique
SELECT DISTINCT department, name FROM products;

SELECT COUNT(DISTINCT department, name) FROM products; --!ERROR, vì có 2 column

SELECT COUNT(DISTINCT manufacturer)
FROM phones;

-- GREATEST - return the largest value
SELECT GREATEST(20, 10, 30); --30
SELECT name, weight, GREATEST(30, 2 * weight) AS cost_to_ship FROM products;
/*
Cách chạy của câu trên như sau:
1. lấy hết row của products
2. lấy từng row ra, lấy name, weight, giá trị lớn nhất, cho từng row
*/

-- LEAST - return the smallest value
SELECT LEAST(30, 20);
SELECT name, price, LEAST(price * 0.5, 400) FROM products;

-- CASE
SELECT 
	name, price,
	CASE 
		WHEN price > 600 THEN 'high'
		WHEN price > 300 THEN 'medium'
		ELSE 'cheap'
	END
FROM products;
	