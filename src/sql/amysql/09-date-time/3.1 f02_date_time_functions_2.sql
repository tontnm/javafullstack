
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time Functions (2)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# Instead of 'CURDATE()', you can also use 'CURRENT_TIMESTAMP()'
SELECT 
	CURDATE() AS curr_d,
	YEAR(CURDATE()) AS yyyy,
	QUARTER(CURDATE()) AS qt,
	MONTH(CURDATE()) AS mon,
	MONTHNAME(CURDATE()) AS m,
	WEEK(CURDATE()) AS wk;
