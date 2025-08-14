
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Primary Key - WHERE clause - Exercise (Customer table)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
USE db_samples1;

CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30),
  country VARCHAR(25)
);

SHOW TABLES; 
DESCRIBE customer;

INSERT INTO customer (first_name) VALUES ('Monica');
INSERT INTO customer (first_name) VALUES ('Monica');
INSERT INTO customer (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer (first_name, last_name) VALUES ('Sue', 'Travis');
INSERT INTO customer (first_name, country) VALUES ('Nick', 'England');

INSERT INTO customer (first_name, last_name, country) 
VALUES ('Tim', 'Noble', 'Canada');

INSERT INTO customer (first_name, last_name, country) 
VALUES ('Mike', 'Noble', 'Canada');

INSERT INTO customer (last_name) VALUES ('Alex'); # Error

SELECT * FROM customer;

SELECT * FROM customer
WHERE first_name='Monica';

SELECT * FROM customer
WHERE first_name='Sue';

SELECT * FROM customer
WHERE country='Canada';

SELECT * FROM customer
WHERE last_name IS NULL;

SELECT * FROM customer
WHERE last_name IS NOT NULL;
