
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Data Types (1)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
#
USE db_samples2;

DROP TABLE IF EXISTS test_types2;
CREATE TABLE test_types2 (name1 CHAR(4), name2 VARCHAR(4));

DESC test_types2;

INSERT INTO test_types2 VALUES ('abc', 'abc');
INSERT INTO test_types2 VALUES ('abcd', 'abcd');
INSERT INTO test_types2 VALUES ('abcde', 'abcde'); #error

SELECT * FROM test_types2;

SELECT name1, char_length(name1) AS n1,
       name2, char_length(name2) AS n2
FROM  test_types2;

DROP TABLE test_types2;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2
#
CREATE TABLE test_types1(
	sport_day ENUM('Mon', 'Wed', 'Fri') DEFAULT 'Mon',
    	sport SET('soccer', 'swimming', 'tennis', 'basketball') DEFAULT 'soccer'
);

INSERT INTO test_types1 VALUES ('Mon', 'soccer');
INSERT INTO test_types1 VALUES ('Tue', 'soccer'); #error
INSERT INTO test_types1 VALUES ('Mon', 'karate'); #error

INSERT INTO test_types1 VALUES ('Wed', 'tennis, swimming'); 
INSERT INTO test_types1 VALUES ('Fri', 'basketball, tennis, soccer');
INSERT INTO test_types1 VALUES ('Fri', 'basketball, tennis, soccer'); #error
INSERT INTO test_types1 VALUES ('Fri', 'basketball, karate, soccer'); #error
INSERT INTO test_types1 VALUES ('Fri', 'basketball, tennis, karate'); #error

INSERT INTO test_types1 VALUES ();

SELECT * FROM test_types1;

