
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = ALTER TABLE
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# USE db_samples2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Insert those rows from db_samples1.book to
# db_samples2.book2b that their author_id is not null.
#
SHOW TABLES;

DROP TABLE IF EXISTS book2b;
CREATE TABLE book2b LIKE db_samples1.book;
SELECT * FROM book2b;

SELECT * FROM book2b;
SELECT * FROM db_samples1.book;

INSERT INTO book2b
	SELECT * FROM db_samples1.book
	WHERE author_id IS NOT NULL;

SELECT * FROM book2b;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DESC book2b;

ALTER TABLE book2b
ADD num_of_pages INT NOT NULL;

DESC book2b;

INSERT INTO book2b VALUES (11, 'Angular', 83, 93, 947); #ok

#Error Code: 1048. Column 'num_of_pages' cannot be null
INSERT INTO book2b VALUES (12, 'XML', 84, 94, NULL); 

# - - - - - - - - - - - - - - - - - - - - 
ALTER TABLE book2b
MODIFY num_of_pages INT;

INSERT INTO book2b VALUES (12, 'XML', 84, 94, NULL); #ok

DESC book2b;
SELECT * FROM book2b;

# - - - - - - - - - - - - - - - - - - - - 
ALTER TABLE book2b
  CHANGE COLUMN num_of_pages num_pages INT(3),
  CHANGE COLUMN author_id auth_id INT(6);

DESC book2b;

# - - - - - - - - - - - - - - - - - - - - 
ALTER TABLE book2b
RENAME COLUMN auth_id TO author_id;

DESC book2b;

# - - - - - - - - - - - - - - - - - - - - 
ALTER TABLE book2b
DROP COLUMN num_pages;

DESC book2b;
SELECT * FROM book2b;
