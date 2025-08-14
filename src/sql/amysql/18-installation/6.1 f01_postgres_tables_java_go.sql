
-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
-- = = PostgreSQL
-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
--

-- # # # # # # # # # # # # # # # # # # # # # # # # # # # #
-- Note: The following 'online_banking_db' database and 
-- 'customers' table will be used to connect from Java
-- to PostgreSQL.

CREATE DATABASE online_banking_db;
-- # # # # # # # # # # # # # # # # # # # # # # # # # # # #

CREATE TABLE customers (
	cust_id INT PRIMARY KEY,	 
	fname VARCHAR(35) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	gender CHAR(1) NOT NULL 
);

-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
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

-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM  customers;

-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE dogs(
	id INT PRIMARY KEY,
	name VARCHAR(35) UNIQUE NOT NULL,
	image BYTEA DEFAULT NULL,	-- instead of LONGBLOB
	notes TEXT DEFAULT NULL    	-- instead of LONGTEXT
);

-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO dogs(id, name) VALUES(1, 'German Shepherd');
INSERT INTO dogs(id, name) VALUES(2, 'Husky');
INSERT INTO dogs(id, name) VALUES(3, 'Shih Tzu');

-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM dogs;



-- # # # # # # # # # # # # # # # # # # # # # # # # # # # #
-- Note: The following 'go_db1' database and 'person' table 
-- will be used to connect from Go to PostgreSQL.

CREATE DATABASE go_db1;
-- # # # # # # # # # # # # # # # # # # # # # # # # # # # #

CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

INSERT INTO person (id, name) VALUES (1, 'Ava');
INSERT INTO person (id, name) VALUES (2, 'John');
INSERT INTO person (id, name) VALUES (3, 'June');
INSERT INTO person (id, name) VALUES (4, 'Tim');

-- = = = = = = = = = = = = = = = = = = = = = = = = = = = =
-- Only if needed
SELECT * FROM person;
UPDATE person SET name='Jack' WHERE id='2';
DELETE FROM person WHERE id='2';

