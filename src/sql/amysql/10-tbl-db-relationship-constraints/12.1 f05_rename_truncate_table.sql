
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = {RENAME | TRUNCATE | DROP} TABLE
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
DROP TABLE IF EXISTS book;

CREATE TABLE book(
	book_id 	INT PRIMARY KEY AUTO_INCREMENT,
	book_name	VARCHAR(30)
);

INSERT INTO book(book_name) VALUES('book1'), ('book2'), ('book3');
SELECT * FROM book;

RENAME TABLE book TO books;
SELECT * FROM book;
 #error
SELECT * FROM books;

TRUNCATE TABLE books;
SELECT * FROM books;

DROP TABLE IF EXISTS books;
