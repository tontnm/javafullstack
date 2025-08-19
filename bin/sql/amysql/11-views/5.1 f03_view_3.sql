
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Read-Only and Updatable Views, Examples
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples4;

DROP TABLE IF EXISTS book;
CREATE TABLE book AS
SELECT * FROM db_samples1.book;

DROP TABLE IF EXISTS book2;
CREATE TABLE book2 AS
SELECT * FROM db_samples1.book2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1

CREATE OR REPLACE VIEW book_v3 AS
SELECT book_id, book_name, 
	CONCAT("** ", book_name) AS name2,
	CONCAT('', book_name) AS name3
FROM book;

SELECT * FROM book_v3;

# - - - - - - - - - - - - - - - - - - - - 
UPDATE book_v3 
SET book_name = 'HadoopXX'
WHERE book_id = 5;

SELECT * FROM book_v3;

# - - - - - - - - - - - - - - - - - - - - 
UPDATE book_v3 
SET name2 = '--Hadoop'
WHERE book_id = 5;	#error


UPDATE book_v3 
SET name3 = '--Hadoop'
WHERE book_id = 5;	#error

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2

CREATE OR REPLACE VIEW book_v4 AS
SELECT book_id, book_name, author_id
FROM book
WHERE author_id IS NOT NULL;

SELECT * FROM book_v4;

UPDATE book_v4
SET author_id=null
WHERE book_id=10;

SELECT * FROM book_v4;


# - - - - - - - - - - - - - - - - - - - - 
CREATE OR REPLACE VIEW book_v5 AS
SELECT book_id, book_name, author_id
FROM book
WHERE author_id IS NOT NULL
WITH CHECK OPTION;

SELECT * FROM book_v5;

UPDATE book_v5		#error
SET author_id=null
WHERE book_id=9;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3

SELECT * FROM book2;
DESC book2;

ALTER TABLE book2 
MODIFY COLUMN author_id INT(3) NOT NULL;

DESC book2;

# - - - - - - - - - - - - - - - - - - - -
INSERT INTO book2
VALUES (4, 'Scala', 1, 6);

SELECT * FROM book2;

# - - - - - - - - - - - - - - - - - - - -
CREATE OR REPLACE VIEW book2_v1 AS
SELECT book_id, book_name, category_id
FROM book2;

SELECT * FROM book2_v1;

# - - - - - - - - - - - - - - - - - - - - 
INSERT INTO book2_v1 (book_id, book_name, category_id)
VALUES (5, 'JEE', 1, 6);	# error

# - - - - - - - - - - - - - - - - - - - - 
INSERT INTO book2_v1 (book_id, book_name, category_id)
VALUES (5, 'JEE', 1);		# error

# - - - - - - - - - - - - - - - - - - - -
CREATE OR REPLACE VIEW book2_v1 AS
SELECT book_id, book_name, category_id, author_id
FROM book2;

SELECT * FROM book2_v1;

INSERT INTO book2_v1 (book_id, book_name, category_id, author_id)
VALUES (5, 'JEE', 1, 6);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Deleting from a view - your own exercise
