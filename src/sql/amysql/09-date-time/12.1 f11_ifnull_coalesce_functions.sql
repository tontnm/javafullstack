
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = IFNULL() & COALESCE() Functions
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

SELECT book_id, book_name, category_id, author_id, 
	IFNULL(author_id, 999) AS auth999
FROM book;

# - - - - - - - - - - - - - - - - - - - - 
USE db_samples1;

SELECT book_id, book_name, category_id, author_id, 
	COALESCE(category_id, author_id, 999) AS auth999
FROM book;

