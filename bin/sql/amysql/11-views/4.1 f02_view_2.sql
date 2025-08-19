
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Views Examples (2)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples4;

DROP TABLE IF EXISTS book;
CREATE TABLE book AS
SELECT * FROM db_samples1.book;

DROP TABLE IF EXISTS category;
CREATE TABLE category AS
SELECT * FROM db_samples1.category;

DROP TABLE IF EXISTS animal1;
CREATE TABLE animal1 AS
SELECT * FROM db_samples1.animal1;

DROP TABLE IF EXISTS animal2;
CREATE TABLE animal2 AS
SELECT * FROM db_samples1.animal2;

SELECT * FROM book;
SELECT * FROM category;
SELECT * FROM animal1;
SELECT * FROM animal2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1 - create a view to return rows from 'book' and 
# 'category' tables where category_id > 2.
# Also sort the result-set by book_name.

CREATE OR REPLACE VIEW book_v1 AS 
	SELECT book_name, b.category_id, category_name 
	FROM book b 
	INNER JOIN category c 
	ON b.category_id = c.category_id
	WHERE b.category_id > 2 
	ORDER BY b.book_name;

SELECT * FROM book_v1;

DROP VIEW book_v1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2 - Fix the following view.

# Error Code: 1060. Duplicate column name 'id'
CREATE OR REPLACE VIEW animal_v1 AS 
	SELECT *
	FROM animal1 a1
	JOIN animal2 a2
	ON a1.name = a2.name;


# To fix this problem:
CREATE OR REPLACE VIEW animal_v1 
	(a1_id, a1_name, a2_id, a2_name) AS 
	SELECT * 
    	FROM animal1 a1
	JOIN animal2 a2
	ON a1.name = a2.name;


# Another way to write this query
CREATE OR REPLACE  VIEW animal_v1 AS 
	SELECT a1.id AS a1_id, a1.name AS a1_name, 
		    a2.id AS a2_id, a2.name AS a2_name
	FROM animal1 a1
	JOIN animal2 a2
	ON a1.name = a2.name;


SELECT * FROM animal_v1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# nested view
# Exercise 3 - create a simple view to use the following view.

USE db_samples1;

CREATE OR REPLACE VIEW animal_v1 
	(a1_id, a1_name, a2_id, a2_name) AS 
	SELECT *
	FROM animal1 a1 JOIN animal2 a2
	ON a1.name = a2.name;

SELECT * FROM animal_v1;

CREATE OR REPLACE VIEW animal_v2 AS 
	SELECT a1_name, a2_name
	FROM animal_v1;

SELECT * FROM animal_v2;

