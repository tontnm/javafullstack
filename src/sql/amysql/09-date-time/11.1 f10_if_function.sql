
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = IF() Function
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE world_1;

SELECT id, country_name, continent FROM country
WHERE country_name IN ('Spain', 'Canada', 'France');

SELECT id, country_name, continent, 
	IF(country_name='Spain', 
	    REVERSE(country_name), 
	    LOWER(country_name)) AS cc
FROM country
WHERE country_name IN ('Spain', 'Canada', 'France');
