
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Exercise – Composite Primary Key
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

CREATE TABLE person (
	name		VARCHAR(20)	NOT NULL DEFAULT "",
	gender		VARCHAR(1)	NOT NULL DEFAULT 'F',
	height		INT(3)		NOT NULL DEFAULT 160,
	eye_color	VARCHAR(10) 	NOT NULL DEFAULT "Brown",

	PRIMARY KEY perosn_pk(name, gender, height, eye_color)
);

SHOW TABLES; 
DESCRIBE person;

INSERT INTO person (name, gender, height) 
VALUES ('Chad', 'M', 180);

INSERT INTO person 
VALUES ('Ava', 'F', 181, 'Blue');

#Error Code: 1062. Duplicate entry
INSERT INTO person (name, gender, height) 
VALUES ('Chad', 'M', 180);	

INSERT INTO person (name, gender, height) 
VALUES ('Chad', 'M', 182);

SELECT * FROM person;
