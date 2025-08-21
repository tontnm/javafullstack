/*
 * Foreign Key helps data consistent
 * - insert a photo with a user that exists - ok
 * - insert a photo with a user doesn't exist - error
 * - insert a photo with a user is NULL - ok
 * 
 * Delete Foreign Key types
 * - On Delete Restrict -> throw an error
 * - On Delete No Action -> throw an error
 * - On Delete Cascade - Ex: forum post and comments
 * - On Delete Set NULL - Ex: useful post - ban user
 * - On Delete Set Default
 * */
CREATE TABLE photos(
	id serial PRIMARY KEY,
	url varchar(200),
	user_id integer REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE photos(
	id serial PRIMARY KEY,
	url varchar(200),
	user_id integer REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY, -- serial = auto-generated id
  username VARCHAR(50)
);

INSERT INTO users (username)
VALUES ('monahan93'),('pferrer'),('si93onis'),('99stroman');

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos (url, user_id)
VALUES
	('http://one.jpg', 4);

INSERT INTO photos (url, user_id)
VALUES
	('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

INSERT INTO photos (url, user_id)
VALUES ('http://jpg', NULL);

DROP TABLE photos;

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO photos (url, user_id)
VALUES
	('http://one.jpg', 4),
	('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

DELETE FROM users
WHERE id = 1;

DROP TABLE photos;

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO photos (url, user_id)
VALUES
  ('http:/one.jpg', 4),
  ('http:/754.jpg', 2),
  ('http:/35.jpg', 3),
  ('http:/256.jpg', 4);

DELETE FROM users
WHERE id = 4;