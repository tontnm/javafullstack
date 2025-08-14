
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = DEFAULT keyword - Logical Operators
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
		
USE db_samples1;

CREATE TABLE customer2 (
  id 		INT  		AUTO_INCREMENT PRIMARY KEY,
  first_name 	VARCHAR(30) 	NOT NULL,
  last_name 	VARCHAR(30) 	DEFAULT 'TBD',
  country 	VARCHAR(25) 	DEFAULT "UNKNOWN"
);

SHOW TABLES; 
DESCRIBE customer2;

INSERT INTO customer2 (first_name) VALUES ('Monica');
INSERT INTO customer2 (first_name) VALUES ('Monica');
INSERT INTO customer2 (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer2 (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer2 (first_name, last_name) VALUES ('Sue', 'Travis');

INSERT INTO customer2 (first_name, country) 
VALUES ('Nick', 'England');

INSERT INTO customer2 (first_name, last_name, country) 
VALUES ('Tim', 'Noble', 'Canada');

INSERT INTO customer2 (first_name, last_name, country) 
VALUES ('Mike', 'Noble', 'Canada');

INSERT INTO customer2 (first_name, last_name, country) 
VALUES ('Mike', NULL, NULL);

# INSERT INTO customer2 (last_name) VALUES ('Alex');	# Error

SELECT * FROM customer2;

SELECT * FROM customer2
WHERE last_name IS NULL;

SELECT * FROM customer2
WHERE last_name IS NOT NULL;

SELECT * FROM customer2
WHERE last_name='TBD';


SELECT * FROM customer2
WHERE last_name='TBD' AND country='UNKNOWN';

SELECT * FROM customer2
WHERE last_name='TBD' OR country='UNKNOWN';

SELECT * FROM customer2
WHERE last_name!='TBD' && country!='UNKNOWN';

SELECT * FROM customer2
WHERE last_name!='TBD' || country!='UNKNOWN';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 1: Find customers with either unknown last_name
# or unknown country (not with both)
#
SELECT * FROM customer2
WHERE last_name='TBD' XOR country='UNKNOWN';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 2: rebuild every row of the preceding 
# truth table using the SELECT statement.
#

SELECT 1 && 1 AS n, 
	1 || 1 AS r, 
	1 XOR 1 AS x,
	!1 AS t;
    
SELECT 1 AND 0 AS n, 
	1 OR 0 AS r, 
	1 XOR 0 AS x,
	NOT 1 AS t;

SELECT 0 && 1 AS n, 
	0 || 1 AS r, 
	0 XOR 1 AS x,
	!0 AS t;
 
SELECT 0 && 0 AS n, 
	0 || 0 AS r, 
	0 XOR 0 AS x,
	!0 AS t;

