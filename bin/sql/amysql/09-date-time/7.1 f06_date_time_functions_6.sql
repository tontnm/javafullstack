
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time Functions (6)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

SELECT   
	DATE_FORMAT(CURDATE(), '%d/%m/%y') AS d1,
	DATE_FORMAT(CURDATE(), '%d-%m-%y') AS d2,
	DATE_FORMAT(CURDATE(), '%W, %M %D, %Y') AS d3,	
	DATE_FORMAT(CURDATE(), '%e-%b-%y') AS d4,
	TIME_FORMAT(CURTIME(), '%r') AS t1,
	TIME_FORMAT(CURTIME(), '%l:%i %p') AS t2;
