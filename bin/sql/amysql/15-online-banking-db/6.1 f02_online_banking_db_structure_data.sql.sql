
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = f02_online_banking_db_structure_data.sql
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# To run the script:
# $ mysql -u root -p < f02_online_banking_db_structure_data.sql

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP SCHEMA IF EXISTS online_banking_db;
CREATE SCHEMA online_banking_db;
USE online_banking_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'branches' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS branches;
CREATE TABLE branches (
	branch_id INT UNSIGNED PRIMARY KEY,
	branch_name VARCHAR(45) NOT NULL
	# add other fields ...
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'branches' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO branches VALUES(210, 'Trinity');
INSERT INTO branches VALUES(215, 'North Strand');
INSERT INTO branches VALUES(220, 'Slope Lookout');
INSERT INTO branches VALUES(225, 'Vile Ridge');
INSERT INTO branches VALUES(230, 'Ember Mire');
INSERT INTO branches VALUES(235, 'White Mountain');
INSERT INTO branches VALUES(240, 'Wildlife Pillar');
INSERT INTO branches VALUES(245, 'Rainbow Pillar');
INSERT INTO branches VALUES(250, 'Wisdom Glade');
INSERT INTO branches VALUES(255, 'Liberty Loch');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'account_types' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS account_types;
CREATE TABLE account_types (
	acct_type_id INT UNSIGNED PRIMARY KEY,	#account_type_id
	acct_type enum('Checking','Saving', 'Business') NOT NULL,
	min_req_balance DECIMAL(10,2) NOT NULL	
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'account_types' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO account_types VALUES (10, 'Checking', 2000);
INSERT INTO account_types VALUES (11, 'Saving', 1500);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'customers' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	cust_id INT UNSIGNED PRIMARY KEY,	 
	fname VARCHAR(35) NOT NULL, 		#first_name
	lname VARCHAR(50) NOT NULL,		#last_name
	dob DATE NOT NULL,			#date_of_birth
	gender enum('M','F') NOT NULL 
	# add other fields ...
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'customers' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO customers VALUES (100, 'Cedric', 'Yates', '2000-01-01', 'M');
INSERT INTO customers VALUES (101, 'Eva', 'Howard', '1998-05-03', 'F');
INSERT INTO customers VALUES (102, 'Joshua', 'Graham', '1998-02-20', 'M');
INSERT INTO customers VALUES (103, 'Yasmin', 'Hall', '1996-04-11', 'F');
INSERT INTO customers VALUES (104, 'James', 'Newman', '1997-12-18', 'M');
INSERT INTO customers VALUES (105, 'Daisy', 'Hayes', '1998-07-01', 'F');
INSERT INTO customers VALUES (106, 'Dominick', 'Wright', '1987-03-21', 'M');
INSERT INTO customers VALUES (107, 'Kathryn', 'Golden', '1990-09-12', 'F');
INSERT INTO customers VALUES (108, 'Harper', 'Ellis', '1980-11-17', 'M');
INSERT INTO customers VALUES (109, 'Lilliana', 'Cooke', '1975-05-01', 'F');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'customer_info' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS customer_info;
CREATE TABLE customer_info(
	cust_credit_score INT NOT NULL,
	cust_yearly_salary DECIMAL(10,2) NOT NULL,
	cust_id INT UNSIGNED NOT NULL UNIQUE, 

	CONSTRAINT customer_info_fk1_cust_id 
	FOREIGN KEY (cust_id) REFERENCES customers (cust_id) 
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'customer_info' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO customer_info VALUES(790, 85000.00, 100); 
INSERT INTO customer_info VALUES(750, 70000.00, 101); 
INSERT INTO customer_info VALUES(800, 85000.00, 102); 
INSERT INTO customer_info VALUES(790, 80000.00, 103); 
INSERT INTO customer_info VALUES(780, 45000.00, 104); 
INSERT INTO customer_info VALUES(500, 45000.00, 105); 
INSERT INTO customer_info VALUES(690, 85000.00, 106); 
INSERT INTO customer_info VALUES(800, 82000.00, 107); 
INSERT INTO customer_info VALUES(710, 72000.00, 108); 
INSERT INTO customer_info VALUES(780, 91000.00, 109); 

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'customer_contact' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS customer_contact;
CREATE TABLE customer_contact(
	contact_type enum('Phone (home)','Phone (Cell)', 'Phone (Bus)', 'Email', 'Website') 	NOT NULL,
	contact_desc VARCHAR(30) NOT NULL,
	cust_id INT UNSIGNED NOT NULL,

	PRIMARY KEY (contact_type, contact_desc, cust_id),

	CONSTRAINT customer_contact_fk1_cust_id 
	FOREIGN KEY (cust_id) REFERENCES customers (cust_id) 
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'customer_contact' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO customer_contact VALUES('Phone (home)', '1-300-100-2000'       , 100);  
INSERT INTO customer_contact VALUES('Phone (Cell)', '1-400-100-2001'       , 100);  
INSERT INTO customer_contact VALUES('Phone (Cell)', '1-400-100-2002'       , 100);  
INSERT INTO customer_contact VALUES('Phone (Bus)' , '1-500-100-2000'       , 100); 
INSERT INTO customer_contact VALUES('Email'       , 'cedric_yates@eml1.com', 100);  
INSERT INTO customer_contact VALUES('Email'       , 'cedric_yates@eml2.com', 100); 
INSERT INTO customer_contact VALUES('Website'     , 'www.cy.com'           , 100);  

INSERT INTO customer_contact VALUES('Phone (home)', '1-300-101-2000'       , 101);  
INSERT INTO customer_contact VALUES('Phone (Cell)', '1-400-101-2001'       , 101);  
INSERT INTO customer_contact VALUES('Phone (Cell)', '1-400-101-2002'       , 101);  
INSERT INTO customer_contact VALUES('Phone (Bus)' , '1-500-101-2000'       , 101);  
INSERT INTO customer_contact VALUES('Email'       , 'eva_howard@eml1.com'  , 101);  
INSERT INTO customer_contact VALUES('Email'       , 'eva_howard@eml2.com'  , 101);  
INSERT INTO customer_contact VALUES('Email'       , 'eva_howard@eml3.com'  , 101);  

INSERT INTO customer_contact VALUES('Phone (home)', '1-300-102-2000'        , 102);  
INSERT INTO customer_contact VALUES('Phone (Cell)', '1-400-102-2001'        , 102);  
INSERT INTO customer_contact VALUES('Email'       , 'joshua_graham@eml1.com', 102);  


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'credit_cards' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS credit_cards;
CREATE TABLE credit_cards(
	card_no VARCHAR(17) PRIMARY KEY,	#credit_card_number
	cvv VARCHAR(4) NOT NULL,
	card_type enum('Visa', 'MasterCard', 'American Express') NOT NULL,
	card_expiry_date DATE NOT NULL,
	card_max_limit DECIMAL(10,2) NOT NULL,
	cust_id INT UNSIGNED NOT NULL, 

	CONSTRAINT credit_cards_fk1_cust_id 
	FOREIGN KEY (cust_id) REFERENCES customers (cust_id) 
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'credit_cards' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO credit_cards VALUES('4711007834878100', '290', 'Visa',             '2023-05-30', 30000, 100); 
INSERT INTO credit_cards VALUES('379101876010101' , '208', 'American Express', '2021-11-30', 15000, 100); 
INSERT INTO credit_cards VALUES('5131020604707102', '301', 'MasterCard',       '2021-06-30', 20000, 100); 
INSERT INTO credit_cards VALUES('5131030604707103', '302', 'MasterCard',       '2021-04-30', 22000, 101); 
INSERT INTO credit_cards VALUES('379104876010104' , '109', 'American Express', '2021-05-30', 10000, 101); 
INSERT INTO credit_cards VALUES('379105276017105' , '204', 'American Express', '2021-11-30', 40000, 102); 
INSERT INTO credit_cards VALUES('4711067833871106', '203', 'Visa',             '2023-05-30', 41000, 102); 
INSERT INTO credit_cards VALUES('5131070614207107', '105', 'MasterCard',       '2022-11-30', 30000, 109); 
INSERT INTO credit_cards VALUES('379108676017108' , '128', 'American Express', '2021-11-30', 20000, 104); 
INSERT INTO credit_cards VALUES('4711097834878109', '101', 'Visa',             '2023-05-30', 15000, 105); 
INSERT INTO credit_cards VALUES('5131103104867110', '178', 'MasterCard',       '2022-07-30', 20000, 106); 
INSERT INTO credit_cards VALUES('379111576013111' , '218', 'American Express', '2021-11-30', 18000, 107); 
INSERT INTO credit_cards VALUES('4711127824828112', '190', 'Visa',             '2023-05-30', 25000, 108); 
INSERT INTO credit_cards VALUES('5131133634307113', '328', 'MasterCard',       '2020-09-30', 20000, 103); 
INSERT INTO credit_cards VALUES('379114576017114' , '208', 'American Express', '2021-08-30', 45000, 103); 
INSERT INTO credit_cards VALUES('4711157834878115', '192', 'Visa',             '2022-06-30', 15000, 103); 

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'accounts' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	acct_id INT UNSIGNED PRIMARY KEY,		#account_id
	acct_type_id INT UNSIGNED NOT NULL, 
	branch_id INT UNSIGNED NOT NULL, 
	acct_balance DECIMAL(10,2) NOT NULL,		#account_balance
	date_opened DATE NOT NULL,
        
	CONSTRAINT accounts_fk1_acct_type_id 
	FOREIGN KEY (acct_type_id) REFERENCES account_types (acct_type_id), 

	CONSTRAINT accounts_fk2_branch_id 
	FOREIGN KEY (branch_id) REFERENCES branches (branch_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'accounts' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO accounts VALUES(102151001, 10, 215, 3000.50, '2015-10-18');  
INSERT INTO accounts VALUES(112151002, 11, 215, 2000.25, '2015-10-18');  
INSERT INTO accounts VALUES(102501003, 10, 250, 8000.00, '2015-11-08');  
INSERT INTO accounts VALUES(112501004, 11, 250, 7000.75, '2015-11-08');  

INSERT INTO accounts VALUES(102101011, 10, 210, 3000.00, '2015-10-18');  
INSERT INTO accounts VALUES(112101012, 11, 210, 2500.50, '2015-10-18');  
INSERT INTO accounts VALUES(102151013, 10, 215, 4000.25, '2015-12-03');  
INSERT INTO accounts VALUES(112151014, 11, 215, 1700.00, '2015-12-03');  

INSERT INTO accounts VALUES(102151021, 10, 215, 6000.50, '2015-03-11');  
INSERT INTO accounts VALUES(112151022, 11, 215, 2000.25, '2015-04-12'); 

INSERT INTO accounts VALUES(102301031, 10, 230, 6000.00, '2016-08-15');  
INSERT INTO accounts VALUES(102551032, 10, 255, 2500.25, '2016-08-17');  
INSERT INTO accounts VALUES(112551033, 11, 255, 9900.00, '2016-08-17');  

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'accounts_customers' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS accounts_customers;
CREATE TABLE accounts_customers (
	acct_id INT UNSIGNED NOT NULL, 
	cust_id INT UNSIGNED NOT NULL, 
  
	PRIMARY KEY (cust_id, acct_id),	 
  
	CONSTRAINT accounts_customers_fk1_acct_id 
	FOREIGN KEY (acct_id) REFERENCES accounts (acct_id),
  
	CONSTRAINT accounts_customers_fk2_cust_id 
	FOREIGN KEY (cust_id) REFERENCES customers (cust_id) 
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'accounts_customers' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO accounts_customers VALUES(102151001, 100);
INSERT INTO accounts_customers VALUES(112151002, 100);
INSERT INTO accounts_customers VALUES(102501003, 100);
INSERT INTO accounts_customers VALUES(112501004, 100);

INSERT INTO accounts_customers VALUES(102101011, 101); 
INSERT INTO accounts_customers VALUES(112101012, 101);
INSERT INTO accounts_customers VALUES(102151013, 101);
INSERT INTO accounts_customers VALUES(112151014, 101);

INSERT INTO accounts_customers VALUES(102151021, 102);
INSERT INTO accounts_customers VALUES(112151022, 102);

INSERT INTO accounts_customers VALUES(102301031, 103);
INSERT INTO accounts_customers VALUES(102551032, 103);
INSERT INTO accounts_customers VALUES(112551033, 103);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'transactions' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions(
	tran_id INT UNSIGNED PRIMARY KEY,	# transaction_id
	tran_type enum('C','D') NOT NULL,	#'Credit','Debit'
	tran_desc VARCHAR(50) DEFAULT NULL,
	tran_amt DECIMAL(10,2) NOT NULL,	#transaction_amount
	tran_date DATE NOT NULL,
	cust_id INT UNSIGNED NOT NULL, 
	acct_id INT UNSIGNED NOT NULL, 
    
	CONSTRAINT transactions_fk1_cust_id 
	FOREIGN KEY (cust_id) REFERENCES customers (cust_id),
    
	CONSTRAINT transactions_fk2_acct_id 
	FOREIGN KEY (acct_id) REFERENCES accounts (acct_id) 
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'transactions' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO transactions VALUES (1001, 'C', 'salary', 750.00, '2014-03-18', 100, 102151001);
INSERT INTO transactions VALUES (1002, 'D', 'birthday gift', -100.00, '2014-04-18', 100, 102151001);
INSERT INTO transactions VALUES (1003, 'D', 'grocery', -150.00, '2014-04-19', 100, 102151001);
INSERT INTO transactions VALUES (1004, 'C', 'regular deposit', 400, '2014-04-25', 100, 112151002);
INSERT INTO transactions VALUES (1005, 'C', 'regular deposit', 200, '2014-04-26', 100, 112151002);
INSERT INTO transactions VALUES (1006, 'C', 'regular deposit', 300, '2014-04-27', 100, 102501003);

INSERT INTO transactions VALUES (1011, 'C', 'salary', 250.00, '2014-03-18', 101, 102101011);
INSERT INTO transactions VALUES (1012, 'D', 'birthday gift', -10.00, '2014-04-18', 101, 102101011);
INSERT INTO transactions VALUES (1013, 'C', 'regular deposit', 400, '2014-04-25', 101, 112101012);
INSERT INTO transactions VALUES (1014, 'D', 'grocery', -200, '2014-04-26', 101, 112101012);
INSERT INTO transactions VALUES (1015, 'C', 'regular deposit', 350, '2014-04-27', 101, 112151014);

INSERT INTO transactions VALUES (1021, 'C', 'salary', 750.00, '2014-03-18', 102, 102151021);
INSERT INTO transactions VALUES (1022, 'D', 'birthday gift', -210.00, '2014-04-18', 102, 102151021);
INSERT INTO transactions VALUES (1023, 'C', 'regular deposit', 200, '2014-04-25', 102, 102151021);
INSERT INTO transactions VALUES (1024, 'D', 'grocery', -100, '2014-04-26', 102, 102151021);
INSERT INTO transactions VALUES (1025, 'C', 'salary', 350, '2014-04-27', 102, 112151022);

INSERT INTO transactions VALUES (1031, 'C', 'salary', 1250.00, '2014-03-18', 103, 102301031);
INSERT INTO transactions VALUES (1032, 'D', 'grocery', -110.00, '2014-04-18', 103, 102301031);
INSERT INTO transactions VALUES (1033, 'C', 'regular deposit', 100, '2014-04-25', 103, 102301031);
INSERT INTO transactions VALUES (1034, 'D', 'gift', -100, '2014-04-26', 103, 102301031);
INSERT INTO transactions VALUES (1035, 'C', 'regular deposit', 400, '2014-04-25', 103, 102551032);
INSERT INTO transactions VALUES (1036, 'D', 'grocery', -150, '2014-04-26', 103, 102551032);
INSERT INTO transactions VALUES (1037, 'C', 'regular deposit', 5200, '2014-04-25', 103, 112551033);
INSERT INTO transactions VALUES (1038, 'D', 'grocery', -100, '2014-04-26', 103, 112551033);
INSERT INTO transactions VALUES (1039, 'D', 'grocery', -200, '2014-04-27', 103, 112551033);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'loans' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS loans;
CREATE TABLE loans (
	loan_id INT UNSIGNED PRIMARY KEY, 
	loan_type enum('Home','Education', 'Small Business', 'Auto') NOT NULL DEFAULT 'Home',
	loan_interest_rate DECIMAL(5,2) NOT NULL,
	loan_amt DECIMAL(12,2) NOT NULL,		#loan_amount
	loan_amt_with_interest DECIMAL(12,2) NOT NULL,
	loan_amt_paid_to_date DECIMAL(12,2) NOT NULL,
	loan_start_date DATE NOT NULL,
	loan_end_date_expected DATE NOT NULL,
	loan_end_date_actual DATE DEFAULT NULL,
	cust_id INT UNSIGNED NOT NULL, 
    
	CONSTRAINT loan_fk1_cust_id 
	FOREIGN KEY (cust_id) REFERENCES customers (cust_id) 
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'loans' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO loans VALUES(1001, 'Home'          , 3.00, 100000, 130000, 40000, '2017-01-01', '2018-01-01', NULL, 100); 
INSERT INTO loans VALUES(1002, 'Education'     , 4.00, 15000 , 21000 , 7000 , '2017-02-01', '2018-03-01', NULL, 100); 
INSERT INTO loans VALUES(1011, 'Education'     , 2.50, 20000 , 25000 , 5000 , '2017-04-02', '2018-04-01', NULL, 101); 
INSERT INTO loans VALUES(1021, 'Auto'          , 3.50, 17000 , 22950 , 0    , '2017-02-01', '2018-03-01', NULL, 102); 
INSERT INTO loans VALUES(1031, 'Small Business', 2.00, 120000, 144000, 60000, '2017-05-01', '2019-01-01', NULL, 103); 
INSERT INTO loans VALUES(1032, 'Education'     , 2.00, 10000 , 12000 , 3000 , '2017-05-01', '2019-02-01', NULL, 103); 
INSERT INTO loans VALUES(1033, 'Auto'          , 2.00, 10000 , 12000 , 6000 , '2017-05-01', '2019-03-01', NULL, 103); 
