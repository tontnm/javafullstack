# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = IF/ELSEIF/ELSE
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
#

USE world_db;

DROP PROCEDURE IF EXISTS proc21;

DELIMITER //
CREATE PROCEDURE proc21()
BEGIN
	DECLARE v_continent VARCHAR(35);
	DECLARE v_num_of_countries INT;
    
	SELECT country_continent AS continent, 
		COUNT(country_code) AS num_of_countries 
	INTO v_continent, v_num_of_countries
	FROM country
	GROUP BY country_continent
	HAVING num_of_countries > 8
	ORDER BY num_of_countries DESC;

	IF v_num_of_countries = 10 THEN
		SELECT CONCAT('Number of countries in ', 
		  v_continent, ' is ', v_num_of_countries) AS msg;
	ELSE
		SELECT 'Wrong Answer' AS msg;
	END IF;  
END //
DELIMITER ;

CALL proc21();


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2
#

DROP PROCEDURE IF EXISTS proc22;
DELIMITER //
CREATE PROCEDURE proc22(IN p_num INT)
BEGIN
	DECLARE v_range VARCHAR(20);

	IF (p_num BETWEEN 1 AND 9) THEN
		SET v_range = "range 9";
	ELSEIF (p_num BETWEEN 10 AND 69) THEN
		IF (p_num BETWEEN 10 AND 19) THEN
			SET v_range = "range 19";
		ELSEIF (p_num BETWEEN 20 AND 29) THEN
			SET v_range = "range 29";
		ELSEIF (p_num BETWEEN 30 AND 39) THEN
			SET v_range = "range 39";
		ELSE	
			SET v_range = "range 69";
		END IF;
	ELSEIF (p_num BETWEEN 70 AND 79) THEN
		SET v_range = "range 79";    
	ELSE
		SET v_range = "out of range";
	END IF;

	SELECT p_num, v_range;

END //
DELIMITER ;

CALL proc22(1); 

