
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = CREATE TABLE (AS SELECT - LIKE)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;
SHOW TABLES;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE book2 AS
	SELECT * FROM db_samples1.book2;

SHOW TABLES;
SELECT * FROM book2;

DROP TABLE book2;
SHOW TABLES;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: create a new table book2 in 'db_samples2',
# from db_samples1.book2, but copy only those rows with
# author_id of 2 or 5;
#

USE db_samples2;
# DROP TABLE IF EXISTS book2;
CREATE TABLE book2 AS
	SELECT * FROM db_samples1.book2
	WHERE author_id IN (2,5);

SELECT * FROM book2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: create a new table book2a in 'db_samples2',
# from book and book2 tables in 'db_samples1', but copy 
# only those rows with category_id of 1;
#
USE db_samples2;

SELECT * FROM db_samples1.book;
SELECT * FROM db_samples1.book2;

# DROP TABLE IF EXISTS book2a;
CREATE TABLE book2a AS
SELECT * FROM db_samples1.book WHERE category_id=1
	UNION
SELECT * FROM db_samples1.book2 WHERE category_id=1;

SELECT * FROM book2a;

# - - - - - - - - - - - - - - - - - - - - 

USE db_samples2;
# DROP TABLE IF EXISTS book2b;
CREATE TABLE book2b 
	LIKE book2;

SHOW TABLES;
SELECT * FROM book2b;

