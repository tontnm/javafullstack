
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Views Examples (1)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

CREATE DATABASE IF NOT EXISTS db_samples4;
USE db_samples4;

CREATE TABLE book AS
SELECT * FROM db_samples1.book;

SELECT * FROM book;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
#
CREATE VIEW book_v1 AS
SELECT *
FROM book;

SELECT * FROM book_v1;


DROP VIEW book_v1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2
#
CREATE VIEW book_v2 (b_id, b_name, c_id) AS
SELECT book_id, book_name, category_id
FROM book;

SELECT * FROM book_v2;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3
#
CREATE VIEW book_v3 (b_id, b_name) AS
SELECT book_id, book_name, category_id
FROM book; 				# error

SELECT * FROM book_v3; 

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 4

SELECT * FROM book_v2;

SELECT * FROM book_v2
WHERE c_id IS NOT null;

SELECT * FROM book_v2
WHERE c_id IS NOT null
ORDER BY b_name;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 5

UPDATE book_v2
SET b_name = UPPER(b_name)
WHERE b_id=5; 

SELECT * FROM book_v2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 6 - an alternative to Example 2
#
CREATE VIEW book_v4 AS
SELECT book_id as b_id, book_name as b_name, category_id as c_id
FROM book;

SELECT * FROM book_v4;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 7

DROP VIEW book_v1;

