# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Case Statement
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1
#
DROP PROCEDURE IF EXISTS proc31;
DELIMITER //
CREATE PROCEDURE proc31(IN p_num INT)
BEGIN
	CASE p_num
	WHEN 1 THEN
		SELECT "one";
	WHEN 2 THEN
		SELECT "two";
	ELSE
		SELECT "other";
	END CASE;
END //
DELIMITER ;

CALL proc31(1);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2 
#
DROP PROCEDURE IF EXISTS proc32;
DELIMITER //
CREATE PROCEDURE proc32(IN p_num INT)
BEGIN
	CASE 
	WHEN p_num=1 THEN
		SELECT "one";
	WHEN p_num=2 THEN
		SELECT "two";
	ELSE
		SELECT "other";
	END CASE;
END //
DELIMITER ;

CALL proc32(1);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3
#
DROP PROCEDURE IF EXISTS proc33;
DELIMITER //
CREATE PROCEDURE proc33(IN p_num INT)
BEGIN
	CASE 
	WHEN p_num BETWEEN 1 AND 9 THEN
		IF p_num = 1 THEN
			SELECT '1';
		ELSEIF p_num = 2 THEN
			SELECT '2';
		ELSEIF p_num = 3 THEN
			SELECT '3';		
		ELSE 
			SELECT '4-9';
		END IF;	
	WHEN p_num BETWEEN 10 AND 20 THEN
		SELECT "10 to 20";
	ELSE
		IF p_num = 30 THEN
			SELECT '30';
		ELSEIF p_num = 31 THEN
			SELECT '31';	
		ELSE 
			SELECT 'other';	
		END IF;	
	END CASE;
END //
DELIMITER ;

CALL proc33();
