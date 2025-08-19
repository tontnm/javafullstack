
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Date/Time - Exercise
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CREATE TABLE dates_practice (
	payment_id SMALLINT(3),
	date1 DATE,
	time1 TIME,
	time_stamp1 TIMESTAMP
);

# - - - - - - - - - - - - - - - - - - - -   
INSERT INTO dates_practice
	VALUES(1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 
	DATE_ADD(CURTIME(), INTERVAL 1 SECOND),
	DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 SECOND));
    
INSERT INTO dates_practice
	VALUES(2, DATE_ADD(CURDATE(), INTERVAL 2 DAY), 
	DATE_ADD(CURTIME(), INTERVAL 2 SECOND),
	DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 2 SECOND));
    
INSERT INTO dates_practice
	VALUES(3, DATE_ADD(CURDATE(), INTERVAL 3 DAY), 
	DATE_ADD(CURTIME(), INTERVAL 3 SECOND),
	DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 3 SECOND));
    
INSERT INTO dates_practice
	VALUES(4, DATE_ADD(CURDATE(), INTERVAL 4 DAY), 
	DATE_ADD(CURTIME(), INTERVAL 4 SECOND),
	DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 4 SECOND));
    

SELECT * FROM dates_practice; 

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: The following query doesn't return any row 
# because the 'time' part has been removed. 
# Write another query to return the first row?
#
SELECT * FROM dates_practice
WHERE time_stamp1="2018-09-23";
# Note: Make sure to change this date value to what's available in your table.

# solution
#
SELECT * FROM dates_practice
WHERE DATE_FORMAT(time_stamp1, '%Y-%m-%d') = "2018-09-23";	

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: The following search doesn’t work. 
# Can you fix this query?
#
SELECT * FROM dates_practice
WHERE time_stamp1="18:04:25";
# Note: Make sure to change this time value to what's available in your table.

# Solution
#
SELECT * FROM dates_practice
WHERE DATE_FORMAT(time_stamp1, '%T') = "18:04:25";
