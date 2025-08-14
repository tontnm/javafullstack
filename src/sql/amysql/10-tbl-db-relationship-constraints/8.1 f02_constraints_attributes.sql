
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Attributes & Constraints
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

CREATE DATABASE IF NOT EXISTS db_samples3;
USE db_samples3;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
# Example 1 (column-level constraints)
CREATE TABLE orders1 ( 
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	order_name VARCHAR(30) NOT NULL UNIQUE,
	order_date DATE NOT NULL DEFAULT '2000-01-01'
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# Example 2 (table-level constraints)
CREATE TABLE orders2 (
	order_id INT AUTO_INCREMENT,
	order_name VARCHAR(30) NOT NULL,
	order_date DATE NOT NULL DEFAULT '2000-01-01',

	PRIMARY KEY (order_id),
	UNIQUE (order_name)
);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
# Example 3 (table-level constraints & unique names for constraints)
CREATE TABLE orders3 (
	order_id INT AUTO_INCREMENT,
	order_name VARCHAR(30) NOT NULL,
	order_date DATE NOT NULL DEFAULT '2000-01-01',

	CONSTRAINT pk_order_id PRIMARY KEY (order_id),
	CONSTRAINT uq_order_name UNIQUE (order_name)
);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 4 (compund primary key)
CREATE TABLE orders4 (
	order_id INT AUTO_INCREMENT,
	order_name VARCHAR(30) NOT NULL,
	order_date DATE NOT NULL DEFAULT '2000-01-01',
	PRIMARY KEY (order_id, order_date)
	# or CONSTRAINT cpk_order_id_order_date PRIMARY KEY (order_id, order_date)
);

