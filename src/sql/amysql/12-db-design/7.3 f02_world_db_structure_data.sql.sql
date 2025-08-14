
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# f02_world_db_structure_data.sql
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

# To run the script:
# $ mysql -u root -p < f02_world_db_structure_data.sql

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

DROP SCHEMA IF EXISTS world_db;
CREATE SCHEMA world_db;
USE world_db;


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'country_language' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP TABLE IF EXISTS language;

CREATE TABLE language (
  language_code CHAR(3) NOT NULL,
  language_desc VARCHAR(35) UNIQUE NOT NULL,

  PRIMARY KEY (language_code)
);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'country' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP TABLE IF EXISTS country;

CREATE TABLE country (
  country_code CHAR(3) NOT NULL,
  country_name VARCHAR(35) UNIQUE NOT NULL,
  country_continent enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  country_population INT NOT NULL DEFAULT '0',

  PRIMARY KEY (country_code)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'city' (Table structure)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

DROP TABLE IF EXISTS city;

CREATE TABLE city (
  city_id INT NOT NULL AUTO_INCREMENT,
  city_name VARCHAR(35) NOT NULL,
  city_country_code CHAR(3) NOT NULL,
  city_district VARCHAR(35) NOT NULL,
  city_population INT NOT NULL DEFAULT '0',
  city_language_code CHAR(3) NOT NULL,

  PRIMARY KEY (city_id),

  CONSTRAINT city_fk_1_country_code 
  FOREIGN KEY (city_country_code)  REFERENCES country  (country_code),

  CONSTRAINT city_fk_2_lang_code    
  FOREIGN KEY (city_language_code) REFERENCES language (language_code)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'country_language' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO language VALUES ('ENG','English');
INSERT INTO language VALUES ('GER','German');
INSERT INTO language VALUES ('ESP','Spanish');
INSERT INTO language VALUES ('FRE','French');
INSERT INTO language VALUES ('ITA','Italian');
INSERT INTO language VALUES ('CAT','Catalan');
INSERT INTO language VALUES ('ARB','Arabic');
INSERT INTO language VALUES ('ARM','Armenian');
INSERT INTO language VALUES ('KUR','Kurdish');
INSERT INTO language VALUES ('TUR','Turkish');
INSERT INTO language VALUES ('POR','Portuguese');
INSERT INTO language VALUES ('GBR','Kymri');
INSERT INTO language VALUES ('IRL','Irish');
INSERT INTO language VALUES ('CRE','Creole English');
INSERT INTO language VALUES ('YUC','Yucatec');
INSERT INTO language VALUES ('ORO','Oromo');
INSERT INTO language VALUES ('AMH','Amhara');
INSERT INTO language VALUES ('KIK','Kikuyu');
INSERT INTO language VALUES ('LUH','Luhya');
INSERT INTO language VALUES ('CHN','Chinese');
INSERT INTO language VALUES ('HUI','Hui');
INSERT INTO language VALUES ('JPN','Japanese');
INSERT INTO language VALUES ('KOR','Korean');
INSERT INTO language VALUES ('DNK','Danish');
INSERT INTO language VALUES ('SWE','Swedish');
INSERT INTO language VALUES ('FIN','Finnish');
INSERT INTO language VALUES ('BRB','Berberi');
INSERT INTO language VALUES ('SIN','Sinaberberi');
INSERT INTO language VALUES ('PHL','Pilipino');
INSERT INTO language VALUES ('CEB','Cebuano');
INSERT INTO language VALUES ('THA','Thai');
INSERT INTO language VALUES ('LAO','Lao');
INSERT INTO language VALUES ('HND','Hindi');
INSERT INTO language VALUES ('BNG','Bengali');
INSERT INTO language VALUES ('PER','Persian');
INSERT INTO language VALUES ('AZR','Azerbaijani');
INSERT INTO language VALUES ('AKA','Akan');
INSERT INTO language VALUES ('MOS','Mossi');
INSERT INTO language VALUES ('JOR','Joruba');
INSERT INTO language VALUES ('HAU','Hausa');
INSERT INTO language VALUES ('RUS','Russian');
INSERT INTO language VALUES ('TAT','Tatar');
INSERT INTO language VALUES ('ROM','Romanian');
INSERT INTO language VALUES ('HUN','Hungarian');

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'country' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO country VALUES ('CUB','Cuba','North America',11201000);
INSERT INTO country VALUES ('DOM','Dominican Rep','North America',8495000);
INSERT INTO country VALUES ('ESP','Spain','Europe',39441700);
INSERT INTO country VALUES ('ITA','Italy','Europe',57680000);
INSERT INTO country VALUES ('JOR','Jordan','Asia',5083000);
INSERT INTO country VALUES ('TUR','Turkey','Asia',66591000);
INSERT INTO country VALUES ('ARG','Argentina','South America',37032000);
INSERT INTO country VALUES ('BRA','Brazil','South America',170115000);
INSERT INTO country VALUES ('DEU','Germany','Europe',82164700);
INSERT INTO country VALUES ('FRA','France','Europe',59225700);
INSERT INTO country VALUES ('GBR','England','Europe',59623400);
INSERT INTO country VALUES ('IRL','Ireland','Europe',3775100);
INSERT INTO country VALUES ('CRI','Costa Rica','North America',4023000);
INSERT INTO country VALUES ('MEX','Mexico','North America',98881000);
INSERT INTO country VALUES ('ETH','Ethiopia','Africa',62565000);
INSERT INTO country VALUES ('KEN','Kenya','Africa',30080000);
INSERT INTO country VALUES ('CHN','China','Asia',1277558000);
INSERT INTO country VALUES ('JPN','Japan','Asia',126714000);
INSERT INTO country VALUES ('DNK','Denmark','Europe',5330000);
INSERT INTO country VALUES ('SWE','Sweden','Europe',8861400);
INSERT INTO country VALUES ('CAN','Canada','North America',31147000);
INSERT INTO country VALUES ('USA','USA','North America',278357000);
INSERT INTO country VALUES ('DZA','Algeria','Africa',31471000);
INSERT INTO country VALUES ('EGY','Egypt','Africa',68470000);
INSERT INTO country VALUES ('PHL','Philippines','Asia',75967000);
INSERT INTO country VALUES ('THA','Thailand','Asia',61399000);
INSERT INTO country VALUES ('IND','India','Asia',1013662000);
INSERT INTO country VALUES ('IRN','Iran','Asia',67702000);
INSERT INTO country VALUES ('GHA','Ghana','Africa',20212000);
INSERT INTO country VALUES ('NGA','Nigeria','Africa',111506000);
INSERT INTO country VALUES ('RUS','Russia','Europe',146934000);
INSERT INTO country VALUES ('ROM','Romania','Europe',22455500);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = 'city' (Data)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('La Habana','CUB','La Habana',2256000,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Santa Clara','CUB','Villa Clara',207350,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Santo Domingo','DOM','Distrito Nacional',1609966,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('La Romana','DOM','La Romana',140204,'FRE');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Madrid','ESP','Madrid',2879052,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Barcelona','ESP','Katalonia',1503451,'CAT');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Roma','ITA','Latium',2643581,'ITA');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Milano','ITA','Lombardia',1300977,'ITA');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Amman','JOR','Amman',1000000,'ARB');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Ankara','TUR','Ankara',3038159,'TUR');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Istanbul','TUR','Istanbul',8787958,'TUR');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Buenos Aires','ARG','Distrito Federal',2982146,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Rosario','ARG','Santa Fe',907718,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Brasilia','BRA','Distrito Federal',1969868,'POR');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Sao Paulo','BRA','Sao Paulo',9968485,'POR');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Berlin','DEU','Berliini',3386667,'GER');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Munich','DEU','Baijeri',1194560,'GER');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Paris','FRA','Ile-de-France',2125246,'FRE');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Marseille','FRA','Provence-Alpes-Cote',798430,'FRE');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('London','GBR','England',7285000,'ENG');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Liverpool','GBR','England',461000,'ENG');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Dublin','IRL','Leinster',481854,'ENG');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Cork','IRL','Munster',127187,'IRL');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('San Jose','CRI','San Jose',339131,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Mexico','MEX','Distrito Federal',8591309,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Guadalajara','MEX','Jalisco',1647720,'ESP');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Addis Abeba','ETH','Addis Abeba',2495000,'ORO');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Dire Dawa','ETH','Dire Dawa',164851,'AMH');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Nairobi','KEN','Nairobi',2290000,'KIK');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Mombasa','KEN','Coast',461753,'LUH');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Shanghai','CHN','Shanghai',9696300,'CHN');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Peking','CHN','Peking',7472000,'CHN');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Tokyo','JPN','Tokyo-to',7980230,'JPN');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Yokohama','JPN','Kanagawa',3339594,'JPN');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Copenhagen','DNK','Copenhagen',495699,'DNK');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Arhus','DNK','Arhus',284846,'DNK');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Stockholm','SWE','Lisboa',750348,'SWE');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Malmo','SWE','Skane lan',259579,'SWE');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Ottawa','CAN','Ontario',335277,'ENG');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Toronto','CAN','Ontario',688275,'ENG');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('New York','USA','New York',8008278,'ENG');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Los Angeles','USA','California',3694820,'ENG');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Alger','DZA','Alger',2168000,'ARB');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Oran','DZA','Oran',609823,'ARB');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Cairo','EGY','Kairo',6789479,'ARB');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Alexandria','EGY','Aleksandria',3328196,'ARB');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Manila','PHL','National Capital Reg',1581082,'PHL');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Quezon','PHL','National Capital Reg',2173831,'CEB');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Bangkok','THA','Bangkok',6320174,'THA');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Nonthaburi','THA','Nonthaburi',292100,'LAO');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('New Delhi','IND','Delhi',301297,'HND');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Mumbai','IND','Maharashtra',10500000,'HND');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Teheran','IRN','Teheran',6758845,'PER');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Esfahan','IRN','Esfahan',1266072,'PER');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Accra','GHA','Greater Accra',1070000,'AKA');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Kumasi','GHA','Ashanti',385192,'MOS');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Abuja','NGA','Federal Capital Dist',350100,'JOR');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Ibadan','NGA','Oyo & Osun',1432000,'HAU');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Moscow','RUS','Moscow',8389200,'RUS');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('St Petersburg','RUS','Pietari',4694000,'RUS');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Bucuresti','ROM','Bukarest',2016131,'ROM');
INSERT INTO city (city_name,city_country_code,city_district,city_population,city_language_code) VALUES ('Iasi','ROM','Iasi',348070,'HUN');



