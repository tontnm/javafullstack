
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = s15_f04_online_banking_db_queries.txt
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE online_banking_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Display customers and their cell phones.

SELECT  c.cust_id, concat(c.fname, ' ', c.lname) `name`, 
	cn.contact_desc `contact`, c.gender
FROM customer_contact cn JOIN customers c
ON cn.cust_id = c.cust_id
WHERE contact_type='Phone (Cell)';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: Leveraging on the previous exercise, display
# customers and number of cell phones (sorted descending). 

SELECT  c.cust_id, concat(c.fname, ' ', c.lname) `name`,
	c.gender, count(c.cust_id) num_of_cells
FROM customer_contact cn JOIN customers c
ON cn.cust_id = c.cust_id
WHERE contact_type='Phone (Cell)'
GROUP BY c.cust_id
ORDER BY num_of_cells DESC;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 3: Display all customers, their account ids, 
# account types, and account balances. 


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

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 4: Modify the previous exercise to show 
# the same dataset only for 'Cedric Yates' 

SELECT * FROM banking_v01
WHERE fname='Cedric' AND lname='Yates';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 5: Display all customers and their number of 
# accounts. If a customer has no account, print zero besides
# his/her name.

# List of all customers
CREATE OR REPLACE VIEW banking_v02 AS 
SELECT CONCAT(fname, ' ' ,lname) full_name
FROM customers;

SELECT * FROM banking_v02;

# - - - - - - - - - - - - - - - - - - - - 
# List of those customers that have accounts
CREATE OR REPLACE VIEW banking_v03 AS 
SELECT CONCAT(c.fname, ' ' ,c.lname) full_name, 
	COUNT(CONCAT(c.fname, ' ' ,c.lname)) num_of_accts
FROM customers c 
	JOIN accounts a 
	JOIN accounts_customers ac
ON c.cust_id = ac.cust_id AND 
   a.acct_id=ac.acct_id
GROUP BY full_name;

SELECT * FROM banking_v03;


# - - - - - - - - - - - - - - - - - - - - 
SELECT v2.full_name, IFNULL(v3.num_of_accts, 0)  num_of_accts
FROM banking_v02 v2 LEFT JOIN banking_v03 v3
ON v2.full_name = v3.full_name;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 6: Display the following customer information:
# cust_id, customer name, transaction_amount, transaction_desc,
# account_id, account_balance, account_type_id, account_type.


SELECT c.cust_id, CONCAT(c.fname, ' ', c.lname) full_name,
	t.tran_amt, t.tran_date, t.tran_desc, t.acct_id, 
	a.acct_balance, a.acct_type_id, act.acct_type
FROM customers c 
	JOIN transactions t
	JOIN accounts a
	JOIN account_types act
ON c.cust_id = t.cust_id AND
	a.acct_id = t.acct_id AND
	act.acct_type_id = a.acct_type_id
ORDER BY full_name, acct_id, tran_date;

