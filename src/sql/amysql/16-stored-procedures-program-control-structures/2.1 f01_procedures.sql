
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Stored Prodecures
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#

# Example 1
#
USE online_banking_db;

DROP PROCEDURE IF EXISTS proc11;

DELIMITER //
CREATE PROCEDURE proc11()
BEGIN
	SELECT 'Hello from proc1!' AS hello;
END //
DELIMITER ;

CALL proc11();


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2

USE online_banking_db;

DROP PROCEDURE IF EXISTS proc12;

DELIMITER $$
CREATE PROCEDURE proc12()
BEGIN
	SELECT  c.cust_id, concat(c.fname, ' ', c.lname) `name`,
		c.gender, count(c.cust_id) num_of_cells
	FROM customer_contact cn JOIN customers c
	ON cn.cust_id = c.cust_id
	WHERE contact_type='Phone (Cell)'
	GROUP BY c.cust_id
	ORDER BY num_of_cells DESC;
END $$
DELIMITER ;

CALL proc12();

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3

USE online_banking_db;

DROP PROCEDURE IF EXISTS proc13;

DELIMITER $$
CREATE PROCEDURE proc13()
BEGIN
	DECLARE v_id INT;
	DECLARE v_name VARCHAR(50);
	DECLARE v_dob DATE;    

	DECLARE v_date_fmt VARCHAR(20);
	SET v_date_fmt = '%W, %M %D, %Y'; 	
    
	SELECT cust_id, concat(fname, ' ', lname) `name`, dob
	INTO v_id, v_name, v_dob
	FROM customers
	WHERE cust_id=100;
    
	SELECT v_id, v_name, v_dob, date_format(v_dob, v_date_fmt) AS v_dob2;
END $$
DELIMITER ;

CALL proc13();


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 4
USE online_banking_db;

SELECT * FROM customers;

DROP PROCEDURE IF EXISTS cust_by_fname;
DELIMITER //
CREATE PROCEDURE cust_by_fname(IN p_fname VARCHAR(35))
BEGIN
	SELECT * FROM customers
    	WHERE fname = p_fname;
END //
DELIMITER ;

CALL cust_by_fname('Cedric');
CALL cust_by_fname('Eva');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 5 / Exercise 

USE online_banking_db;
SELECT * FROM customers;

DROP PROCEDURE IF EXISTS cust_by_name;
DELIMITER //
CREATE PROCEDURE cust_by_name(IN p_fname VARCHAR(35), IN p_lname VARCHAR(35))
BEGIN
	SELECT * FROM customers
    	WHERE fname = p_fname OR lname = p_lname;
END //
DELIMITER ;

CALL cust_by_name('Cedric', 'Graham');
CALL cust_by_name('James', 'Howard');


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 6 / Exercise 
# Return the maximum account balance for anyone with 
# the first name of 'Cedric' or last name of 'Graham'.
# Also make sure to include the following 'banking_v01'
# view in your procedure.

USE online_banking_db;

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

# - - - - - - - - - - - - - - - - - - - - 
DROP PROCEDURE IF EXISTS cust_max_balance1;
DELIMITER //
CREATE PROCEDURE cust_max_balance1(IN p_fname VARCHAR(35), 
				IN p_lname VARCHAR(35))
BEGIN
    	SELECT acct_balance `max_balance` 
    	FROM banking_v01
    	WHERE fname = p_fname OR lname = p_lname
	ORDER BY acct_balance desc
	LIMIT 1; 
END //
DELIMITER ;

CALL cust_max_balance1('Cedric', 'Graham');
CALL cust_max_balance1('James', 'Howard');


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 7

USE online_banking_db;

DROP PROCEDURE IF EXISTS cust_max_balance2;
DELIMITER //
CREATE PROCEDURE cust_max_balance2(IN p_fname VARCHAR(35), 
		IN p_lname VARCHAR(35), OUT p_max_bal DECIMAL(10,2))
BEGIN
    	SELECT acct_balance `max_balance` 
    	INTO p_max_bal
    	FROM banking_v01
    	WHERE fname = p_fname OR lname = p_lname
	ORDER BY acct_balance desc
	LIMIT 1; 
END //
DELIMITER ;


SET @v_max_bal=0.0;

CALL cust_max_balance2('Cedric', 'Graham', @v_max_bal);
SELECT @v_max_bal;

CALL cust_max_balance2('James', 'Hall',@v_max_bal);
SELECT @v_max_bal;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 8 

USE online_banking_db;

DROP PROCEDURE IF EXISTS cust_max_balance3;
DELIMITER //
CREATE PROCEDURE cust_max_balance3(IN p_fname VARCHAR(35), 
		IN p_lname VARCHAR(35), INOUT p_max_bal DECIMAL(10,2))
BEGIN
	DECLARE tmp_max_bal DECIMAL(10,2);
    
	SELECT acct_balance `max_balance` 
	INTO tmp_max_bal
	FROM banking_v01
	WHERE fname = p_fname OR lname = p_lname
	ORDER BY acct_balance desc
	LIMIT 1; 
    
	SET p_max_bal = p_max_bal + tmp_max_bal;
END //
DELIMITER ;


SET @v_max_bal=100000.0;
CALL cust_max_balance3('Cedric', 'Graham', @v_max_bal);
SELECT @v_max_bal;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 9 

DROP PROCEDURE IF EXISTS basic_ops;
DELIMITER //
CREATE PROCEDURE basic_ops(
	IN    p_val1 INT, 	IN  p_val2 INT,	#receive
	OUT   p_add  INT, 	OUT p_sub  INT,	#send 
	INOUT p_mult INT)			#send/receive
BEGIN
	SET p_add  = p_val1 + p_val2; 
	SET p_sub  = p_val1 - p_val2;
	SET p_mult = p_mult * p_add;
END //
DELIMITER ;

 
SET @v_add=0;
SET @v_sub=0;
SET @v_mult=10;

CALL basic_ops(10, 8, @v_add, @v_sub, @v_mult);
SELECT @v_add, @v_sub, @v_mult;	 

