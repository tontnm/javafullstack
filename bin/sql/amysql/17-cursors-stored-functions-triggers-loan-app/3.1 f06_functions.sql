
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Functions
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
USE world_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
#

DROP FUNCTION IF EXISTS favorite_color;
CREATE FUNCTION favorite_color()
RETURNS VARCHAR(20) READS SQL DATA
RETURN ('light green');

SELECT favorite_color();

# - - - - - - - - - - - - - - - - - - - - 
DROP FUNCTION IF EXISTS get_age;
CREATE FUNCTION get_age()
RETURNS INT READS SQL DATA
RETURN (20);

SELECT get_age();

SELECT CONCAT(favorite_color(), ', ', get_age()) AS `My Info`;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2
#
DROP FUNCTION IF EXISTS max_population;

CREATE FUNCTION max_population()
RETURNS INT READS SQL DATA
RETURN (
	SELECT city_population 
    	FROM city ORDER BY city_population 
    	DESC LIMIT 1
);

SELECT max_population();

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3
#
DROP FUNCTION IF EXISTS avg_population;

CREATE FUNCTION avg_population()
RETURNS FLOAT READS SQL DATA
RETURN (SELECT AVG(city_population) FROM city);

SELECT avg_population(), max_population();

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 4
#
DROP FUNCTION IF EXISTS country_info;

DELIMITER //
CREATE FUNCTION country_info(opt CHAR(6))
RETURNS VARCHAR(25) READS SQL DATA
BEGIN
	IF opt = 'long' THEN
		RETURN (SELECT country_name FROM country LIMIT 1);
	ELSE
		RETURN (SELECT country_code FROM country LIMIT 1);
	END IF;
END //
DELIMITER ;

SELECT country_info('long'), country_info('short');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 5
#

DROP FUNCTION IF EXISTS canada_pop;
CREATE FUNCTION canada_pop()
RETURNS INT READS SQL DATA
RETURN (SELECT country_population FROM country WHERE country_code='CAN');

SELECT canada_pop(); 

# - - - - - - - - - - - - - - - - - - - - 
DROP FUNCTION IF EXISTS mexico_pop;
CREATE FUNCTION mexico_pop()
RETURNS INT READS SQL DATA
RETURN (SELECT country_population FROM country WHERE country_code='MEX');

SELECT mexico_pop();

# - - - - - - - - - - - - - - - - - - - - 
DROP FUNCTION IF EXISTS total_pop1;
CREATE FUNCTION total_pop1()
RETURNS INT READS SQL DATA
RETURN (canada_pop() + mexico_pop());

SELECT total_pop1(); 

# - - - - - - - - - - - - - - - - - - - - 
DROP PROCEDURE IF EXISTS total_pop2;
DELIMITER //
CREATE PROCEDURE total_pop2()
BEGIN   
    SELECT canada_pop() + mexico_pop() AS total_pop2;
END //
DELIMITER ;

CALL total_pop2(); 

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 6
#

DROP FUNCTION IF EXISTS get_pop;
CREATE FUNCTION get_pop(p_country VARCHAR(35) )
RETURNS INT READS SQL DATA
RETURN (SELECT country_population from country WHERE country_code=p_country);

SELECT get_pop('CAN');
SELECT get_pop('MEX');

# - - - - - - - - - - - - - - - - - - - - 
DROP PROCEDURE IF EXISTS total_pop3;
DELIMITER //
CREATE PROCEDURE total_pop3()
BEGIN   
    SELECT get_pop('CAN') + get_pop('MEX') AS total_pop3;
END //
DELIMITER ;

CALL total_pop3(); 

# - - - - - - - - - - - - - - - - - - - - 
DROP PROCEDURE IF EXISTS total_pop4;
DELIMITER //
CREATE PROCEDURE total_pop4(IN p_pop1 INT, IN p_pop2 INT)
BEGIN   
    SELECT p_pop1 + p_pop2 AS total_pop4;
END //
DELIMITER ;

CALL total_pop4(get_pop('CAN'), get_pop('MEX')); 

