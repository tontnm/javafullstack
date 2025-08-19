
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Creating Databases & Tables – CRUD Operations
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

CREATE DATABASE IF NOT EXISTS db_samples2;
DROP DATABASE IF EXISTS db_samples2;

CREATE SCHEMA IF NOT EXISTS db_samples2;

SHOW DATABASES;

USE db_samples2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP TABLE IF EXISTS book;

CREATE TABLE book (
	book_id 	INT(3) PRIMARY KEY AUTO_INCREMENT,
	book_name	VARCHAR(30),
	category_id	INT(3),
	author_id	INT(3)
);

INSERT INTO book (book_name, category_id, author_id) 
VALUES ('MySQL', 3, 2), ('Scala', 1, 3), ('React', 1, 5);

SELECT * FROM book;
SELECT * FROM db_samples2.book;

# - - - - - - - - - - - - - - - - - - - - 
SELECT * FROM db_samples1.book;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: write a query to display all rows from the 'book' tables 
# from the 'db_samples1' and 'db_samples2' databases.
#
SELECT * FROM db_samples1.book
	UNION
SELECT * FROM db_samples2.book;

