
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time Functions (1)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =


SELECT 
	NOW() AS now,
	SYSDATE() AS sys_date,
	CURRENT_TIMESTAMP() AS curr_timestamp;

SELECT 
	NOW() AS now,
	CURDATE() AS curr_date,
	CURTIME() AS curr_time;
# - - - - - - - - - - - - - - - - - - - - 
SELECT 
	CURDATE() AS curr_d,
	UTC_DATE() AS utc_d,
	CURTIME() AS curr_t,
	UTC_TIME() AS utc_t;

# - - - - - - - - - - - - - - - - - - - - 
SELECT 
	CURRENT_TIMESTAMP() AS curr_td,
	UTC_TIMESTAMP() AS utc_td,
	UNIX_TIMESTAMP() AS unix_td;


