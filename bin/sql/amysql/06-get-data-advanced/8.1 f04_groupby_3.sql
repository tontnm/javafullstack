
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = GROUP BY (3)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE invoices1 (
	invoice_id INT(5),	
	vendor_id INT(5),
	invoice_no VARCHAR (10),
	invoice_amount DECIMAL(10,2),
	payment_amount DECIMAL(10,2)
);

# - - - - - - - - - - - - - - - - - - - - 
INSERT INTO invoices1  VALUES
	(1, 10, 'v10_1', 1500.12, 1500.12),
	(2, 10, 'v10_2', 1300.12, 1100.12),
	(3, 10, 'v10_3', 300.30, 300.30),
	(4, 10, 'v10_4', 10.00, 10.00),
	(5, 20, 'v20_1', 500.22, 500.22),
	(6, 20, 'v20_2', 3000.00, 3000.00),
	(7, 30, 'v30_1', 100.30, 100.30),
	(8, 30, 'v30_2', 205.00, 205.00),
	(8, 30, 'v30_3', 10.00, 5.00);

SELECT * FROM invoices1;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE invoices2 (
	invoice_id INT(5),	
	vendor_id INT(5),
	invoice_no VARCHAR (10),
	invoice_amount DECIMAL(10,2),
	payment_amount DECIMAL(10,2)
);

# - - - - - - - - - - - - - - - - - - - - 
INSERT INTO invoices2  VALUES
	(21, 10, 'v10_1', 1500.12, 1500.12),
	(22, 10, 'v10_2', 1300.12, 1100.12),
	(23, 20, 'v20_1', 500.22, 500.22),
	(24, 30, 'v30_1', 100.30, 100.30),
	(25, 30, 'v30_2', 205.00, 205.00),
	(26, 30, 'v30_3', 10.00, 5.00);

SELECT * FROM invoices2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Using the 'invoices1' table, 
# find the number of invoices for each vendor.

SELECT vendor_id, COUNT(*) AS num_of_invoices
FROM invoices1
GROUP BY vendor_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: Find those invoice numbers that exist in 
# both 'invoices1' and 'invoices2' tables.
#
SELECT i1.invoice_id, i1.vendor_id, i1.invoice_no 
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
ORDER BY i1.vendor_id;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 3: Modify the previous query, group vendor_ids
# and display total number of each group.
#
SELECT i1.invoice_no, COUNT(i1.vendor_id) num_of_vend 
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
ORDER BY i1.vendor_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 4: Improve the previous query by adding the  
# average of invoice_amount and payment_amount.
# to each group.
#
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_vend,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
ORDER BY i1.vendor_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 5: Modify the previous query by displaying only 
# those groups with more than 1 vendor.
#
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_vend,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
HAVING COUNT(num_of_vend) > 1
ORDER BY i1.vendor_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 6: To understand the difference between HAVING   
# clause and WHERE clause - read the following two queries 
# and predict the outcome.
#

# Query #1
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_vend,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
HAVING AVG(i1.invoice_amount) > 100
ORDER BY i1.vendor_id;

# Query #2
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_vend,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
WHERE i1.invoice_amount > 100
GROUP BY i1.vendor_id
ORDER BY i1.vendor_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 7: Improve the previous exercise to use  
# both HAVING and WHERE clauses in the same query.
#
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_vend,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
WHERE i1.invoice_amount > 100
GROUP BY i1.vendor_id
HAVING AVG(i1.invoice_amount) > 300
ORDER BY i1.vendor_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 8: Modify your query to show only those groups  
# that their number of vendors is greater than 1 and  
# their average invoice amount is greater than 110.
#
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_vend,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1
	INNER JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
HAVING COUNT(num_of_vend) > 1
	    AND AVG(i1.invoice_amount) > 110
ORDER BY i1.vendor_id;

