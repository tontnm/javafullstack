
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Exercise (JOIN on Multiple Tables)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# Exercise 1
#	
SELECT b.book_name, c.category_name, a.author_name
FROM book b 
	INNER JOIN category c 
	INNER JOIN author a
ON b.category_id=c.category_id
AND b.author_id=a.author_id;


# Another way to write this query:
SELECT b.book_name, c.category_name, a.author_name
FROM book b
INNER JOIN category c 
	ON b.category_id = c.category_id
INNER JOIN author a
	ON b.author_id = a.author_id;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 2
#

#SELECT DISTINCT b.book_name, c.category_name, a.author_name
SELECT b.book_name, c.category_name, a.author_name
FROM book b 
LEFT OUTER JOIN category c 
	ON b.category_id=c.category_id
LEFT OUTER JOIN author a
	ON b.author_id=a.author_id;


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 3
#	
SELECT DISTINCT c.category_name
FROM category c JOIN  book b
	ON b.category_id=c.category_id;

