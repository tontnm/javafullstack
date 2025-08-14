CREATE TABLE cities (
	name varchar(50),
	country varchar(50),
	population integer, -- -2 billion to 2 billion
	area integer
);

INSERT INTO cities (name, country, population, area)
VALUES 
	('Delhi','India',1234567,1111),
	('HCM','Vietnam',1234567,2222),
	('Soul','Korea',1234567,3333);
	
SELECT * FROM cities;
SELECT name, population FROM cities;
SELECT name, population / area AS density FROM cities; -- +,-,*,/,@...

-- ||, lower(), upper(), concat(), length()
SELECT lower(name || ', ' || country) AS LOCATION FROM cities;
SELECT upper(concat(name,', ',country)) AS LOCATION FROM cities;
SELECT length(name) AS len FROM cities;

-- filtering rows with WHERE (order: FROM -> WHERE -> SELECT)
SELECT name, area FROM cities WHERE area > 2000;
-- get all cities -> filter -> delete unselect columns -> show columns

-- =, >, <, >=, <=, <>, !=, BETWEEN, NOT IN, IN (mấy cái này dùng cho WHERE)

-- calculations in where clauses
SELECT name, population / area AS population_density FROM cities
WHERE population / area > 6000;

UPDATE cities SET population = 39000 WHERE name = 'Tokyo';

DELETE FROM cities WHERE name = 'Tokyo';

/*
 * Common features (like authentication, comments, etc) are frequently built with conventional
 * table names and columns
 * What type of resources exist in your app? Create a separate table for each of these features
 * Features that seem to indicate a relationship or ownership between 2 types of resources
 * need to be reflected in our table design
 *
 * Database Design
 * - If that feature already exist, search on google for SQL Schema for Like or Upvote System
 * - If not exist on google, try to look at the mock up, UI, relationships
 * - user has many photos (one-many), (boat -> crew members, school -> students, company -> employees)
 * - a photo (has/belong to) a user (many-one)
 * - a photo has many comments (one-many)
 * - a comment (has/belong to) a photo (many-one)
 *
 * trong quan hệ 1-n: bên n sẽ lấy                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      foreign key
 *
 * - driver license - me (1-1) (boats-captains,company-ceo,capitol-country,student-desk,person-driver's license)
 * 
 * - (many-many) (Students-Classes,tasks-engineers,players-matches,movies-actors)
 * - primary key - foreign key
 * - user - pk - (user_id) - fk - comments - fk - (photo_id) - pk - photo
 * */

CREATE TABLE users (
	id serial PRIMARY KEY,
	name varchar(50)
);
INSERT INTO users (name) VALUES ('A'),('B'),('C'),('D');
SELECT * FROM users;

CREATE TABLE photos(
	id serial PRIMARY KEY,
	url varchar(200),
	user_id integer REFERENCES users(id)
);
INSERT INTO photos (url, user_id) VALUES 
('http://img1.jpg',4),('http://img2.jpg',4),('http://img3.jpg',1),('http://img4.jpg',2);
SELECT * FROM photos;
