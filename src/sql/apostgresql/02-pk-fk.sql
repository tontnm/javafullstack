/*
 * Foreign Key helps data consistent
 * - insert a photo with a user that exists - ok
 * - insert a photo with a user doesn't exist - error
 * - insert a photo with a user is NULL - ok
 * 
 * Delete Foreign Key types
 * - Restrict 
 * - No Action
 * - Cascade - Ex: forum post and comments
 * - Set NULL - Ex: useful post - ban user
 * - Set Default
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