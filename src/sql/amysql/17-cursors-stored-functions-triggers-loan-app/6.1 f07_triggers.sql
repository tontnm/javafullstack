
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Triggers
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP SCHEMA IF EXISTS animals_db;
CREATE SCHEMA animals_db;
USE animals_db;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
DROP TABLE IF EXISTS animals;
CREATE TABLE animals(
	animal_id INT PRIMARY KEY,
	animal_name VARCHAR(50) NOT NULL
); 

# - - - - - - - - - - - - - - - - - - - - 
DROP TABLE IF EXISTS animal_types;
CREATE TABLE animal_types(
	animal_type VARCHAR(50) PRIMARY KEY,
	animal_id INT,
    
	CONSTRAINT  animal_types_fk1_animal_id 
	FOREIGN KEY (animal_id) REFERENCES animals(animal_id)
);

# - - - - - - - - - - - - - - - - - - - - 
INSERT INTO animals values(1, 'Tiger');
INSERT INTO animal_types values('Bengal', 1);
INSERT INTO animal_types values('Malayan', 1);
INSERT INTO animal_types values('Caspian', 1);

INSERT INTO animals values(2, 'Lion');
INSERT INTO animal_types values('White', 2);
INSERT INTO animal_types values('Masaai', 2);
INSERT INTO animal_types values('Katanga', 2);

INSERT INTO animals values(3, 'Bear');
INSERT INTO animal_types values('Polar', 3);
INSERT INTO animal_types values('Sloth', 3);
INSERT INTO animal_types values('Panda', 3);

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 1: Create a trigger to activate before inserting 
# a new row to the 'animal_types' table, and to display the 
# following message if the length of the new animal_type is 
# greater than 7 characters.
# message: 'animal_types longer than 7 are not allowed!'
#

DROP TRIGGER IF EXISTS tr_animal_types_len;
DELIMITER //
CREATE TRIGGER tr_animal_types_len
BEFORE INSERT ON animal_types FOR EACH ROW
BEGIN
  IF LENGTH(NEW.animal_type) > 7 THEN
	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'animal_types longer than 7 are not allowed!';
  END IF;
END // 
DELIMITER ;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = Inserting data after defining a trigger
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
#
#Error Code: 1644. animal_types longer than 7 are not allowed!
INSERT INTO animal_types values('Siberian', 1); #error
INSERT INTO animal_types values('Indochinese', 1);#error
INSERT INTO animal_types values('Kalahari', 2);	#error

INSERT INTO animal_types values('African', 2);
INSERT INTO animal_types values('Black', 3);
INSERT INTO animal_types values('Grizzly', 3);


# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 2: Write a trigger to activate before deleting a row 
# from the 'animal_types' table and then as its action 
# insert a row into the 'delete_log' table. 
#

DROP TABLE IF EXISTS delete_log;
CREATE TABLE delete_log(
	animal_type VARCHAR(50) PRIMARY KEY,
	animal_id INT,
	date_deleted DATETIME DEFAULT NOW()
);

# - - - - - - - - - - - - - - - - - - - - 
DROP TRIGGER IF EXISTS tr_delete_before;
DELIMITER //
CREATE TRIGGER tr_delete_before
BEFORE DELETE ON animal_types FOR EACH ROW
BEGIN
	INSERT INTO delete_log VALUES
	(OLD.animal_type, OLD.animal_id, NOW());
END // 
DELIMITER ;

# - - - - - - - - - - - - - - - - - - - - 
DELETE FROM animal_types WHERE animal_type='Grizzly';

SELECT * FROM delete_log; 

 
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Example 3: This time we need two triggers on the 'animal_types' table:
# 1) before update, copy the old values of the row, the current datetime,
#    and also the word 'before' into the 'update_log' table.
# 2) after update, copy the new values of the row, the current datetime, 
#    and also the word 'after' into the 'update_log' table.
#
DROP TABLE IF EXISTS update_log;
CREATE TABLE update_log(
	animal_type VARCHAR(50) PRIMARY KEY,
	animal_id INT,
	date_deleted DATETIME DEFAULT NOW(),
	which_trigger enum ('before', 'after') NOT NULL DEFAULT 'before'
);

# - - - - - - - - - - - - - - - - - - - - 
DROP TRIGGER IF EXISTS tr_update_before;
DELIMITER //
CREATE TRIGGER tr_update_before
BEFORE UPDATE ON animal_types FOR EACH ROW
BEGIN
	INSERT INTO update_log VALUES
	(OLD.animal_type, OLD.animal_id, NOW(), 'before');
END // 
DELIMITER ;

# - - - - - - - - - - - - - - - - - - - - 
DROP TRIGGER IF EXISTS tr_update_after;
DELIMITER //
CREATE TRIGGER tr_update_after
AFTER UPDATE ON animal_types FOR EACH ROW
BEGIN
	INSERT INTO update_log VALUES
	(NEW.animal_type, NEW.animal_id, NOW(), 'after');
END // 
DELIMITER ;

# - - - - - - - - - - - - - - - - - - - - 
UPDATE animal_types SET animal_type='PINK'
WHERE animal_type='Black';

SELECT * FROM update_log;

