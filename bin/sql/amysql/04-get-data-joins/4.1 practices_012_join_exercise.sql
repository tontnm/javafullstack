
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Exercise (Join - books)
# = = Inner Join, Implicit Inner Join - Left/Right Outer Join
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
USE db_samples1;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS author;

CREATE TABLE book (
	book_id 	INT(3) PRIMARY KEY AUTO_INCREMENT,
	book_name	VARCHAR(30),
	category_id	INT(3),
	author_id	INT(3)
);

INSERT INTO book (book_name, category_id, author_id) 
VALUES ('SQL', 3, 2), ('C++', 1, 3), ('Java', 1, 5), 
	('HTML', 2, null), ('Hadoop', 4, null),
	('Javascript', null, null), ('Go', null, null),
	('SOA', 80, null), ('UML', 81, 91), ('Python', null, 92);


CREATE TABLE category (
	category_id	INT(3) PRIMARY KEY AUTO_INCREMENT,
	category_name	VARCHAR(30)
);

INSERT INTO category (category_name) 
VALUES ('Programming'), ('Web'), ('DB'), 
	('Big Data'), ('Language'), ('Kids'), ('Family'); 

CREATE TABLE author (
	author_id	INT(3) PRIMARY KEY AUTO_INCREMENT,
	author_name	VARCHAR(30)
);

INSERT INTO author (author_name) 
VALUES ('Traci'), ('Jay'), ('Meg'), 
	('Jad'), ('Gina'), ('Jim'), ('Liza'), ('Cate'); 

 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM book;
SELECT * FROM category;
SELECT * FROM author;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 1
#
SELECT b.book_name, b.category_id, category_name 
FROM book b
INNER JOIN category c
ON b.category_id = c.category_id
ORDER BY b.book_name;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 2
#
SELECT book_name, b.category_id, category_name 
FROM book b
INNER JOIN category c
ON b.category_id = c.category_id
WHERE b.category_id > 2
ORDER BY b.book_name;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Query 3
#
SELECT book_name, b.category_id, category_name 
FROM book b, category c 
WHERE b.category_id = c.category_id
ORDER BY b.book_name;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 4
#
SELECT book_name, b.category_id, category_name 
FROM book b 
LEFT OUTER JOIN category c
ON b.category_id = c.category_id;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 5
# 
SELECT b.book_name, b.category_id, c.category_name 
FROM book b 
LEFT OUTER JOIN category c
ON b.category_id = c.category_id
WHERE b.category_id IS NOT NULL;


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 6
# 
SELECT book_name, b.category_id, category_name 
FROM book b 
RIGHT OUTER JOIN category c
ON b.category_id = c.category_id;


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 7
#
SELECT book_name, b.category_id, category_name 
FROM book b 
RIGHT OUTER JOIN category c
ON b.category_id = c.category_id
WHERE b.category_id IS NOT NULL;


