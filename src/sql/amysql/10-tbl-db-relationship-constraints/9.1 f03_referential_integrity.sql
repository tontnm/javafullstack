
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Foreign Key Constraints & Referential Integrity
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# If needed
# CREATE DATABASE IF NOT EXISTS db_samples3;
USE db_samples3;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
USE db_samples3;

# Exercise: Create two tables ('book' and 'author') with the
# following relationships: a book may have 1 author;
# an author may have 0-m books;
# 

# If needed
# DROP TABLE IF EXISTS book;
# DROP TABLE IF EXISTS author;

CREATE TABLE author(
	author_id INT NOT NULL,
	author_name VARCHAR(50)	NOT NULL UNIQUE,

	PRIMARY KEY (author_id)
);

# - - - - - - - - - - - - - - - - - - - - 
CREATE TABLE book(
	book_id INT PRIMARY KEY,
	book_name VARCHAR(30) NOT NULL,
	author_id INT NOT NULL,

	FOREIGN KEY (author_id) REFERENCES author (author_id)
);

# - - - - - - - - - - - - - - - - - - - - 
INSERT INTO book VALUES(11, 'book11', 1); #error
INSERT INTO author VALUES(1, 'auth1');
INSERT INTO book VALUES(11, 'book11', 2); #error
INSERT INTO book VALUES(12, 'book12', 1);
INSERT INTO book VALUES(11, 'book11', 1); #error

# - - - - - - - - - - - - - - - - - - - - 
INSERT INTO author VALUES(2, 'auth2');
INSERT INTO book VALUES(21, 'book21', 2);
INSERT INTO book VALUES(22, 'book22', 2);
INSERT INTO book VALUES(23, 'book21', 2);

INSERT INTO book VALUES(12, 'book12', 1);

# - - - - - - - - - - - - - - - - - - - - 
SELECT * FROM author;
SELECT * FROM book;

DELETE FROM book WHERE book_id=11; #ok-author can exists without books
DELETE FROM book WHERE book_id=12; #ok-author can exists without books

DELETE FROM author WHERE author_id=1;

DELETE FROM author WHERE author_id=2; 	#error


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# New requirement:
# If you remove an author, all his books must be deleted;
# Adding 'ON DELETE CASCADE' will remove the previous restriction.

CREATE TABLE book(
	book_id INT PRIMARY KEY,
	book_name VARCHAR(30) NOT NULL,
	author_id INT NOT NULL,

	FOREIGN KEY (author_id) REFERENCES author (author_id)
	ON DELETE CASCADE
	# also try 'ON DELETE SET NULL' and 'ON DELETE NO ACTION'
);



