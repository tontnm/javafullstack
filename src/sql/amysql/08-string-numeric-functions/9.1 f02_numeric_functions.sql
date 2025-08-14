
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Numeric Functions
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT 
	MOD(23, 10) AS col1,
	23 % 10 AS col2,
	23 MOD 10 AS col3;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT SIGN(-2) AS col1;
SELECT ABS(-2) AS col1;
SELECT CEIL(-2.51) AS col1;
SELECT FLOOR(-2.51) AS col1;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT POW(3,2) AS col1;
SELECT SQRT(16) AS col1;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT TRUNCATE(1.222,1) AS col1;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT RAND() AS col1;	

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise: generate random integers between 5 and 15
#
SELECT FLOOR(5 + (RAND() * 10)) AS col1;

