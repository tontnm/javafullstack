
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Cursors
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
USE world_db;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1 
# Generating the following message including the least 
# populated countries in the 'country' table:
# (Ireland:3775100) (Costa Rica:4023000) (Jordan:5083000) (Denmark:5330000) (All:18211100)
#

DROP PROCEDURE IF EXISTS proc51;
DELIMITER //
CREATE PROCEDURE proc51()
BEGIN   
	DECLARE v_name VARCHAR(30) DEFAULT '';   
	DECLARE v_pop INT DEFAULT 0;   
	DECLARE v_msg VARCHAR(100) DEFAULT '';    
	DECLARE v_total INT DEFAULT 0;

	DECLARE end_of_cursor BOOL DEFAULT FALSE;

	DECLARE cur01 CURSOR FOR
		SELECT country_name, country_population
		FROM country
		ORDER BY country_population
		LIMIT 4;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET end_of_cursor = TRUE;
    
	OPEN cur01;
    
	FETCH cur01 INTO v_name, v_pop;
	WHILE end_of_cursor=FALSE DO
		SET v_msg = CONCAT(v_msg, '(', v_name, ':', v_pop, ') '); 
		SET v_total = v_total + v_pop;

		FETCH cur01 INTO v_name, v_pop;        
	END WHILE;
    
	CLOSE cur01;
    
	SET v_msg = CONCAT(v_msg, '(All:', v_total, ')');

	SELECT v_msg;

END //
DELIMITER ;

CALL proc51();
