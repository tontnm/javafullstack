
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = DELETE
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM emps;
SELECT COUNT(*) FROM emps; #23 rows

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DELETE FROM emps
WHERE emp_no=1000; # 0 rows affected

SELECT COUNT(*) FROM emps; # still 23 rows

DELETE FROM emps
WHERE first_name='BEN'; # 2 rows affected

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Write a DELETE statement that uses a subquery.
#

CREATE TABLE emp3 AS SELECT * FROM emps;

DELETE FROM emps
WHERE emp_no IN (
	SELECT emp_no FROM emp3
	WHERE emp_no IN (1,2,5));

SELECT * FROM emps
WHERE emp_no IN (1, 2, 5); # no rows

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Note: The following shows us that delete is 'case insensitive'.
#
SELECT * FROM emps; #two rows with first_name=Marcus 

DELETE FROM emps
WHERE first_name='MARCOS'; //2 row(s) affected

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM emp3;

DELETE FROM emp3;	#removes all rows
SELECT * FROM emp3;

DROP TABLE emp3;
