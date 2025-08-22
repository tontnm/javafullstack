/* Validation 
 * User Admin -> Web Server -> DB
 * User Admin -> DB
 * 
 * insert/update -> check -> defined?, unique?, >,<,=...?
 * 
 * spread validation around between web server and database
 * Web server: (access outside info)
 * - easier to express more complex validation
 * - far easier to apply new validation rules
 * - many libraries to handle validation automatically
 * 
 * Database:
 * - validation still applied even if you connect with different client
 * - guaranteed that validation is always applied
 * - can only apply new validation rules if all existing rows satisfy it
 */
ALTER TABLE productsvalidation ALTER COLUMN price SET NOT NULL;

/* NULL Constraint 
 * because price with NULL data already exist, there are 3 ways
 * - delete all rows that exist price with NULL
 * - update all rows that exist price with NULL to 99999
 * - manually update each row
 */
CREATE TABLE productsvalidation (
	id serial PRIMARY KEY,
	name varchar(50),
	department varchar(50) NOT NULL DEFAULT '1',
	email varchar(50) NOT NULL UNIQUE,
	price integer NOT NULL DEFAULT 99999 CHECK (price > 0),
	weight integer,
	expire_date date NOT NULL DEFAULT '30 Dec 2026',
	created_at timestamp NOT NULL,
	est_delivery timestamp NOT NULL,
	UNIQUE(department,expire_date),
	CHECK (created_at < est_delivery)
);

INSERT INTO productsvalidation (name,department,weight) VALUES ('A','B',1);
UPDATE productsvalidation SET price = 99999 WHERE price IS NULL;
--! Để có thể alter được, thì phải make sure ko có giá trị null tồn tại trong bảng
ALTER TABLE productsvalidation ALTER COLUMN price SET NOT NULL;
ALTER TABLE productsvalidation ALTER COLUMN price SET DEFAULT 99999;
--! Để có thể alter được, thì phải make sure ko có giá trị trùng nhau tồn tại trong bảng
ALTER TABLE productsvalidation ADD UNIQUE (email);
ALTER TABLE DROP CONSTRAINT productsvalidation_name_key;

/* Multi-Column Uniqueness */
ALTER TABLE productsvalidation ADD UNIQUE (name,email):

--! Đối với CHECK thì chỉ sử dụng đc khi add hoặc update data thôi, còn dữ liệu cũ
--! thì xử kiểu khác
ALTER TABLE productsvalidation ADD CHECK (price > 0);

/* Check Multi-Column */
CREATE TABLE ordersvalidation (
	id serial PRIMARY KEY,
	name varchar(40) NOT NULL,
	created_at timestamp NOT NULL,
	est_delivery timestamp NOT NULL,
	CHECK (created_at < est_delivery)
);

INSERT INTO ordersvalidation (department,email,price,expire_date,created_at,est_delivery)
VALUES ('A','a',1,'12-13-2024 1:1 PM'::timestamp,'12-13-2024 1:1 PM'::timestamp,'12-14-2024 1:1 PM'::timestamp);
SELECT * FROM ordersvalidation;
INSERT INTO ordersvalidation (department,email,price,expire_date,created_at,est_delivery)
VALUES ('A','a',1,'12-13-2024 1:1 PM'::timestamp,'12-13-2024 1:1 PM'::timestamp,'12-11-2024 1:1 PM'::timestamp);

--! WHERE TO VALIDATE
/*
* Validate on Web Server
* - Check for required fields
* - Validate email format
* - Check for duplicate entries
* 
* Validate on Database
* - price > 0 (always)
* - Ensure data integrity
* - Enforce unique constraints
* - Apply default values
*/