
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = UPDATE
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;
SHOW TABLES;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS book2;
DROP TABLE IF EXISTS book2a;
DROP TABLE IF EXISTS book2b;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE emps AS
	SELECT * FROM db_samples1.employees;

DESC emps;

# - - - - - - - - - - - - - - - - - - - - 
UPDATE emps  
SET birth_date='1980-12-25', hire_date='2000-12-25'
WHERE emp_no=1; #will impact only one row

# - - - - - - - - - - - - - - - - - - - - 
SELECT * FROM emps WHERE first_name='Benny';

UPDATE emps 
SET first_name='BEN'
WHERE first_name='Benny'; #will impact two rows

SELECT * FROM emps WHERE first_name='Benny';
SELECT * FROM emps WHERE first_name='BEN';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: write a query to change the first_name of 
# employees with emp_no=1 and 2 with the first_name of the employee
# with emp_no=5, from 'db_samples1.employees'. Make sure to use a 
# sub-query (a SELECT statement) in the SET part of the UPDATE statement.
#

UPDATE emps 
SET first_name = (
	SELECT first_name FROM db_samples1.employees
	WHERE emp_no=5)
WHERE emp_no IN (1, 2);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: In the following update statement, replace
# ('Janice', 'Shelia') with a subquery.
#
#   UPDATE emps 
#   SET first_name='Sue'
#   WHERE first_name IN ('Janice', 'Shelia');
#

UPDATE emps 
SET first_name='Sue'
WHERE first_name IN 
	(SELECT DISTINCT first_name 
	FROM db_samples1.employees
	WHERE first_name IN ('Janice', 'Shelia'));

SELECT * FROM emps
WHERE first_name='Sue';
