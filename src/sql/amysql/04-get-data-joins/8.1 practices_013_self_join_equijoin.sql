
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Exercise (Self Join & Equijoin)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
USE db_samples1;

DROP TABLE IF EXISTS school;

CREATE TABLE school (
	name VARCHAR (15),
	teacher VARCHAR (15)
);

INSERT INTO school (name, teacher) 
VALUES	('Victor', NULL), ('Meg', NULL), ('Mona', NULL), 
	('vic1', 'Victor'), ('vic2', 'Victor'), ('vic3', 'Victor'),
	('meg1', 'Meg'), ('meg2', 'Meg'),
	('mon1', 'Mona'), ('mon2', 'Mona'), ('mon3', 'Mona'), ('mon4', 'Mona');


SELECT name, teacher FROM school;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# (explicit) self-join
#
SELECT DISTINCT n.teacher, n.name
FROM school n INNER JOIN school t 
ON t.teacher = n.teacher
ORDER BY t.teacher;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Implicit self Join (not recommended)	
#
SELECT DISTINCT n.teacher, n.name
FROM school n, school t 
WHERE t.teacher = n.teacher
ORDER BY t.teacher;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# equijoin
#
SELECT DISTINCT n.teacher, n.name
FROM school n INNER JOIN school t 
	USING (teacher)
ORDER BY t.teacher;

