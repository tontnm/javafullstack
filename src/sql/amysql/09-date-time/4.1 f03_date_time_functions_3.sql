
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time Functions (3)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# Instead of 'CURDATE()', you can also use 'CURRENT_TIMESTAMP()'
SELECT 
	CURDATE() AS curr_d,
	DAY(CURDATE()) AS dd;
	DAYOFWEEK(CURDATE()) AS dw,
	DAYOFYEAR(CURDATE()) AS dy,
	DAYNAME(CURDATE()) AS dName,
	MONTHNAME(CURDATE()) AS mName,
	LAST_DAY(CURDATE()) AS lastd;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT 
	CURTIME() AS curr_t,
	HOUR(CURTIME()) AS hr,
	MINUTE(CURTIME()) AS min,
	SECOND(CURTIME()) AS sec;

