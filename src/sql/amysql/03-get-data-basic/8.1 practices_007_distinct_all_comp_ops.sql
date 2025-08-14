
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = DISTINCT / ALL - Comparison Operators
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -

SELECT first_name, gender FROM employees 
WHERE first_name='Benny';

SELECT DISTINCT first_name, gender FROM employees 
WHERE first_name='Benny';

SELECT first_name, last_name, gender FROM employees 
WHERE first_name='Benny';

SELECT DISTINCT first_name, last_name, gender FROM employees 
WHERE first_name='Benny';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM employees 
WHERE hire_date >= '2000-04-22';

SELECT * FROM employees 
WHERE hire_date != '2000-04-22';  #or <>

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM employees 
WHERE last_name='Jimenez';

SELECT * FROM employees 
WHERE last_name='Jimenez' AND gender='M';

SELECT * FROM employees 
WHERE NOT gender = 'M' OR last_name='Jimenez';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Your Exercise: write any query of your choice to use
# and mix the topics we've learned so far. 
# For instance use logical/mathematical/comparison operators.
# Use functions (CONCAT, LEFT), keywords (DISTINCT, ALL, ...).

