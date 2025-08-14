
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = IN and Subqueries with IN - BETWEEN
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM employees
WHERE last_name='Flowers' OR 
	last_name='Hill' OR 
        last_name='Beck';

SELECT * FROM employees 
WHERE last_name IN ('Flowers', 'Hill', 'Beck');

SELECT * FROM employees 
WHERE last_name NOT IN ('Flowers', 'Hill', 'Beck');

SELECT * FROM employees 
WHERE emp_no IN (1, 4, 14, 15, 16);

SELECT emp_no FROM employees
WHERE last_name='Rice';

SELECT * FROM employees
WHERE emp_no IN 
	(SELECT emp_no FROM employees
	WHERE last_name='Rice');


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM employees 
WHERE hire_date BETWEEN '2004-04-01' AND '2004-04-29'; 

SELECT * FROM employees 
WHERE hire_date NOT BETWEEN '2004-04-01' AND '2004-04-29'; 


