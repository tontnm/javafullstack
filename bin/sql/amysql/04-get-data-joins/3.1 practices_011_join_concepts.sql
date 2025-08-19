
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Joins
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
USE db_samples1;

DROP TABLE IF EXISTS animal1;
DROP TABLE IF EXISTS animal2;

CREATE TABLE animal1 (
	id	INT(3)		PRIMARY KEY AUTO_INCREMENT,
	name	VARCHAR (20)
);

CREATE TABLE animal2 (
	id	INT(3)		PRIMARY KEY AUTO_INCREMENT,
	name	VARCHAR (20)
);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
INSERT INTO animal1 (name) 
VALUES ('Lion'), ('Bear'), ('Tiger'), ('Elephant');

INSERT INTO animal2 (name)
VALUES ('Lion'), ('Giraffe'), ('Panda'), ('Tiger');

SELECT * FROM animal1;
SELECT * FROM animal2;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM animal1 a1
INNER JOIN animal2 a2
ON a1.name = a2.name;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM animal1 a1 
LEFT OUTER JOIN animal2 a2
ON a1.name = a2.name;

SELECT * FROM animal1 a1 
LEFT OUTER JOIN animal2 a2
ON a1.name = a2.name
WHERE a2.id IS NULL;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SELECT * FROM animal1 a1 
RIGHT OUTER JOIN animal2 a2
ON a1.name = a2.name;

SELECT * FROM animal1 a1 
RIGHT OUTER JOIN animal2 a2
ON a1.name = a2.name 
WHERE a1.id IS NULL;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Reversing a left outer join

SELECT * FROM animal1 a1 
LEFT OUTER JOIN animal2 a2
ON a1.name = a2.name;

SELECT * FROM animal2 a2 
RIGHT OUTER JOIN animal1 a1
ON a2.name = a1.name;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# We will review 'FULL OUTER JOIN' later in the course.
#
SELECT * FROM animal1 a1
LEFT JOIN animal2 a2 ON a1.name = a2.name
	UNION
SELECT * FROM animal1 a1
RIGHT JOIN animal2 a2 ON a1.name = a2.name
WHERE a1.id IS NULL;
# If you remove the WHERE clause, 'UNION' will remove the duplicates.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# We will review 'FULL OUTER JOIN with WHERE CLAUSE' later in the course.
#
SELECT * FROM animal1 a1 
LEFT OUTER JOIN animal2 a2
ON a1.name = a2.name
WHERE a2.id IS NULL
	UNION
SELECT * FROM animal1 a1
RIGHT OUTER JOIN animal2 a2
ON a1.name = a2.name
WHERE a1.id IS NULL;

