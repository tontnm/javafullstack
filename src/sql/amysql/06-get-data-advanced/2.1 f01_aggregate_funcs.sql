
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Summary Queries – Aggregate Functions
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;

DROP TABLE IF EXISTS emps;

CREATE TABLE emps 
	AS SELECT * FROM db_samples1.employees;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
SELECT AVG(e.salary) AS 'avg salary'
FROM emps e;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2
SELECT COUNT(*) AS 'num', AVG(e.salary) AS 'avg'
FROM emps e;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3
#
SELECT COUNT(*) AS 'num1', 
	COUNT(e.salary) AS 'num2',
	COUNT(distinct e.salary) AS 'num3',
	AVG(e.salary) AS 'avg'
FROM emps e;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 4
#
DROP TABLE IF EXISTS tmp;
CREATE TABLE tmp(
	id1 INT NOT NULL,
	id2 INT NOT NULL
);

INSERT INTO tmp VALUES (1,1), (2,2), (1,1), (1,3);

SELECT count(*) `all`, count(id1) `id1_all`, count(id2) `id2_all`,
	count(distinct id1) `id1_dis`, count(distinct id2) `id2_dis`
FROM tmp;	

DROP TABLE IF EXISTS tmp;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Find employees with the same salaries.
#
# To get ready for this exercise, first make the following changes. 
#
UPDATE emps SET salary=50000
WHERE emp_no IN (3, 6, 8, 9);


SELECT DISTINCT e1.emp_no, e1.first_name, e1.last_name, e1.salary
FROM emps e1 JOIN emps e2
WHERE (e1.salary = e2.salary) AND (e1.emp_no <> e2.emp_no);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: find average salary of employees with the same birth_date.
#

SELECT COUNT(e.salary) AS num, 
AVG(e.salary) AS avg, e.birth_date AS bday
FROM emps e
GROUP BY e.birth_date;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 3: find average salary of employees with the same first_name.
#
SELECT COUNT(e.salary) AS num, 
AVG(e.salary) AS avg, e.first_name
FROM emps e
GROUP BY e.first_name;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 4: Using the 'emps' table, find the number of 
# employees and average salary of employees who 
# a) were born before 1980, and 
# b) their employee number is between 11 and 14;
# Also round the average salary by 2 decimal points.
#
SELECT COUNT(e.salary) AS num, 
	AVG(e.salary) AS avg,
	ROUND(AVG(e.salary),2) AS avg_round
FROM emps e
WHERE birth_date < '1980-01-01' AND 
emp_no BETWEEN 11 AND 14;
