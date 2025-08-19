
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Attributes & Constraints
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples3;
DROP TABLE IF EXISTS child;
DROP TABLE IF EXISTS mother;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE mother(
	mother_ids	INT,
	dob		DATE
);

# - - - - - - - - - - - - - - - - - - - - 
# exercise 1: drop the 'dob' field.
ALTER TABLE mother
DROP COLUMN dob;

DESC mother;

# - - - - - - - - - - - - - - - - - - - - 
# exercise 2: add a new column, mother_name VARCHAR(50) NOT NULL UNIQUE.
ALTER TABLE mother
ADD COLUMN mother_name VARCHAR(50) NOT NULL UNIQUE;

# - - - - - - - - - - - - - - - - - - - - 
# exercise 3: change the name of the field 'mother_ids' to 'mother_id'
# and also make it PRIMARY KEY and NOT NULL.
# note that we don't need not null, as primary key is implicitely not null.

ALTER TABLE mother 
CHANGE COLUMN mother_ids mother_id INT PRIMARY KEY;


      
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE child(
	child_id	INT,
	child_name	VARCHAR(10),
	mother_id	INT	NOT NULL
);

# - - - - - - - - - - - - - - - - - - - - 
# exercise 4: modify the type of 'child_name' to VARCHAR(30) NOT NULL.
ALTER TABLE child
MODIFY COLUMN child_name VARCHAR(30) NOT NULL;

DESC child;

# - - - - - - - - - - - - - - - - - - - - 
# exercise 5: set the 'child_id' as the primary key.
ALTER TABLE child
ADD PRIMARY KEY (child_id);

 
# - - - - - - - - - - - - - - - - - - - - 
# exercise 6: set a relationship between child and mother table.
ALTER TABLE child
ADD FOREIGN KEY (mother_id) REFERENCES mother (mother_id);


# - - - - - - - - - - - - - - - - - - - - 
# exercise 7: add several rows to both 'mother' and 'child'
# tables and practice referential integrity.
#
#INSERT INTO child VALUES(11, 'child11', 1);#error
INSERT INTO mother VALUES(1, 'mot1');
#INSERT INTO child VALUES(11, 'child11', 2);#error
INSERT INTO child VALUES(11, 'child11', 1);
#INSERT INTO child VALUES(11, 'child11', 1);#error
INSERT INTO child VALUES(12, 'child12', 1);

INSERT INTO mother VALUES(2, 'mot2');
INSERT INTO child VALUES(21, 'child21', 2);
INSERT INTO child VALUES(22, 'child22', 2);
INSERT INTO child VALUES(23, 'child21', 2);


SELECT * FROM mother;
SELECT * FROM child;

DELETE FROM child WHERE child_id=11;
DELETE FROM child WHERE child_id=12;

DELETE FROM mother WHERE mother_id=1;
DELETE FROM mother WHERE mother_id=2; #error

# - - - - - - - - - - - - - - - - - - - - 
# exercise 8: Modify the relationship so that removing a row from the 
# 'mother' table removes all it's associated rows in the 'child table.

ALTER TABLE child DROP FOREIGN KEY child_ibfk_1;

ALTER TABLE child
ADD FOREIGN KEY (mother_id) REFERENCES mother (mother_id)
ON DELETE CASCADE;

