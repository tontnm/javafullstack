
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Subqueries (1)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: In the following query, replace 'X' with
# a subquery that returns the average of invoice_amount.
#
SELECT invoice_id, invoice_amount, invoice_amount-X
FROM   invoices1;

# Solution:   
SELECT invoice_id, invoice_amount,
	invoice_amount-(SELECT AVG(invoice_amount)
			FROM invoices1) AS InvMinusAvg
FROM   invoices1;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# Exercise 2: Display those rows with invoice_amount   
# greater than the average of all invoice_amounts.
# Make sure to use a subquery as part of the WHERE caluse.

SELECT invoice_id, vendor_id, invoice_amount 
FROM invoices1
WHERE invoice_amount >
	(SELECT AVG(invoice_amount)
	FROM invoices1);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# Exercise 3: In the following query, replace '3' with 
# a sub-query. 

USE world_1;

SELECT c.continent,
	COUNT(c.continent) AS num_of_countries
FROM country c
GROUP BY c.continent
HAVING COUNT(c.continent) > 3
ORDER BY num_of_countries DESC;


# Solution: 
SELECT c.continent,
	COUNT(c.continent) AS num_of_countries
FROM country c
GROUP BY c.continent
HAVING COUNT(c.continent) > 
	(SELECT COUNT(continent) FROM country
	WHERE continent="Africa")
ORDER BY num_of_countries DESC;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# Exercise 4: Using a a sub-query in the FROM clause, write
# a query to create the same result-set of the following query.


USE world_1;
SELECT * FROM country;

SELECT country_name, continent
FROM country
WHERE country_name LIKE '%a';

# Solution
SELECT s.* 
FROM (
	SELECT country_name, continent
	FROM country
	WHERE country_name LIKE '%a') s;

