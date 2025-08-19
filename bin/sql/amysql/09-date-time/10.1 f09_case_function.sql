
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = CASE() Function
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
SELECT payment_id,
	CASE payment_id
		WHEN 1 THEN 'one'
		WHEN 2 THEN 'two'
		WHEN 3 THEN 'three'
		ELSE 'unknown'
	END AS pay_case
FROM dates_practice;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Add a CASE function to the following query.
# SELECT * FROM dates_practice
# WHERE DATE_FORMAT(time_stamp1, '%T') = "13:31:39";

SELECT payment_id, time_stamp1,
	CASE DATE_FORMAT(time_stamp1, '%T')
		WHEN "13:31:39" THEN '39'
		WHEN "13:31:40" THEN '40'
		WHEN "13:31:41" THEN '41'
		ELSE 'unknown'
	END AS time_case
FROM dates_practice;

