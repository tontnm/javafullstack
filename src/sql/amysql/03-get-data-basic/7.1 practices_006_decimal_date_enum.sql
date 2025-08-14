
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = DECIMAL - DATE - ENUM
# = = CONCAT() – LEFT() – Mathematical Operators
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

CREATE TABLE employees(
	emp_no		INT		PRIMARY KEY AUTO_INCREMENT,
	birth_date	DATE		NOT NULL,
	first_name	VARCHAR(20)	NOT NULL,
	last_name	VARCHAR(16)	NOT NULL,
	gender		ENUM('M','F')	NOT NULL,
	hire_date	DATE		NOT NULL,
	salary		DECIMAL(9,2)	NOT NULL
);

SHOW TABLES; 
DESCRIBE employees;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Maria', 'Flowers', 'F', '2000-02-28', 65000.45);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Maria', 'Jimenez', 'F', '2000-02-28', 65000.23);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Benny', 'Flowers', 'M', '2000-02-28', 75000.23);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Benny', 'Jimenez', 'M', '2000-02-28', 60000.91);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Janice', 'Myers', 'F', '2000-02-28', 60000.10);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Marcos', 'Myers', 'M', '2000-02-28', 85000.75);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-03-28', 'Marcos', 'Hill', 'M', '2000-03-28', 65000.73);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-03-28', 'Barbara', 'Ballard', 'F', '2000-03-28', 80000.13);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-03-28', 'Alan', 'Ballard', 'M', '2000-03-28', 62000.42);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1981-03-21', 'Bradford', 'Bush', 'M', '2001-04-21', 61000.40);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1978-03-21', 'Clinton', 'Cunningham', 'M', '2000-04-21', 91000.13);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Keith', 'Martinez', 'M', '2000-04-21', 93000.55);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Keith', 'Beck', 'M', '2000-04-21', 83000.38);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Shelia', 'Martinez', 'F', '2000-04-21', 94000.12);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Traci', 'Rice', 'F', '2000-04-21', 65000.73);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-19', 'Lillian', 'Rice', 'F', '2000-04-21', 89000.20);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-18', 'Kathleen', 'Rice', 'F', '2000-04-21', 55000.21);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1982-05-18', 'Kathleen', 'Chandler', 'F', '2000-04-21', 61000.44);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1983-05-18', 'Jay', 'Lindsey', 'M', '2004-04-22', 39000.95);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1983-05-18', 'Mark', 'Hunt', 'M', '2004-04-23', 99000.12);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1985-05-18', 'Jack', 'Hunt', 'M', '2005-04-23', 91000.22);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1986-03-18', 'Jaden', 'Hunt', 'M', '2006-04-23', 81000.22);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1986-03-19', 'Jad', 'Hunt', 'M', '2006-04-24', 81000.61);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM employees;

SELECT * FROM employees WHERE first_name='Maria';
SELECT * FROM employees WHERE first_name='MAriA';

SELECT * FROM employees WHERE last_name='Ballard';

SELECT * FROM employees 
WHERE last_name='Ballard' AND gender='F';

SELECT * FROM employees 
WHERE birth_date='1980-03-28';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT emp_no AS id , 
	CONCAT(first_name, ' ', last_name) AS name 
FROM employees;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise: dispaly rows in this format: Maria's last name: Flowers'
SELECT CONCAT(first_name, "'s last name: ", last_name) AS name
FROM employees;

SELECT CONCAT(first_name, '''s last name: ', last_name) AS name 
FROM employees;

SELECT CONCAT(first_name, '"s last name: ', last_name) AS name
FROM employees;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 9+2, 9-2, 9*2, 9/2, 9 DIV 2, 9%2;

SELECT emp_no, salary, 
salary * 10 AS mult,
salary / 10 AS div1,
salary DIV 10 AS div2,
salary % 10 AS modulo   
FROM employees;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT first_name, last_name, 
LEFT(first_name,1), LEFT(last_name,1) 
FROM employees;

# Exercise: display employees first_name, last_name, and initials
SELECT first_name, last_name, 
CONCAT(LEFT(first_name,1), LEFT(last_name,1)) AS Initials 
FROM employees;
