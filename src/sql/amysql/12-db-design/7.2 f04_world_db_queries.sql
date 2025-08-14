# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = s12_f04_world_db_queries.txt
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE world_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
SELECT * FROM language;
SELECT * FROM country;
SELECT * FROM city;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1 - Find language descriptions ending with 'sh'. 
#
SELECT * FROM language
WHERE language_desc LIKE '%sh';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2 - Find language descriptions ending with 'sh',
# and then change the 'sh' with 'SCH'.
#
SELECT language_code, language_desc,  
	CONCAT( SUBSTR(language_desc, 1, length(language_desc)-2), 'SCH') AS newDesc
FROM language
WHERE language_desc LIKE '%sh';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 3 - Display data from the 'country' table,
# ordered by 'country_population', descending.
#
SELECT * FROM country
ORDER BY country_population DESC;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 4 - Create a view to display total population 
# of each continent sorted by population, descending.
#
CREATE OR REPLACE VIEW world_v04 AS
SELECT country_continent AS continent,
	SUM(country_population) AS total_pop
FROM country
GROUP BY country_continent
ORDER BY total_pop DESC;

SELECT continent, total_pop
FROM world_v04;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 5 - Create a view to display the total number 
# of countries in each continent sorted (descending) by 
# number of countries.
#
CREATE OR REPLACE VIEW world_v05 AS
SELECT country_continent AS continent, 
	COUNT(country_code) AS num_of_countries 
FROM country
GROUP BY country_continent
ORDER BY num_of_countries DESC;

SELECT continent, num_of_countries
FROM world_v05;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 6 - Modify the previous exercise to return only 
# those continents that have more than 6 countries.
#
CREATE OR REPLACE VIEW world_v06 AS
SELECT country_continent AS continent, 
	COUNT(country_code) AS num_of_countries 
FROM country
GROUP BY country_continent
HAVING num_of_countries>6
ORDER BY num_of_countries DESC;

SELECT continent, num_of_countries
FROM world_v06;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 7 - create a view to display the following 
# fields from 'country' and 'city' tables: 
# country_code, country_name, city_name
#
CREATE OR REPLACE VIEW world_v07 AS
SELECT t.country_code, t.country_name, c.city_name
FROM country t JOIN city c
ON t.country_code = c.city_country_code;

SELECT * FROM world_v07;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 8 - create a view to display the following 
# fields from 'country', 'city', and 'language' tables: 
# country_code, country_name, city_name, language_desc.
#
CREATE OR REPLACE VIEW world_v08 AS
SELECT t.country_code, t.country_name, c.city_name, n.language_desc
FROM country t JOIN city c JOIN language n
ON t.country_code = c.city_country_code AND 
   c.city_language_code = n.language_code;

SELECT * FROM world_v08;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 9 - Modify the previous exercise and add a new
# column to display '*Spanish' for countries with 'Spanish' language, 
# '**English' for 'English' and '***' for anything else.
#
CREATE OR REPLACE VIEW world_v09 AS
SELECT t.country_code, t.country_name, c.city_name, n.language_desc,
	CASE n.language_desc
		WHEN 'Spanish' THEN '*Spanish'
		WHEN 'English' THEN '**English'
		ELSE '***'
	END AS new_lang

FROM country t JOIN city c JOIN language n
ON t.country_code = c.city_country_code AND 
   c.city_language_code = n.language_code;

SELECT * FROM world_v09;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 10 - Use subqueries to display those countries 
# that their population is greater than population of 
# Germany, USA, and Brazil.
#
SELECT * FROM country
WHERE country_population > ALL (
	SELECT country_population FROM country
	WHERE country_code IN ('DEU', 'USA', 'BRA' )
); 


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 11 - Use subqueries to display those countries 
# that their population is greater than population of 
# Germany, USA, or Brazil.
#
SELECT * FROM country
WHERE country_population > ANY (
	SELECT country_population FROM country
	WHERE country_code IN ('DEU', 'USA', 'BRA' )
); 

