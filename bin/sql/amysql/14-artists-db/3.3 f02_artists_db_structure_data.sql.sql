
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = f02_artists_db_structure_data.sql
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# To run the script:
# $ mysql -u root -p < f02_artists_db_structure_data.sql

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP SCHEMA IF EXISTS artists_db;
CREATE SCHEMA artists_db;
USE artists_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'countries' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
# DROP TABLE IF EXISTS countries;
CREATE TABLE countries(
	country_id CHAR(3) PRIMARY KEY,
	country_name VARCHAR(30) UNIQUE NOT NULL,
	country_capital VARCHAR(30) DEFAULT NULL,
	country_population INT DEFAULT NULL
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'countries' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO countries VALUES('DEU', 'Germany', 'Munich', 82164700);
INSERT INTO countries VALUES('ITA', 'Italy', 'Rome', 57680000);
INSERT INTO countries VALUES('FRA', 'France', 'Paris', 59225700);
INSERT INTO countries VALUES('ESP', 'Spain', 'Madrid', 39441700);
INSERT INTO countries VALUES('GBR', 'England', 'London', 59623400);
INSERT INTO countries VALUES('HOL', 'Netherlands', 'Amsterdam', 17098594);
INSERT INTO countries VALUES('POR', 'Portugal', 'Lisbon', 10279874);
INSERT INTO countries VALUES('BEL', 'Belgium', 'Brussels', 11518531);
INSERT INTO countries VALUES('ARG','Argentina','Buenos Aires',37032000);
INSERT INTO countries VALUES('BRA','Brazil','Brasilia',170115000);
INSERT INTO countries VALUES('MEX','Mexico','Mexico City',98881000);
INSERT INTO countries VALUES('CHN','China','Beijing',1277558000);
INSERT INTO countries VALUES('JPN','Japan','Tokyo',126714000);
INSERT INTO countries VALUES('SWE','Sweden','Stockholm',8861400);
INSERT INTO countries VALUES('CAN','Canada','Ottawa',31147000);
INSERT INTO countries VALUES('USA','USA','Washington',278357000);
INSERT INTO countries VALUES('EGY','Egypt','Cairo',68470000);
INSERT INTO countries VALUES('IND','India','New Delhi',1013662000);
INSERT INTO countries VALUES('RUS','Russia','Moscow',146934000);
INSERT INTO countries VALUES('IRL','Ireland','Dublin',4815848);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'arts' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# DROP TABLE IF EXISTS arts;
CREATE TABLE arts(
	art_id INT PRIMARY KEY,	
    	art_desc VARCHAR(30) UNIQUE  NOT NULL
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'arts' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO arts VALUES(1, 'Acting');
INSERT INTO arts VALUES(2, 'Singing');
INSERT INTO arts VALUES(3, 'Dancing');
INSERT INTO arts VALUES(4, 'Painting');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'styles' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# DROP TABLE IF EXISTS styles;
CREATE TABLE styles(
	style_id INT PRIMARY KEY,
	style_desc VARCHAR(30) NOT NULL,   
	art_id INT NOT NULL, 
    
	CONSTRAINT styles_fk1_art_id
    	FOREIGN KEY (art_id) REFERENCES arts(art_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'styles' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO styles VALUES (101, 'Drama', 1);
INSERT INTO styles VALUES (102, 'Action', 1);
INSERT INTO styles VALUES (103, 'Comedy', 1);
INSERT INTO styles VALUES (104, 'Romance', 1);
INSERT INTO styles VALUES (105, 'Animation', 1);
INSERT INTO styles VALUES (106, 'Thriller', 1);
INSERT INTO styles VALUES (107, 'Mystery', 1);
INSERT INTO styles VALUES (108, 'Documantrary', 1);
INSERT INTO styles VALUES (109, 'Science Fiction', 1);
INSERT INTO styles VALUES (110, 'Sports', 1);

INSERT INTO styles VALUES (201, 'Pop', 2);
INSERT INTO styles VALUES (202, 'Rock', 2);
INSERT INTO styles VALUES (203, 'Classic', 2);
INSERT INTO styles VALUES (204, 'Hip hop', 2);
INSERT INTO styles VALUES (205, 'Classic', 2);
INSERT INTO styles VALUES (206, 'Country', 2);
INSERT INTO styles VALUES (207, 'Jazz', 2);
INSERT INTO styles VALUES (208, 'R&B', 2);
INSERT INTO styles VALUES (209, 'Blues', 2);
INSERT INTO styles VALUES (210, 'Soul', 2);

INSERT INTO styles VALUES (301, 'Contemporary', 3);
INSERT INTO styles VALUES (302, 'Hip-Hop', 3);
INSERT INTO styles VALUES (303, 'Tap', 3);
INSERT INTO styles VALUES (304, 'Ballet', 3);
INSERT INTO styles VALUES (305, 'Jazz', 3);
INSERT INTO styles VALUES (306, 'Swing', 3);
INSERT INTO styles VALUES (307, 'Salsa', 3);
INSERT INTO styles VALUES (308, 'Tango', 3);
INSERT INTO styles VALUES (309, 'Waltz', 3);
INSERT INTO styles VALUES (310, 'Foxtrot', 3);

INSERT INTO styles VALUES (401, 'Abstract', 4);
INSERT INTO styles VALUES (402, 'Realism', 4);
INSERT INTO styles VALUES (403, 'Modernism', 4);
INSERT INTO styles VALUES (404, 'Impressionism', 4);
INSERT INTO styles VALUES (405, 'Expressionism', 4);
INSERT INTO styles VALUES (406, 'Cubism', 4);
INSERT INTO styles VALUES (407, 'Surrealism', 4);
INSERT INTO styles VALUES (408, 'Figurative', 4);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'movies' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# DROP TABLE IF EXISTS movies;
CREATE TABLE movies(
	movie_id INT PRIMARY KEY,  
    	movie_name VARCHAR(40) NOT NULL,
    	release_date DATE DEFAULT NULL,
    	box_office DECIMAL(7,2) DEFAULT NULL, #in millions
    	director_name VARCHAR(35) DEFAULT NULL
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'movies' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

INSERT INTO movies VALUES(1, 'Philadelphia', '1993-12-22', 206.7, 'Jonathan Demme');  
INSERT INTO movies VALUES(2, 'Forrest Gump', '1994-06-23', 677.9, 'Robert Zemeckis');  
INSERT INTO movies VALUES(3, 'My Left Foot', '1989-02-24', 14.7, 'Jim Sheridan');  
INSERT INTO movies VALUES(4, 'There Will Be Blood', '2007-09-27', 76.2, 'Paul Thomas Anderson');  
INSERT INTO movies VALUES(5, 'Lincoln', '2012-10-08', 275.3, 'Steven Spielberg');  
INSERT INTO movies VALUES(6, "Sophie's Choice", '1982-12-08', 30, 'Alan J. Pakula');  
INSERT INTO movies VALUES(7, 'The Iron Lady', '2011-12-26', 8.2, 'Phyllida Lloyd');  
INSERT INTO movies VALUES(8, "One Flew Over the Cuckoo's Nest", '1975-11-19', 109, 'Milos Forman');  
INSERT INTO movies VALUES(9, 'As Good as It Gets', '1997-12-23', '50', 'James L. Brooks');  
INSERT INTO movies VALUES(10, 'The Lion in Winter', '1968-10-30', 22.3, 'Anthony Harvey');  
INSERT INTO movies VALUES(11, 'On Golden Pond', '1981-12-04', 119.3, 'Mark Rydell');  
INSERT INTO movies VALUES(12, 'On the Waterfront', '1954-07-28', 9.6, 'Elia Kazan');  
INSERT INTO movies VALUES(13, 'The Godfather', '1972-03-15', 6.2, 'Francis Ford Coppola');  

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'artists' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# DROP TABLE IF EXISTS artists;
CREATE TABLE artists(
	artist_id INT PRIMARY KEY, 		
	artist_first_name VARCHAR(35) NOT NULL,  
	artist_last_name VARCHAR(35) NOT NULL,
	artist_nationality_id CHAR(3) NOT NULL,
    
    	CONSTRAINT artists_fk1_nationality_id 
    	FOREIGN KEY (artist_nationality_id) REFERENCES countries(country_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'artists' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO artists VALUES(1, 'Tom', 'Hanks', 'USA'); 
INSERT INTO artists VALUES(2, 'Daniel', 'Day-Lewis', 'IRL');  
INSERT INTO artists VALUES(3, 'Meryl', 'Streep', 'USA');  
INSERT INTO artists VALUES(4, 'Jack', 'Nicholson', 'USA');  
INSERT INTO artists VALUES(5, 'Katharine', 'Hepburn', 'USA');  
INSERT INTO artists VALUES(6, 'Marlon', 'Brando', 'USA');  
INSERT INTO artists VALUES(7, 'Denzel', 'Washington', 'USA');  
INSERT INTO artists VALUES(8, 'Robin', 'Wright', 'USA');  
INSERT INTO artists VALUES(9, 'Ray', 'McAnally', 'IRL');  
INSERT INTO artists VALUES(10, 'Paul', 'Dano', 'USA');  
INSERT INTO artists VALUES(11, 'Sally', 'Field', 'USA');  
INSERT INTO artists VALUES(12, 'Kevin', 'Kline', 'USA');  
INSERT INTO artists VALUES(13, 'Jim', 'Broadbent', 'GBR');  
INSERT INTO artists VALUES(14, 'Louise', 'Fletcher', 'USA');  
INSERT INTO artists VALUES(15, 'Helen', 'Hunt', 'USA');  
INSERT INTO artists VALUES(16, 'Peter', "O'Toole", 'GBR');  
INSERT INTO artists VALUES(17, 'Henry', 'Fonda', 'USA');  
INSERT INTO artists VALUES(18, 'Karl', 'Malden', 'USA');  
INSERT INTO artists VALUES(19, 'Al', 'Pacino', 'USA');  
INSERT INTO artists VALUES(20, 'Robert', 'De Niro', 'USA');  
INSERT INTO artists VALUES(21, 'Leonardo', 'DiCaprio', 'USA');  
INSERT INTO artists VALUES(22, 'Dustin', 'Hoffman', 'USA');  
INSERT INTO artists VALUES(23, 'Ingrid', 'Bergman', 'SWE');   
INSERT INTO artists VALUES(24, 'Bette', 'Davis', 'USA');  

INSERT INTO artists VALUES(40, 'Freddie', 'Mercury', 'GBR');   
INSERT INTO artists VALUES(41, 'Elvis', 'Presley', 'USA');  
INSERT INTO artists VALUES(42, 'Aretha', 'Franklin', 'USA');  
INSERT INTO artists VALUES(43, 'Michael', 'Jackson', 'USA');  
INSERT INTO artists VALUES(44, 'Paul', 'McCartney', 'GBR');  
INSERT INTO artists VALUES(45, 'Janis', 'Joplin', 'USA');  
INSERT INTO artists VALUES(46, 'Tina', 'Turner', 'USA');  
INSERT INTO artists VALUES(47, 'Johnny', 'Cash', 'USA');  

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'albums' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# DROP TABLE IF EXISTS albums;
CREATE TABLE albums(
	album_id INT PRIMARY KEY,
    	album_name VARCHAR(40) NOT NULL,
    	release_date DATE DEFAULT NULL,
    	artist_id INT NOT NULL,  
    
	CONSTRAINT albums_fk1_artist_id  
    	FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'albums' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

INSERT INTO albums VALUES(1, 'Mr. Bad Guy', '1985-04-29', 40); 
INSERT INTO albums VALUES(2, 'Barcelona', '1988-10-10', 40); 
INSERT INTO albums VALUES(3, 'Elvis Christmas Album', '1957-10-15', 41);  
INSERT INTO albums VALUES(4, 'How Great Thou Art', '1967-02-27', 41);  
INSERT INTO albums VALUES(5, 'Moody Blue', '1977-07-19', 41);  
INSERT INTO albums VALUES(6, "Who's Zoomin' Who?", '1985-07-07', 42); 
INSERT INTO albums VALUES(7, 'Aretha Now', '1968-06-14', 42); 
INSERT INTO albums VALUES(8, 'Thriller', '1982-11-30', 43); 
INSERT INTO albums VALUES(9, 'Bad', '1987-08-31', 43); 
INSERT INTO albums VALUES(10, 'Dangerous', '1991-11-26', 43); 
INSERT INTO albums VALUES(11, 'Invincible', '2001-10-30', 43); 
INSERT INTO albums VALUES(12, 'Band on the Run', '1973-12-05', 44); 
INSERT INTO albums VALUES(13, 'Tug of War', '1982-04-26', 44); 
INSERT INTO albums VALUES(14, 'Janis', '1993-11-23', 45); 
INSERT INTO albums VALUES(15, '18 Essential Songs', '1995-01-24', 45); 
INSERT INTO albums VALUES(16, 'Private Dancer', '1984-05-29', 46); 
INSERT INTO albums VALUES(17, 'Break Every Rule', '1986-09-23', 46); 
INSERT INTO albums VALUES(18, 'I Walk the Line', '1964-05-04', 47); 
INSERT INTO albums VALUES(19, 'Ring of Fire', '1963-08-6', 47); 


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'artists_movies' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# DROP TABLE IF EXISTS artists_movies;
CREATE TABLE artists_movies(
	artist_id INT, 
	movie_id INT, 
    
	PRIMARY KEY (artist_id, movie_id),	 
    
    	CONSTRAINT artists_movies_fk1_artist_id			 
    	FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    
    	CONSTRAINT artists_movies_fk2_movie_id			 
    	FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'artists_movies' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

INSERT INTO artists_movies VALUES(1,1);  
INSERT INTO artists_movies VALUES(1,2);  

INSERT INTO artists_movies VALUES(2,3);  
INSERT INTO artists_movies VALUES(2,4);  
INSERT INTO artists_movies VALUES(2,5); 

INSERT INTO artists_movies VALUES(3,6);  
INSERT INTO artists_movies VALUES(3,7);  

INSERT INTO artists_movies VALUES(4,8);  
INSERT INTO artists_movies VALUES(4,9);  

INSERT INTO artists_movies VALUES(5,10);     
INSERT INTO artists_movies VALUES(5,11);  

INSERT INTO artists_movies VALUES(6,12);  
INSERT INTO artists_movies VALUES(6,13);  

INSERT INTO artists_movies VALUES(6,1);  
INSERT INTO artists_movies VALUES(8,2);  
INSERT INTO artists_movies VALUES(9,3);  
INSERT INTO artists_movies VALUES(10,4);  
INSERT INTO artists_movies VALUES(11,5);  
INSERT INTO artists_movies VALUES(12,6);  
INSERT INTO artists_movies VALUES(13,7);  
INSERT INTO artists_movies VALUES(14,8);   
INSERT INTO artists_movies VALUES(15,9);  
INSERT INTO artists_movies VALUES(16,10);  
INSERT INTO artists_movies VALUES(17,11);  
INSERT INTO artists_movies VALUES(18,12);  
INSERT INTO artists_movies VALUES(19,13);  


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'artists_styles' (Table Structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# DROP TABLE IF EXISTS artists_styles;
CREATE TABLE artists_styles(
	artist_id INT,	 
	style_id INT,	 
    
	PRIMARY KEY (artist_id, style_id),				 
    
    	CONSTRAINT artists_styles_fk1_artist_id			 
    	FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    
    	CONSTRAINT artists_styles_fk2_style_id			 
    	FOREIGN KEY (style_id) REFERENCES styles(style_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'artists_styles' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

INSERT INTO artists_styles VALUES(1, 101);  
INSERT INTO artists_styles VALUES(1, 103);  
INSERT INTO artists_styles VALUES(1, 105);  
INSERT INTO artists_styles VALUES(2, 101);  
INSERT INTO artists_styles VALUES(2, 102);  
INSERT INTO artists_styles VALUES(3, 101);  
INSERT INTO artists_styles VALUES(3, 103);  
INSERT INTO artists_styles VALUES(4, 101);  
INSERT INTO artists_styles VALUES(4, 103);  
INSERT INTO artists_styles VALUES(5, 101);  
INSERT INTO artists_styles VALUES(6, 101);  
INSERT INTO artists_styles VALUES(7, 101);  
INSERT INTO artists_styles VALUES(7, 102);  
INSERT INTO artists_styles VALUES(8, 101);  
INSERT INTO artists_styles VALUES(9, 101);  
INSERT INTO artists_styles VALUES(10, 101);  
INSERT INTO artists_styles VALUES(11, 101);  
INSERT INTO artists_styles VALUES(12, 101);  
INSERT INTO artists_styles VALUES(13, 101);  
INSERT INTO artists_styles VALUES(14, 101);  
INSERT INTO artists_styles VALUES(15, 101);  
INSERT INTO artists_styles VALUES(16, 101);  
INSERT INTO artists_styles VALUES(17, 101);  
INSERT INTO artists_styles VALUES(18, 101);  
INSERT INTO artists_styles VALUES(19, 101);  

INSERT INTO artists_styles VALUES(40, 201);  
INSERT INTO artists_styles VALUES(41, 202);  
INSERT INTO artists_styles VALUES(41, 201);  
INSERT INTO artists_styles VALUES(41, 206);  
INSERT INTO artists_styles VALUES(42, 210);  
INSERT INTO artists_styles VALUES(43, 201);  
INSERT INTO artists_styles VALUES(43, 210); 
INSERT INTO artists_styles VALUES(44, 201);  
INSERT INTO artists_styles VALUES(45, 202);  
INSERT INTO artists_styles VALUES(45, 209);  
INSERT INTO artists_styles VALUES(45, 210);  
INSERT INTO artists_styles VALUES(46, 208);  
INSERT INTO artists_styles VALUES(46, 201);  
INSERT INTO artists_styles VALUES(47, 206);  
INSERT INTO artists_styles VALUES(47, 202);  
