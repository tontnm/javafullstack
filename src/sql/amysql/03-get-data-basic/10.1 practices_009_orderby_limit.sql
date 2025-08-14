
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = ORDER BY - LIMIT
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM employees 
ORDER BY last_name;

SELECT * FROM employees 
ORDER BY last_name desc;

SELECT * FROM employees 
ORDER BY last_name, first_name desc;

SELECT * FROM employees 
WHERE last_name IN('Rice', 'Hunt') 
ORDER BY last_name, first_name desc;

SELECT * FROM employees 
ORDER BY hire_date;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise: sort the employees table based on 
# "last_name, ' ', first_name" asc and then 'gender' desc
#

# not efficient
SELECT CONCAT(last_name, ' ', first_name) full_name, gender
FROM employees
ORDER BY CONCAT(last_name, ' ', first_name), gender DESC;

SELECT CONCAT(last_name, ' ', first_name) full_name, gender
FROM employees
ORDER BY full_name, gender DESC;

SELECT CONCAT(last_name, ' ', first_name) full_name, gender
FROM employees
ORDER BY 1, 2 DESC;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

SELECT * FROM employees LIMIT 5; 
SELECT * FROM employees LIMIT 3,5;  #3 is offset; 5 is row_count

