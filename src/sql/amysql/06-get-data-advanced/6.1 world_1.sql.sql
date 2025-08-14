
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP SCHEMA IF EXISTS world_1;
CREATE SCHEMA world_1;
USE world_1;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
DROP TABLE IF EXISTS country;

CREATE TABLE country (
  id INT(3) NOT NULL,
  country_name VARCHAR(50),
  continent VARCHAR(30),
  population INT(11)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
INSERT INTO country VALUES (1,'Spain','Europe',39441700);
INSERT INTO country VALUES (2,'Turkey','Asia',66591000);
INSERT INTO country VALUES (3,'Argentina','South America',37032000);
INSERT INTO country VALUES (4,'Brazil','South America',170115000);
INSERT INTO country VALUES (5,'Germany','Europe',82164700);
INSERT INTO country VALUES (6,'France','Europe',59225700);
INSERT INTO country VALUES (7,'United Kingdom','Europe',59623400);
INSERT INTO country VALUES (8,'Mexico','North America',98881000);
INSERT INTO country VALUES (9,'Kenya','Africa',30080000);
INSERT INTO country VALUES (10,'China','Asia',1277558000);
INSERT INTO country VALUES (11,'Japan','Asia',126714000);
INSERT INTO country VALUES (12,'Canada','North America',31147000);
INSERT INTO country VALUES (13,'United States','North America',278357000);
INSERT INTO country VALUES (14,'Egypt','Africa',68470000);
INSERT INTO country VALUES (15,'India','Asia',1013662000);
INSERT INTO country VALUES (16,'Ghana','Africa',20212000);
INSERT INTO country VALUES (17,'Russia','Europe',146934000);

