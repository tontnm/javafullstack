
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = JDBC & Views
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#

USE online_banking_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1

CREATE OR REPLACE VIEW banking_v01 AS 
SELECT c.fname, c.lname, a.acct_id,
	ty.acct_type, a.acct_balance
FROM customers c 
	JOIN accounts_customers ac
	JOIN accounts a 
	JOIN account_types ty
ON c.cust_id = ac.cust_id AND 
	a.acct_id=ac.acct_id AND
	a.acct_type_id = ty.acct_type_id;

SELECT * FROM banking_v01;	

