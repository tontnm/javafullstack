
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = JDBC & Stored Prodecures
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

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2

SELECT * FROM banking_v01
WHERE fname='cedric' AND lname='Yates';

DROP PROCEDURE IF EXISTS cust_by_name;
DELIMITER $$
CREATE PROCEDURE cust_by_name(
	IN p_fname VARCHAR(35), 
	IN p_lname VARCHAR(35))
BEGIN
	SELECT * FROM banking_v01
	WHERE fname = p_fname AND lname = p_lname;
END $$
DELIMITER ;

CALL cust_by_name('cedric', 'Yates');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3

SELECT *
FROM banking_v01
WHERE fname='cedric'
ORDER BY acct_balance desc
LIMIT 1;

SELECT concat(fname, ' ', lname, ' ',
	acct_id, ' ', acct_type, ' ', acct_balance)  as `info`
FROM banking_v01
WHERE fname='cedric'
ORDER BY acct_balance desc
LIMIT 1;

DESC banking_v01;

DROP PROCEDURE IF EXISTS cust_max_balance1;
DELIMITER $$
CREATE PROCEDURE cust_max_balance1(INOUT p_fname VARCHAR(150))
BEGIN
	SELECT concat(fname, ' ', lname, ' ',
		acct_id, ' ', acct_type, ' ', acct_balance)
	INTO p_fname
	FROM banking_v01
	WHERE fname=p_fname
	ORDER BY acct_balance desc
	LIMIT 1;
END $$
DELIMITER ;

SET @v_cust_name='Cedric';
CALL cust_max_balance1(@v_cust_name);
SELECT @v_cust_name;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 4

USE online_banking_db;

SELECT concat(fname, ' ', lname, ' ',
	acct_id, ' ', acct_type, ' ', acct_balance)  as `info`
FROM banking_v01
WHERE fname='cedric' AND lname='Yates'
ORDER BY acct_balance desc
LIMIT 1;

DROP PROCEDURE IF EXISTS cust_max_balance2;
DELIMITER $$
CREATE PROCEDURE cust_max_balance2(
	IN p_fname VARCHAR(35),
	INOUT p_lname VARCHAR(150),
	OUT p_cust_info VARCHAR(150))
BEGIN
	SELECT concat(fname, ' ', lname, ' ',
		acct_id, ' ', acct_type, ' ', acct_balance)
	INTO p_cust_info
	FROM banking_v01
	WHERE fname=p_fname AND lname=p_lname
	ORDER BY acct_balance desc
	LIMIT 1;

	SET p_lname = p_cust_info;
END $$
DELIMITER ;

SET @v_cust_lname='Yates';
SET @v_cust_info='';
CALL cust_max_balance2('Cedric', @v_cust_lname, @v_cust_info);
SELECT @v_cust_lname, @v_cust_info;

