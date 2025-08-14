/* DISTINCT
 * - use only with SELECT
 * - use with count()
 * - semilar to group by (group by is better, it allow use many aggregate function)
 */
SELECT count(DISTINCT department) FROM products;

-- department + name combined is always unique
SELECT DISTINCT department, name FROM products;

-- GREATEST - return the largest value
SELECT name, weight, GREATEST(30, 2 * weight) FROM products;

-- LEAST - return the smallest value
SELECT LEAST(30, 20);

-- CASE
SELECT 
	name, price,
	CASE 
		WHEN price > 600 THEN 'high'
		WHEN price > 300 THEN 'medium'
		ELSE 'cheap'
	END
FROM products;
	