
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Data Types (2)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1

SELECT 10 + 2;
SELECT 10.00 + 2; 
SELECT 10 + '2'; 
SELECT 10 + 'two';
SELECT 10 + '20two';
SELECT 'ten' + 'two';
SELECT CONCAT('ten', 'two');


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2

SELECT birth_date, birth_date+1 
FROM employees
WHERE emp_no=100;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3

SELECT emp_no, emp_no/"2" AS id 
FROM employees;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 4

SELECT NOW(), 
	CAST(NOW() AS CHAR(10)) AS cst, 
	CONVERT(NOW(), CHAR(10)) AS cvrt;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 5

SELECT 12.43, 
	CAST(12.43 AS SIGNED INT) AS cst, 
	CONVERT(12.43, SIGNED INT) AS cvrt;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 6

SELECT 123, 
	CAST(123 AS DECIMAL(7,4)) AS cst, 
	CONVERT(-123, DECIMAL(7,4)) AS cvrt;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 7

SELECT -987654321.1234, 
	FORMAT(4567.89, 4) AS fmt1,
	FORMAT(4567.89, 0) AS fmt2,
	FORMAT(-987654321.1234, 2) AS fmt3,
	FORMAT(-987654321.1234, 5) AS fmt4;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 8

# Run the following in a command prompt
$ mysql -u root –p

SELECT CONCAT('first', ' * ' , 'line')  AS col1,
       CONCAT('SECOND', CHAR(13,10), 'LINE')  AS col2;

