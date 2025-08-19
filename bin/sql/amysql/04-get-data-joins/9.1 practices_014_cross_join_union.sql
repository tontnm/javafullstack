
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Cross Join – UNION
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
USE db_samples1;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM book b CROSS JOIN category c;

SELECT * FROM book b CROSS JOIN category c
ORDER BY book_name;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
USE db_samples1;
DROP TABLE IF EXISTS book2;

CREATE TABLE book2 (
	book_id 	INT(3) PRIMARY KEY AUTO_INCREMENT,
	book_name	VARCHAR(30),
	category_id	INT(3),
	author_id	INT(3)
);

INSERT INTO book2 (book_name, category_id, author_id) 
VALUES ('Mongo', 3, 2), ('Rust', 1, 3), ('R', 1, 5);

SELECT * FROM book;
SELECT * FROM book2;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# UNION
#
SELECT * FROM book WHERE category_id <4;
SELECT * FROM book2 WHERE category_id <3;
	
SELECT *  FROM book WHERE category_id <4
	UNION
SELECT *  FROM book2 WHERE category_id <3
ORDER BY category_id DESC, book_name DESC;


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT *  FROM book WHERE book_id BETWEEN 2 AND 3
	UNION
SELECT *  FROM book WHERE book_id BETWEEN 5 AND 7
	UNION
SELECT *  FROM book WHERE book_id=10
ORDER BY book_id;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Note: Revisting the FULL OUTER JOIN examples 
# from the previous sections.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 1: simulate a full outer join using UNION
# Show all rows in the animal1 and animal2 tables.
#
SELECT * FROM animal1 a1
LEFT JOIN animal2 a2 ON a1.name = a2.name
	UNION
SELECT * FROM animal1 a1
RIGHT JOIN animal2 a2 ON a1.name = a2.name
WHERE a1.id IS NULL;
# If you remove the WHERE clause, 'UNION' will remove the duplicates.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 2: simulate a full outer join (with condition) using UNION
# Show all rows in the animal1 and animal2 tables, 
# excluding those that exist in both tables. .
#
SELECT * FROM animal1 a1 
LEFT OUTER JOIN animal2 a2
ON a1.name = a2.name
WHERE a2.id IS NULL
	UNION
SELECT * FROM animal1 a1
RIGHT OUTER JOIN animal2 a2
ON a1.name = a2.name
WHERE a1.id IS NULL;
