# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = While Loop
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
#
DROP PROCEDURE IF EXISTS proc41;
DELIMITER //
CREATE PROCEDURE proc41()
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE total INT DEFAULT 0;
   
	WHILE i<5 DO
		SET total = total + i;
		SET i = i + 1;
	END WHILE;
	
	SELECT total;

END //
DELIMITER ;

CALL proc41();


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2
#

USE world_db;

SELECT * FROM city;

DROP PROCEDURE IF EXISTS proc42;
DELIMITER //
CREATE PROCEDURE proc42()
BEGIN    
	DECLARE i INT DEFAULT 1;
	DECLARE total INT DEFAULT 0;
	DECLARE tmp_pop INT DEFAULT 0;
    
	WHILE i<5 DO
		SELECT city_population 
		INTO tmp_pop
		FROM city
		WHERE city_id = i;

		SET total = total + tmp_pop;
		SET i = i + 1;
	END WHILE;
    
	SELECT total;
    
END //
DELIMITER ;

CALL proc42();
