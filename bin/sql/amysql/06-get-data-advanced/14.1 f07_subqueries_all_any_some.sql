
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Subqueries (2)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
#
SELECT * FROM invoices1
WHERE invoice_amount IN (
	SELECT invoice_amount FROM invoices1
	WHERE invoice_id IN (2,5)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2
#
SELECT * FROM invoices1
WHERE invoice_amount > ALL (
	SELECT invoice_amount FROM invoices1
	WHERE invoice_id IN (2,5)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3
#
SELECT * FROM invoices1
WHERE invoice_amount > ANY (
	SELECT invoice_amount FROM invoices1
	WHERE invoice_id IN (2,5)
);

