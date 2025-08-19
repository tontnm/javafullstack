
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time Functions (7)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

SELECT  
	'2018-09-19',   
	DATE_ADD('2018-09-19', INTERVAL 1 DAY) AS dy1,
	DATE_ADD('2018-09-19', INTERVAL -1 DAY) AS dy2,
	DATE_SUB('2018-09-19', INTERVAL 1 DAY) AS dy3,
	DATE_ADD('2018-09-19', INTERVAL 1 WEEK) AS wk,
	DATE_ADD('2018-09-19', INTERVAL 1 MONTH) AS m,
	DATE_ADD('2018-09-19', INTERVAL 1 YEAR) AS yr,
	DATE_ADD('2018-09-19 17:29:59', INTERVAL 1 SECOND) AS min ;


# - - - - - - - - - - - - - - - - - - - - 
SELECT  
	DATEDIFF('2018-09-19', '2018-08-17') AS d_diff,
	TIMEDIFF('17:29:59', '16:30:00') AS t_diff,
	TIMESTAMPDIFF(DAY, '2018-08-17 16:30:00', '2018-09-19 17:29:59') AS ts_dif_d,
	TIMESTAMPDIFF(WEEK, '2018-08-17 16:30:00', '2018-09-19 17:29:59') AS ts_dif_w,
	TIMESTAMPDIFF(MONTH, '2018-08-17 16:30:00', '2018-09-19 17:29:59') AS ts_dif_m,
	TIMESTAMPDIFF(YEAR, '2018-08-17 16:30:00', '2018-09-19 17:29:59') AS ts_dif_y ;

# - - - - - - - - - - - - - - - - - - - - 
SELECT  
	TO_DAYS('2018-09-19') AS col1,
	TO_DAYS('2018-09-19') - TO_DAYS('2018-08-19') AS col2,
	TO_DAYS(CURDATE()) - TO_DAYS('2011-09-20') AS col3,
    
    	TIME_TO_SEC('00:01:02') AS col4,
	TIME_TO_SEC('16:30:00') - TIME_TO_SEC('16:29:00') AS col5;

