
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = GROUP BY (1)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Using the 'emps' table, find the minimum 
# and maximum salary of employees with first_name of 
# 'Maria', 'Marcos', 'Keith'.

SELECT COUNT(e.salary) AS num, 
	MIN(e.salary) AS min, 
	MAX(e.salary) AS max
FROM emps e
WHERE first_name IN ('Maria', 'Marcos', 'Keith')
ORDER BY salary;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: Modify the previous exercise to display  
# minimum and maximum salary of those employees in groups.
# The query should return 3 lines.

SELECT e.first_name,
	COUNT(e.salary) AS num, 
	MIN(e.salary) AS min, 
	MAX(e.salary) AS max
FROM emps e
WHERE first_name IN ('Maria', 'Marcos', 'Keith')
GROUP BY first_name
ORDER BY salary;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 3: Find sum of employees salaries with first_name of 
# 'Maria', 'Marcos', and group the result-set by first_name.
# Sort the result based on salary in a descending order.

SELECT e.first_name, e.last_name,
	SUM(e.salary) AS num
FROM emps e
WHERE first_name IN ('Maria', 'Marcos')
GROUP BY first_name
ORDER BY salary DESC;

