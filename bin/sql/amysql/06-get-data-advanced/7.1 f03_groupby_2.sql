
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = GROUP BY (2)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# If the 'world_1' database doesn't exist, run the 'world_1.sql' script.
#
USE world_1;
SELECT database();

SELECT * FROM country;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Using the 'world_1.country' table, display 
# distinct continents, as well as number of countries 
# in each of those continents.

SELECT c.continent,
	COUNT(c.continent) AS num_of_countries
FROM country c
GROUP BY c.continent;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: Modify the previous exercise to display only those
# continents that contain more than 2 countries.
# Also sort the result-set based on the num_of_countries, descending.
#

SELECT c.continent,
	COUNT(c.continent) AS num_of_countries
FROM country c
GROUP BY c.continent
HAVING num_of_countries > 2
ORDER BY num_of_countries DESC;

