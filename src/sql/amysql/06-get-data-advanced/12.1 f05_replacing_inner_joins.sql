
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = More Queries – Replacing Inner Joins
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Rewrite the following query without JOINs.

# Join
SELECT * 
FROM animal1 a1 JOIN animal2 a2
ON a1.name = a2.name;

# Solution
SELECT * FROM animal1 a1, animal2 a2
WHERE a1.name = a2.name;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: Rewrite the following query without JOINs.

# Join
SELECT b.book_name, b.category_id, category_name 
FROM book b JOIN category c
ON b.category_id = c.category_id
ORDER BY b.book_name;

# Solution
SELECT b.book_name, b.category_id, category_name 
FROM book b, category c
WHERE b.category_id = c.category_id
ORDER BY b.book_name;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 3: Rewrite the following query without JOINs.

# Join
SELECT book_name, b.category_id, category_name 
FROM book b JOIN category c 
ON b.category_id = c.category_id
WHERE b.category_id > 2 
ORDER BY b.book_name;


# Solution
SELECT book_name, b.category_id, category_name 
FROM book b, category c 
WHERE (b.category_id = c.category_id) AND (b.category_id > 2)
ORDER BY b.book_name;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 4: Rewrite the following query without JOINs.

# Join
SELECT i1.invoice_no, COUNT(i1.vendor_id) num_of_ven 
FROM invoices1 i1 JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
ORDER BY i1.vendor_id;


# Solution
SELECT i1.invoice_no, COUNT(i1.vendor_id) num_of_ven 
FROM invoices1 i1, invoices2 i2
WHERE  i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
ORDER BY i1.vendor_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 5: Rewrite the following query without JOINs.

# Join
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_ven,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1 JOIN invoices2 i2
ON i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
HAVING COUNT(num_of_ven) > 1
ORDER BY i1.vendor_id;


# Solution
SELECT i1.invoice_no, 
	COUNT(i1.vendor_id) num_of_ven,
	ROUND(AVG(i1.invoice_amount),2) inv_amt,
	ROUND(AVG(i1.payment_amount),2) pay_amt
FROM invoices1 i1, invoices2 i2
WHERE i1.invoice_no = i2.invoice_no
GROUP BY i1.vendor_id
HAVING COUNT(num_of_ven) > 1
ORDER BY i1.vendor_id;

