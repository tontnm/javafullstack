
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# f01_person_db_structure_data.sql
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# To run the script:
# $ mysql -u root -p < f01_person_db_structure_data.sql

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP DATABASE IF EXISTS person_db;
CREATE DATABASE person_db;
USE person_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
CREATE TABLE person(
	person_id VARCHAR(4) NOT NULL,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	PRIMARY KEY(person_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE passport(
	passport_no VARCHAR(10) PRIMARY KEY,
	passport_issue_date DATE NOT NULL,
	person_id VARCHAR(4) UNIQUE NOT NULL,
	FOREIGN KEY (person_id) REFERENCES person(person_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# ALTER TABLE phone DROP FOREIGN KEY passport_fk_person_id;
#
CREATE TABLE phone(
	phone_no VARCHAR(20) NOT NULL,
    	phone_type ENUM('Home', 'Mobile', 'Work') DEFAULT 'Home',
	person_id VARCHAR(4) NOT NULL,
	FOREIGN KEY (person_id) REFERENCES person(person_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE location(
	location_id VARCHAR(3) PRIMARY KEY,
    	location_name VARCHAR(35) UNIQUE NOT NULL
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE person_location(
	person_id VARCHAR(4) NOT NULL,
    	location_id VARCHAR(3) NOT NULL,
	FOREIGN KEY (person_id) REFERENCES person(person_id),
	FOREIGN KEY (location_id) REFERENCES location(location_id),
	PRIMARY KEY(person_id,location_id)
);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
INSERT INTO person VALUES('D10L', 'Josh', 'Lee');
INSERT INTO person VALUES('L18T', 'Lydia', 'Tyler');
INSERT INTO person VALUES('E12F', 'Eva', 'Frank');
INSERT INTO person VALUES('L61T', 'June', 'Travis');
INSERT INTO person VALUES('B20M', 'Ben', 'Morgan');
INSERT INTO person VALUES('D65L', 'Nick', 'Green');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
INSERT INTO passport VALUES('65446455', '2013-12-03', 'D10L');
INSERT INTO passport VALUES('12337241', '2011-11-21', 'L18T');
INSERT INTO passport VALUES('18987649', '2016-01-18', 'E12F');
INSERT INTO passport VALUES('20341492', '2013-12-03', 'L61T');
INSERT INTO passport VALUES('10495854', '2016-06-22', 'B20M');
INSERT INTO passport VALUES('61865430', '2013-12-14', 'D65L');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO phone VALUES('(345) 321-xxxx', 'Mobile', 'L18T');
INSERT INTO phone VALUES('(123) 431-xxxx', 'Home', 'D10L');
INSERT INTO phone VALUES('(123) 901-xxxx', 'Home', 'B20M');
INSERT INTO phone VALUES('(345) 431-xxxx', 'Mobile', 'D10L');
INSERT INTO phone VALUES('(345) 901-xxxx', 'Mobile', 'B20M');
INSERT INTO phone VALUES('(123) 321-xxxx', 'Home', 'L18T');
INSERT INTO phone VALUES('(123) 953-xxxx', 'Home', 'D65L');
INSERT INTO phone VALUES('(345) 953-xxxx', 'Mobile', 'D65L');
INSERT INTO phone VALUES('(345) 530-xxxx', 'Mobile', 'E12F');
INSERT INTO phone VALUES('(345) 110-xxxx', 'Mobile', 'L61T');
INSERT INTO phone VALUES('(678) 953-xxxx', 'Work', 'D65L');
INSERT INTO phone VALUES('(123) 530-xxxx', 'Home', 'E12F');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO location VALUES('FRA', 'France');
INSERT INTO location VALUES('BAH', 'Bahamas');
INSERT INTO location VALUES('EGY', 'Egypt');
INSERT INTO location VALUES('MEX', 'Mexico');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO person_location VALUES('D10L', 'FRA');
INSERT INTO person_location VALUES('E12F', 'BAH');
INSERT INTO person_location VALUES('D10L', 'BAH');
INSERT INTO person_location VALUES('D10L', 'EGY');
INSERT INTO person_location VALUES('E12F', 'FRA');
INSERT INTO person_location VALUES('D65L', 'MEX');
INSERT INTO person_location VALUES('L18T', 'EGY');
INSERT INTO person_location VALUES('D65L', 'FRA');
INSERT INTO person_location VALUES('L18T', 'MEX');
