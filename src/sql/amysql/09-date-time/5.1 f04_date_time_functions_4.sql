
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time Functions (4)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

SELECT 
	NOW() AS curr_d,
	EXTRACT(HOUR FROM NOW()) AS hh,
	EXTRACT(MINUTE FROM NOW()) AS mm,
	EXTRACT(SECOND FROM NOW()) AS ss,
    
	EXTRACT(HOUR_MINUTE FROM NOW()) AS hh_mm,
	EXTRACT(MINUTE_SECOND FROM NOW()) AS mm_ss,
	EXTRACT(HOUR_SECOND FROM NOW()) AS hh_ss;

# - - - - - - - - - - - - - - - - - - - - 
SELECT 
	NOW() AS curr_d,
	EXTRACT(YEAR FROM NOW()) AS yyyy,
	EXTRACT(MONTH FROM NOW()) AS m,
	EXTRACT(DAY FROM NOW()) AS dd,

	EXTRACT(YEAR_MONTH FROM NOW()) AS yy_mm,
    
	EXTRACT(DAY_HOUR FROM NOW()) AS dd_hh,
	EXTRACT(DAY_MINUTE FROM NOW()) AS dd_mm,
	EXTRACT(DAY_SECOND FROM NOW()) AS dd_mm;

