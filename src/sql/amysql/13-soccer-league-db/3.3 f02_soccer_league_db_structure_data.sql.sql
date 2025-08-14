
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# f02_soccer_league_db_structure_data.sql
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# To run the script:
# $ mysql -u root -p < f02_soccer_league_db_structure_data.sql

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

DROP SCHEMA IF EXISTS soccer_league_db;
CREATE SCHEMA soccer_league_db;
USE soccer_league_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'countries' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS countries;
CREATE TABLE countries(
	country_id CHAR(3) PRIMARY KEY,	
	country_name VARCHAR(20) UNIQUE NOT NULL,
	country_capital VARCHAR(30),
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



# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'clubs' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS clubs;
CREATE TABLE clubs(
	club_id INT PRIMARY KEY, 
	club_name VARCHAR(30) UNIQUE NOT NULL,
	country_id CHAR(3) NOT NULL,	 

	CONSTRAINT clubs_fk1_country_id
	FOREIGN KEY (country_id)  REFERENCES countries (country_id)
);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'clubs' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO clubs VALUES(11, 'Bayern Munchen', 'DEU');
INSERT INTO clubs VALUES(12, 'Borussia Dortmund', 'DEU');
INSERT INTO clubs VALUES(21, 'Juventus', 'ITA');
INSERT INTO clubs VALUES(22, 'Napoli', 'ITA');
INSERT INTO clubs VALUES(31, 'PSG', 'FRA');
INSERT INTO clubs VALUES(32, 'Monaco', 'FRA');
INSERT INTO clubs VALUES(41, 'Barcelona', 'ESP');
INSERT INTO clubs VALUES(42, 'Real Madrid', 'ESP');
INSERT INTO clubs VALUES(51, 'Manchester City', 'GBR');
INSERT INTO clubs VALUES(52, 'Liverpool', 'GBR');
INSERT INTO clubs VALUES(61, 'Ajax', 'HOL');
INSERT INTO clubs VALUES(62, 'PSV', 'HOL');
INSERT INTO clubs VALUES(71, 'Porto', 'POR');
INSERT INTO clubs VALUES(72, 'Benfica', 'POR');
INSERT INTO clubs VALUES(81, 'Club Brugge', 'BEL');
INSERT INTO clubs VALUES(82, 'Anderlecht', 'BEL');



# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'coaches' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS coaches;
CREATE TABLE coaches(
	coach_id INT PRIMARY KEY, 
	coach_first_name VARCHAR(30) NOT NULL,
	coach_last_name VARCHAR(30) NOT NULL,
	coach_dob DATE DEFAULT NULL,
	coach_age SMALLINT DEFAULT NULL,
	coach_height SMALLINT DEFAULT NULL,	#cm
	coach_weight SMALLINT DEFAULT NULL,	#kg

	coach_nationality CHAR(3) NOT NULL, 
	club_id INT UNIQUE NOT NULL, 

	CONSTRAINT coaches_fk1_country_id
	FOREIGN KEY (coach_nationality)  REFERENCES countries (country_id),

	CONSTRAINT coaches_fk2_club_id
	FOREIGN KEY (club_id)  REFERENCES clubs (club_id)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'coaches' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#    
    
INSERT INTO coaches VALUES(11, 'Tomas', 'Cole', NULL, NULL, NULL, NULL,'DEU', 11);  
INSERT INTO coaches VALUES(12, 'Clay', 'Rodriquez', NULL, NULL, NULL, NULL,'DEU', 12);  

INSERT INTO coaches VALUES(21, 'Robert', 'Williams', NULL, NULL, NULL, NULL,'ITA', 21);  
INSERT INTO coaches VALUES(22, 'Tomas', 'Ball', NULL, NULL, NULL, NULL,'ITA', 22);  

INSERT INTO coaches VALUES(31, 'Jonathan', 'Simmons', NULL, NULL, NULL, NULL,'FRA', 31);  
INSERT INTO coaches VALUES(32, 'Leo', 'Holland', NULL, NULL, NULL, NULL,'FRA', 32);  

INSERT INTO coaches VALUES(41, 'Clark', 'Foster', NULL, NULL, NULL, NULL,'ESP', 41);  
INSERT INTO coaches VALUES(42, 'Dan', 'Morton', NULL, NULL, NULL, NULL,'ESP', 42);  

INSERT INTO coaches VALUES(51, 'Josep', 'Pierce', NULL, NULL, NULL, NULL,'GBR', 51);  
INSERT INTO coaches VALUES(52, 'Jurgen', 'Ramos', NULL, NULL, NULL, NULL,'GBR', 52);  

INSERT INTO coaches VALUES(61, 'Elbert', 'Bryan', NULL, NULL, NULL, NULL,'HOL', 61);  
INSERT INTO coaches VALUES(62, 'Wilfred', 'Gutierrez', NULL, NULL, NULL, NULL,'HOL', 62);  

INSERT INTO coaches VALUES(71, 'Sergio', 'Castillo', NULL, NULL, NULL, NULL,'POR', 71);  
INSERT INTO coaches VALUES(72, 'David', 'Duncan', NULL, NULL, NULL, NULL,'POR', 72);  

INSERT INTO coaches VALUES(81, 'Ivan', 'Bass', NULL, NULL, NULL, NULL,'BEL', 81);  
INSERT INTO coaches VALUES(82, 'Andy', 'Hart', NULL, NULL, NULL, NULL,'BEL', 82);  


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'players' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS players;
CREATE TABLE players(
	player_id INT PRIMARY KEY, 
	player_first_name VARCHAR(30) NOT NULL,
	player_last_name VARCHAR(30) NOT NULL,
	player_dob DATE DEFAULT NULL,
	player_age INT DEFAULT NULL, 
	player_position enum('Goalkeeper','Defender','Midfielder','Attacker') NOT NULL DEFAULT 'Defender', 
	player_height SMALLINT  DEFAULT NULL,	#cm
	player_weight SMALLINT  DEFAULT NULL,	#kg
	player_foot enum('Right','Left','Both') NOT NULL DEFAULT 'Right', 

	player_nationality CHAR(3), 
	club_id INT,	 

	CONSTRAINT players_fk1_country_id
	FOREIGN KEY (player_nationality)  REFERENCES countries (country_id),

	CONSTRAINT players_fk2_club_id
	FOREIGN KEY (club_id)  REFERENCES clubs (club_id)
);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'players' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
INSERT INTO players VALUES(111, 'Manuel', 'Alex', '1986-03-27', 32, 'Goalkeeper', 193, 92, 'Right', 'DEU', 11);  
INSERT INTO players VALUES(112, 'Ben', 'Muller', '1989-09-13' , 29, 'Attacker', 186, 75, 'Right', 'DEU', 11);  
INSERT INTO players VALUES(113, 'Jake', 'Robben', '1984-01-23' , 34, 'Midfielder', 180, 80, 'Left', 'HOL', 11);  
INSERT INTO players VALUES(114, 'Luis', 'Hill', '1986-01-23' , 32, 'Defender', 181, 79, 'Left', 'ESP', 11);  

INSERT INTO players VALUES(121, 'Marco', 'Ferguson', '1989-05-23', 29, 'Attacker', 180, 71, 'Right','DEU', 12);  
INSERT INTO players VALUES(122, 'Nicolas', 'Alcacer', '1993-09-21', 25, 'Midfielder', 175, 71, 'Right','ESP', 12);  
INSERT INTO players VALUES(123, 'Roger', 'Horton', '1995-09-27', 23, 'Defender', 172, 70, 'Right','ESP', 12);  
INSERT INTO players VALUES(124, 'Kerry', 'Henry', '1987-05-26', 27, 'Defender', 174, 73, 'Left','ITA', 12);  

INSERT INTO players VALUES(211, 'Ramon', 'Stevenson', '1989-05-27', 29, 'Attacker', 182, 72, 'Right', 'ITA', 21);  
INSERT INTO players VALUES(212, 'Dale', 'Hubbard', '1991-05-26', 27, 'Midfielder', 185, 72, 'Both', 'GBR', 21);  
INSERT INTO players VALUES(213, 'Benny', 'Tran', '1993-05-24', 25, 'Midfielder', 190, 76, 'Both', 'POR', 21);  
INSERT INTO players VALUES(214, 'Roger', 'Craig', '1993-04-23', 25, 'Defender', 180, 73, 'Left', 'ITA', 21);  

INSERT INTO players VALUES(221, 'Jake', 'Vargas ', '1989-05-21', 29, 'Midfielder', 179, 68, 'Right', 'ESP', 22);  
INSERT INTO players VALUES(222, 'Carlton', 'Hunter', '1993-05-27', 25, 'Attacker', 190, 76, 'Right', 'ITA', 22);  
INSERT INTO players VALUES(223, 'Tomas', 'Shaw', '1987-05-25', 27, 'Goalkeeper', 196, 90, 'Left', 'ITA', 22);  
INSERT INTO players VALUES(224, 'Gerard', 'Alvarez', '1995-09-23', 23, 'Attacker', 185, 72, 'Both', 'FRA', 22); 

INSERT INTO players VALUES(311, 'Kerry', 'Morgan', '1989-05-23', 29, 'Goalkeeper', 190, 81, 'Right', 'FRA', 31);  
INSERT INTO players VALUES(312, 'Marlon', 'Yates', '1993-05-24', 25, 'Attacker', 190, 81, 'Right', 'HOL', 31);  
INSERT INTO players VALUES(313, 'Jake', 'Newton', '1989-05-27', 25, 'Midfielder', 185, 72, 'Left', 'FRA', 31);  
INSERT INTO players VALUES(314, 'Mario', 'Hazel', '1988-04-26', 26, 'Defender', 185, 71, 'Both', 'DEU', 31);  

INSERT INTO players VALUES(321, 'Larry', 'Jackson', '1990-05-24', 24, 'Attacker', 188, 73, 'Right', 'FRA', 32);  
INSERT INTO players VALUES(322, 'Eddie', 'Summers', '1987-05-26', 27, 'Midfielder', 177, 71, 'Both', 'FRA', 32);  
INSERT INTO players VALUES(323, 'Neil', 'Shaw', '1988-04-25', 26, 'Defender', 184, 80, 'Left', 'DEU', 32);  
INSERT INTO players VALUES(324, 'Martin', 'Patrick', '1990-05-24', 28, 'Goalkeeper', 196, 80, 'Left', 'FRA', 32);  

INSERT INTO players VALUES(411, 'Marlon', 'Ward', '1991-05-27', 27, 'Defender', 181, 70, 'Left', 'ESP', 41);  
INSERT INTO players VALUES(412, 'Jake', 'Gray', '1989-05-25', 29, 'Attacker', 181, 77, 'Right', 'ESP', 41);  
INSERT INTO players VALUES(413, 'Marco', 'Parker', '1993-04-22', 25, 'Attacker', 181, 77, 'Both', 'DEU', 41);  
INSERT INTO players VALUES(414, 'Martin', 'Richards', '1995-04-24', 23, 'Goalkeeper', 192, 83, 'Left', 'DEU', 41);  

INSERT INTO players VALUES(421, 'Walter', 'Parks', '1990-04-21', 28, 'Goalkeeper', 192, 90, 'Right', 'FRA', 42);  
INSERT INTO players VALUES(422, 'Trevor', 'Jensen', '1992-03-23', 26, 'Attacker', 181, 81, 'Right', 'ESP', 42);  
INSERT INTO players VALUES(423, 'Martin', 'Hines', '1992-02-21', 26, 'Defender', 182, 80, 'Right', 'ESP', 42);  
INSERT INTO players VALUES(424, 'Scott', 'Ford', '1993-02-21', 25, 'Midfielder', 183, 79, 'Right', 'ESP', 42);  

INSERT INTO players VALUES(511, 'Kerry', 'Hubbard', '1989-03-21', 29, 'Attacker', 178, 69, 'Both', 'GBR', 51);  
INSERT INTO players VALUES(512, 'Justin', 'Estrada', '1992-02-21', 26, 'Defender', 177, 70, 'Both', 'ESP', 51);  
INSERT INTO players VALUES(513, 'Brent', 'Lowe', '1993-04-22', 25, 'Goalkeeper', 195, 80, 'Both', 'DEU', 51);  
INSERT INTO players VALUES(514, 'Santos', 'Cohen', '1990-04-21', 28, 'Midfielder', 181, 77, 'Both', 'HOL', 51);  

INSERT INTO players VALUES(521, 'Guy', 'Patrick', '1990-05-24', 24, 'Goalkeeper', 190, 78, 'Right', 'GBR', 52);  
INSERT INTO players VALUES(522, 'Jacob', 'Anderson', '1993-04-22', 25, 'Midfielder', 190, 78, 'Right', 'FRA', 52);  
INSERT INTO players VALUES(523, 'Clifford', 'Wade', '1993-02-21', 25, 'Defender', 181, 81, 'Left', 'GBR', 52);  
INSERT INTO players VALUES(524, 'Marcos', 'Craig', '1989-05-23', 29, 'Attacker', 182, 77, 'Left', 'DEU', 52);  

INSERT INTO players VALUES(611, 'Alan', 'Lane', '1990-05-24', 24, 'Attacker', 182, 79, 'Left', 'HOL', 61);  
INSERT INTO players VALUES(612, 'Van', 'Dean', '1990-02-22', 24, 'Midfielder', 183, 83, 'Left', 'HOL', 61); 
INSERT INTO players VALUES(613, 'Marshall', 'Tate', '1990-04-21', 28, 'Attacker', 178, 74, 'Left', 'HOL', 61);  
INSERT INTO players VALUES(614, 'Clark', 'Diaz', '1987-05-26', 27, 'Goalkeeper', 182, 75, 'Left', 'HOL', 61);  

INSERT INTO players VALUES(621, 'Arnold', 'Douglas', '1993-04-22', 25, 'Goalkeeper', 190, 82, 'Right', 'DEU', 62);  
INSERT INTO players VALUES(622, 'Jose', 'Wagner', '1991-05-26', 27, 'Attacker', 180, 71, 'Right', 'HOL', 62);  
INSERT INTO players VALUES(623, 'Floyd', 'Hines', '1993-04-23', 25, 'Midfielder', 185, 73, 'Right', 'HOL', 62);  
INSERT INTO players VALUES(624, 'Scott', 'Craig', '1996-04-23', 22, 'Midfielder', 172, 65, 'Right', 'HOL', 62);  

INSERT INTO players VALUES(711, 'Harry', 'Matthews', '1987-05-26', 27, 'Attacker', 180, 78, 'Right', 'ESP', 71);  
INSERT INTO players VALUES(712, 'Justin', 'Ford', '1996-04-21', 22, 'Midfielder', 173, 64, 'Right', 'POR', 71);  
INSERT INTO players VALUES(713, 'Gustavo', 'Ingram', '1989-05-23', 29, 'Goalkeeper', 190, 80, 'Left', 'POR', 71);  
INSERT INTO players VALUES(714, 'Alfonso', 'Spencer ', '1989-05-23', 29, 'Defender', 179, 70, 'Left', 'POR', 71);  

INSERT INTO players VALUES(721, 'Noel', 'Gonzales', '1991-05-26', 27, 'Attacker', 185, 78, 'Left', 'POR', 72);  
INSERT INTO players VALUES(722, 'Jake', 'Schwartz', '1989-05-23', 29, 'Attacker', 182, 79, 'Right', 'POR', 72);  
INSERT INTO players VALUES(723, 'Willis', 'Bryant', '1993-04-21', 25, 'Attacker', 178, 70, 'Right', 'ESP', 72);  
INSERT INTO players VALUES(724, 'Aaron', 'Douglas', '1990-06-24', 24, 'Attacker', 176, 70, 'Left', 'HOL', 72);  

INSERT INTO players VALUES(811, 'Wayne', 'Bryant', '1991-05-26', 27, 'Attacker', 185, 78, 'Left', 'BEL', 81);  
INSERT INTO players VALUES(812, 'Andy', 'Blair', '1989-05-23', 29, 'Attacker', 182, 79, 'Right', 'BEL', 81);  
INSERT INTO players VALUES(813, 'Alberto', 'Dixon', '1993-04-21', 25, 'Attacker', 178, 70, 'Right', 'POR', 81);  
INSERT INTO players VALUES(814, 'Aaron', 'Douglas', '1990-06-24', 24, 'Attacker', 176, 70, 'Left', 'BEL', 81);  

INSERT INTO players VALUES(821, 'Edgar', 'Cruz', '1991-05-26', 27, 'Attacker', 185, 78, 'Left', 'HOL', 82);  
INSERT INTO players VALUES(822, 'Bruce', 'Hamilton', '1989-05-23', 29, 'Attacker', 182, 79, 'Right', 'BEL', 82);  
INSERT INTO players VALUES(823, 'Edmund', 'Neal', '1993-04-21', 25, 'Attacker', 178, 70, 'Right', 'BEL', 82);  
INSERT INTO players VALUES(824, 'Nicolas', 'Leonard', '1990-06-24', 24, 'Attacker', 176, 70, 'Left', 'BEL', 82);  


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'games' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS games;
CREATE TABLE games(
	club1_id INT NOT NULL, 
	club2_id INT NOT NULL,	 

	club1_score SMALLINT NOT NULL,
	club2_score SMALLINT NOT NULL,
	club1_points SMALLINT NOT NULL,
	club2_points SMALLINT NOT NULL,


	CONSTRAINT games_pk_club_ids
	PRIMARY KEY (club1_id, club2_id),
    
	CONSTRAINT games_fk1_club_id
	FOREIGN KEY (club1_id)  REFERENCES clubs (club_id),

	CONSTRAINT games_fk2_club_id
	FOREIGN KEY (club2_id)  REFERENCES clubs (club_id)
);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'games' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#

INSERT INTO games VALUES(41, 11, 2, 1, 3, 0);   
INSERT INTO games VALUES(41, 32, 3, 1, 3, 0);  
INSERT INTO games VALUES(41, 81, 4, 1, 3, 0);  
INSERT INTO games VALUES(11, 32, 2, 1, 3, 0);  
INSERT INTO games VALUES(11, 81, 3, 2, 3, 0);  
INSERT INTO games VALUES(32, 81, 3, 2, 3, 0);  

INSERT INTO games VALUES(42, 22, 2, 1, 3, 0);  
INSERT INTO games VALUES(42, 12, 3, 3, 1, 1);  
INSERT INTO games VALUES(42, 61, 3, 2, 3, 0);   
INSERT INTO games VALUES(22, 12, 4, 4, 1, 1);  
INSERT INTO games VALUES(22, 61, 3, 3, 1, 1);  
INSERT INTO games VALUES(12, 61, 3, 3, 1, 1);  

INSERT INTO games VALUES(51, 31, 4, 4, 1, 1);  
INSERT INTO games VALUES(51, 82, 3, 0, 3, 0);  
INSERT INTO games VALUES(51, 72, 4, 1, 3, 0);  
INSERT INTO games VALUES(31, 82, 4, 1, 3, 0);  
INSERT INTO games VALUES(31, 72, 2, 0, 3, 0);  
INSERT INTO games VALUES(82, 72, 3, 3, 1, 1);  

INSERT INTO games VALUES(21, 52, 2, 2, 1, 1);  
INSERT INTO games VALUES(21, 62, 2, 1, 3, 0);  
INSERT INTO games VALUES(21, 71, 3, 0, 3, 0);  
INSERT INTO games VALUES(52, 62, 2, 1, 3, 0);  
INSERT INTO games VALUES(52, 71, 2, 0, 3, 0);  
INSERT INTO games VALUES(62, 71, 1, 1, 1, 1);  



