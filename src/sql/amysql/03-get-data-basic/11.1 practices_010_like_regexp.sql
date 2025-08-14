
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = LIKE - REGEXP
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

SELECT * FROM employees
WHERE first_name LIKE 'Ja%'; 

SELECT * FROM employees
WHERE first_name NOT LIKE 'Ja_'; 

SELECT * FROM employees
WHERE first_name LIKE 'Ja_';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise: find any name with the second character of 'e'.
SELECT * FROM employees
WHERE first_name LIKE '_e%';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1986-03-19', 'Pa%m', 'Brown', 'F', '2006-04-24', 81000.61);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1986-03-19', 'P%a_m', 'Brown', 'F', '2006-04-24', 81000.61);

SELECT * FROM employees WHERE first_name LIKE '%\%%';
SELECT * FROM employees WHERE first_name LIKE '%\_%';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM employees
WHERE last_name REGEXP 'er';

SELECT * FROM employees
WHERE last_name REGEXP '^Ma'; 

SELECT * FROM employees
WHERE last_name REGEXP 's$';

SELECT * FROM employees
WHERE last_name REGEXP 'er|ard'; 

SELECT * FROM employees
WHERE last_name REGEXP 'e[nrz]'; 

SELECT * FROM employees
WHERE last_name REGEXP '^B[a-z]'; 

SELECT * FROM employees
WHERE last_name REGEXP '[a-z]ez$'; 

