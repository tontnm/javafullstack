
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Loan Application - Solution
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

DROP SCHEMA IF EXISTS loans_db;
CREATE SCHEMA loans_db;
USE loans_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	cust_id INT PRIMARY KEY,
	cust_name VARCHAR(35) NOT NULL,
	curr_debt DECIMAL(10,2) NOT NULL,
	credit_score INT NOT NULL
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS approved_loans_temp;
CREATE TABLE approved_loans_temp(
	cust_id INT PRIMARY KEY,
	cust_name VARCHAR(35) NOT NULL,
	curr_debt DECIMAL(10,2) NOT NULL,
	credit_score INT NOT NULL,
	log_date DATETIME NOT NULL DEFAULT NOW()
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS approved_loans;
CREATE TABLE approved_loans(
	cust_id INT PRIMARY KEY,
	cust_name VARCHAR(35) NOT NULL,
	curr_debt DECIMAL(10,2) NOT NULL,
	credit_score INT NOT NULL,
	log_date DATETIME NOT NULL DEFAULT NOW()
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS rejected_loans;
CREATE TABLE rejected_loans(
	cust_id INT PRIMARY KEY,
	cust_name VARCHAR(35) NOT NULL,
	curr_debt DECIMAL(10,2) NOT NULL,
	credit_score INT NOT NULL,
	log_date DATETIME NOT NULL DEFAULT NOW()
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO customers VALUES(1, 'Kim', 25000, 760);	 
INSERT INTO customers VALUES(2, 'Travis', 20000, 750);	 

INSERT INTO customers VALUES(3, 'Linda', 11000, 710);	 
INSERT INTO customers VALUES(4, 'Owen', 11500, 800);	 
INSERT INTO customers VALUES(5, 'Max', 5000, 700);	 
INSERT INTO customers VALUES(6, 'Leslie', 10000, 750);	 

INSERT INTO customers VALUES(7, 'Dustin', 5000, 650);	 
INSERT INTO customers VALUES(8, 'Leslie', 7000, 690);	 

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP FUNCTION IF EXISTS avg_debt;
CREATE FUNCTION avg_debt()
RETURNS DECIMAL(10,2) READS SQL DATA
RETURN (SELECT AVG(curr_debt) FROM customers);

SELECT avg_debt();

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TRIGGER IF EXISTS tr_approved_temp;
DELIMITER //
CREATE TRIGGER tr_approved_temp
BEFORE INSERT ON approved_loans_temp FOR EACH ROW
BEGIN
	IF NEW.credit_score > 699 THEN
		INSERT INTO approved_loans 
		VALUES(NEW.cust_id, NEW.cust_name, NEW.curr_debt, NEW.credit_score, NOW());
	ELSE
		INSERT INTO rejected_loans 
		VALUES(NEW.cust_id, NEW.cust_name, NEW.curr_debt, NEW.credit_score, NOW());		
  END IF;
END // 
DELIMITER ;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP PROCEDURE IF EXISTS loan_proc1;
DELIMITER //
CREATE PROCEDURE loan_proc1()
BEGIN  
	DECLARE v_cust_id INT; 
	DECLARE v_cust_name VARCHAR(60);   
	DECLARE v_curr_debt DECIMAL(10,2);   
	DECLARE v_credit_score INT;  
    
	DECLARE end_of_cursor TINYINT DEFAULT FALSE;

	DECLARE cur01 CURSOR FOR
		SELECT * FROM customers;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET end_of_cursor = TRUE;
    
	OPEN cur01;
    
	WHILE end_of_cursor=FALSE DO
		FETCH cur01 INTO v_cust_id, v_cust_name, v_curr_debt, v_credit_score;
        
		IF (end_of_cursor=FALSE) THEN
			IF v_curr_debt < avg_debt() THEN
				INSERT INTO approved_loans_temp 
				VALUES(v_cust_id, v_cust_name, v_curr_debt, v_credit_score, NOW());
			ELSE
				INSERT INTO rejected_loans 
				VALUES(v_cust_id, v_cust_name, v_curr_debt, v_credit_score, NOW());
			END IF;
		END IF;
        
	END WHILE;
    
	CLOSE cur01;
END //
DELIMITER ;

CALL loan_proc1();

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
SELECT * FROM customers;
SELECT * FROM approved_loans_temp;
SELECT * FROM approved_loans;
SELECT * FROM rejected_loans;

