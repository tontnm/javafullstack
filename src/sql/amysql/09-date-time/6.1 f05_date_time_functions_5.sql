
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time Functions (5)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

SELECT     
    	DATE_FORMAT(CURDATE(), GET_FORMAT(DATE,'ISO')) AS iso_d, 
    	TIME_FORMAT(CURTIME(), GET_FORMAT(TIME,'ISO')) AS iso_t,
    	DATE_FORMAT(CURRENT_TIMESTAMP(), GET_FORMAT(DATETIME,'ISO')) AS iso_dt;
