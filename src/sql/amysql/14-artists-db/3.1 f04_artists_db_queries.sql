
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = s14_f02_artists_db_2_queries.txt
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE artists_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 1: Display actors and their movies, sorted by 'actor'.

CREATE OR REPLACE VIEW art_v01 AS
SELECT CONCAT(a.artist_first_name, ' ', a.artist_last_name) name,
	m.movie_name movie
FROM artists_movies am JOIN artists a JOIN movies m
ON am.artist_id=a.artist_id AND am.movie_id=m.movie_id
ORDER by name;

SELECT * FROM art_v01;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 2: Display actors and the total number of movies that the actor 
# has played in, sorted by 'number of movies' (descending), and then by 'name'.


SELECT CONCAT(a.artist_first_name, ' ', a.artist_last_name) name,
	COUNT(CONCAT(a.artist_first_name, ' ', a.artist_last_name)) num_of_movies
FROM artists_movies am JOIN artists a JOIN movies m
ON am.artist_id=a.artist_id AND am.movie_id=m.movie_id
GROUP BY name
ORDER by num_of_movies DESC, name;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 3: Display all Tom Hanks' movies.
SELECT * FROM art_v01
WHERE name = 'Tom Hanks';

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 4: Display the actors who played in the 'The God Father' movie.

SELECT m.movie_name movie,
	CONCAT(a.artist_first_name, ' ', a.artist_last_name) name
FROM artists_movies am JOIN artists a JOIN movies m
ON am.artist_id=a.artist_id AND am.movie_id=m.movie_id
WHERE m.movie_name='The Godfather'
ORDER by movie;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 5: Display all artists with their descriptive styles and arts. 

CREATE OR REPLACE VIEW art_v02 AS
SELECT CONCAT(a.artist_first_name, ' ', a.artist_last_name) name,
	s.style_desc style, t.art_desc art
FROM artists_styles ast 
	JOIN artists a 
    	JOIN styles s
    	JOIN arts t
ON ast.artist_id=a.artist_id AND 
   ast.style_id=s.style_id AND
   s.art_id = t.art_id
ORDER by name, style;

SELECT * FROM art_v02;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 6: Display all artists with more than 2 art styles.

SELECT name, COUNT(name) num_of_style 
FROM art_v02
GROUP BY name
HAVING num_of_style>2;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 7: Display singers with more than 2 art styles.

SELECT name, COUNT(name) num_of_style 
FROM art_v02
WHERE art='Singing'
GROUP BY name
HAVING num_of_style>2;
 
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 8: Display the total number of artists from each country.

SELECT a.artist_nationality_id country, 
    COUNT(a.artist_nationality_id) num_of_artists
FROM artists a
GROUP BY country
ORDER BY num_of_artists desc;

# - - - - - - - - - - - - - - - - - - - - 
# a more discriptive query
SELECT c.country_name country, 
    COUNT(a.artist_nationality_id) num_of_artists
FROM artists a join countries c
ON a.artist_nationality_id = c.country_id
GROUP BY country
ORDER BY num_of_artists desc;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Exercise 9: Display the total number of 'singers' from each country.

CREATE OR REPLACE VIEW art_v03 AS
SELECT CONCAT(a.artist_first_name, ' ', a.artist_last_name) name,
	s.style_desc style, t.art_desc art, c.country_name
FROM artists_styles ast 
	JOIN artists a 
	JOIN styles s
	JOIN arts t
	JOIN countries c
ON ast.artist_id=a.artist_id AND 
	ast.style_id=s.style_id AND
    	s.art_id = t.art_id AND
    	a.artist_nationality_id = c.country_id
ORDER by name, style;

SELECT * FROM art_v03;

# - - - - - - - - - - - - - - - - - - - - 
SELECT a.country_name country, 
    COUNT(a.country_name) num_of_artists
FROM art_v03 a
WHERE a.art='Singing'
GROUP BY country
ORDER BY num_of_artists desc;

