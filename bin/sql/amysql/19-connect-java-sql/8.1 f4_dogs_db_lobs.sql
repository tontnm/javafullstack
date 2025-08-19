
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = JDBC & Using Large Objects
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#

DROP SCHEMA IF EXISTS dogs_db;
CREATE SCHEMA IF NOT EXISTS dogs_db;
USE dogs_db;

CREATE TABLE dogs(
	id INT PRIMARY KEY,
	name VARCHAR(35) UNIQUE NOT NULL,
	image LONGBLOB DEFAULT NULL,
	notes LONGTEXT DEFAULT NULL    
);

INSERT INTO dogs(id, name) VALUES(1, 'German Shepherd');
INSERT INTO dogs(id, name) VALUES(2, 'Husky');
INSERT INTO dogs(id, name) VALUES(3, 'Shih Tzu');

SELECT * FROM dogs;

