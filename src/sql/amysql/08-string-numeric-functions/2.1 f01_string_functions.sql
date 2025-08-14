
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = String Functions
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT 
	LOWER("Have a NICE Day!") AS lwr1,
	LCASE("Have a NICE Day!") AS lwr2,
	UPPER("Have a NICE Day!") AS upr1,
	UCASE("Have a NICE Day!") AS upr2;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	CONCAT("*", "  XX  ", "*") AS orig,
	CONCAT("*", LTRIM("  XX  "), "*") AS ltr,
	CONCAT("*", RTRIM("  XX  "), "*") AS rtr,
	CONCAT("*", TRIM("  XX  "), "*") AS tr;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	CONCAT("aa", "BB", "cc") AS col1,
	CONCAT_WS(",", "aa", "BB", "cc") AS col2,
	CONCAT_WS("***", "aa", "BB", "cc") AS col3;


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	LENGTH("how are you") AS col1,
	CHAR_LENGTH("how are you") AS col2,
	LENGTH("€€") AS col3,
	CHAR_LENGTH("€€") AS col4;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	LENGTH("What is the length of this text?") AS ln1,
	LENGTH("") AS ln2,
    
	LPAD("blue", 3, "*") AS lp1,
	LPAD("blue", 4, "*") AS lp2,
	LPAD("blue", 5, "*") AS lp3,
	LPAD("blue", 6, "*") AS lp4,
    
	RPAD("blue", 3, "*") AS rp1,
	RPAD("blue", 4, "*") AS rp2,
	RPAD("blue", 5, "*") AS rp3, 
	RPAD("blue", 6, "*") AS rp4;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	LEFT("LeftRight", 4) AS l1,
	LEFT("LeftRight", 5) AS l1,
	RIGHT("LeftRight", 5) AS r1,
	RIGHT("LeftRight", 6) AS r2;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	REVERSE("abcd") AS col1,
	REPEAT("xy",3) AS col2,
	CONCAT(REPEAT("xy",3), SPACE(5), REVERSE("abcd")) AS col3;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	REPLACE("Tell*me*a*good*story.", "*", "--") AS col1,
	REPLACE("Tell**me**a**good**story.", "**", ".") AS col2;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	LOCATE("y", "aa xx bbb xx c xx d") AS col1,
	LOCATE("xx", "aa xx bbb xx c xx d") AS col2,
	LOCATE("x", "aa xx bbb xx c xx d") AS col3,
	LOCATE("xx", "aa xx bbb xx c xx d", 2) AS col4,
	LOCATE("xx", "aa xx bbb xx c xx d", 5) AS col5,
	LOCATE("xx", "aa xx bbb xx c xx d", 17) AS col6;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	INSERT("aaa---bbb", 4, 1, ".") AS col1,
	INSERT("aaa---bbb", 4, 2, ".") AS col2,
	INSERT("aaa---bbb", 4, 3, ".") AS col3,
    
	INSERT("aaa---bbb", 4, 1, "...") AS col4,
	INSERT("aaa---bbb", 4, 2, "...") AS col5,
	INSERT("aaa---bbb", 4, 3, "...") AS col6;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	STRCMP('text', 'text') AS col1,
	STRCMP('text1', 'text') AS col1,
	STRCMP('text', 'text1') AS col3;


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 
	SUBSTRING('abcdefghij', 3, 4) AS col1,
	SUBSTR('abcdefghij', 3) AS col2,
	SUBSTR('abcdefghij', -3) AS col3, 
	SUBSTR('abcdefghij', -5) AS col4, 
	SUBSTR('abcdefghij', -5, 2) AS col5;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Using the 'country' field, keep the first and
# last two characters and replace the rest with dashes.
#
# Exercise 2: Remove the special characters from countries.
# Make sure country's first letter is uppercase and
# the rest are lowercase.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
USE db_samples1;

DROP TABLE IF EXISTS tmp;
CREATE TABLE tmp(country VARCHAR(20));

INSERT INTO tmp VALUES ('bRa€€zil');
INSERT INTO tmp VALUES ('geR€€maNy€');
INSERT INTO tmp VALUES ('mEX€iCo');
INSERT INTO tmp VALUES ('chi€Na€');
INSERT INTO tmp VALUES ('JA€pAn€');
INSERT INTO tmp VALUES ('ca€nada€');
INSERT INTO tmp VALUES ('iN€diA€');
INSERT INTO tmp VALUES ('r€uS€Sia€');

SELECT country FROM tmp;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Solution
SELECT country,

    CONCAT(LEFT(country,2), 
		REPEAT('-', CHAR_LENGTH(country)-4), 
        RIGHT(country,2)) ex1,
        
	REPLACE(CONCAT(UPPER(LEFT(country,1)), 
		LOWER(RIGHT(country, CHAR_LENGTH(country)-1))), "€", "") as ex2
    
from tmp;
