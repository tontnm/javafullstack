
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = First Database / Table 
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

CREATE DATABASE world_1;
# CREATE SCHEMA world_1;  # similar to the previous statement
USE world_1; # active db
SELECT database(); # display active db

/*
- CREATE DATABASE world_1;: Tạo một cơ sở dữ liệu mới tên là world_1.
- USE world_1;: Chọn world_1 làm cơ sở dữ liệu đang hoạt động.
- SELECT database();: Hiển thị tên của cơ sở dữ liệu hiện tại đang được sử dụng.
Ghi chú: CREATE SCHEMA world_1; cũng có thể dùng, nhưng trong MySQL thì SCHEMA và DATABASE 
là tương đương nhau.
*/

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
CREATE TABLE country (
  id INT(3) NOT NULL,
  country_name VARCHAR(50),
  continent VARCHAR(30),
  population INT
);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SHOW TABLES; # display tables in active db
DESCRIBE country;
DESC country;
DESC world_1.country;

/*
- SHOW TABLES;: Hiển thị danh sách các bảng trong cơ sở dữ liệu hiện tại.
- DESCRIBE hoặc DESC: Hiển thị cấu trúc bảng country, gồm tên cột, kiểu dữ liệu, NULL/NOT NULL, v.v.
- DESC world_1.country;: Cách gọi đầy đủ nếu bạn đang ở một database khác.

*/

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
INSERT INTO country VALUES (1,'Spain','Europe',39441700);
INSERT INTO country(id, country_name, continent, population) VALUES (2,'Spain','Europe',39441700);
INSERT INTO country(id, country_name, continent) VALUES (3,'Spain','Europe');
INSERT INTO country(country_name, id , continent) VALUES ('Spain', 4, 'Europe');

/*
- Các lệnh INSERT INTO dùng để thêm dữ liệu vào bảng.
- Có thể chỉ định thứ tự cột hoặc bỏ qua một số cột (như population) nếu chấp nhận giá trị 
mặc định hoặc NULL.
- Thứ tự cột trong câu lệnh phải khớp với giá trị tương ứng.

*/
# ...

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DROP TABLE IF EXISTS country; # show warning if no table country
DROP TABLE country; # show error if no table country

/*
- DROP TABLE IF EXISTS: Xóa bảng nếu tồn tại, không báo lỗi nếu không có bảng.
- DROP TABLE: Xóa bảng, sẽ báo lỗi nếu bảng không tồn tại.

*/

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT * FROM country;
SELECT country_name FROM country;
SELECT id, country_name, continent FROM country;
SELECT continent, population, country_name, id FROM country;

/*
- SELECT *: Lấy toàn bộ dữ liệu trong bảng.
- SELECT column1, column2, ...: Lấy dữ liệu từ các cột cụ thể.
- Thứ tự cột trong SELECT có thể thay đổi tùy ý.

*/

# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Exercise (Animals)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Create the following two tables (animal1 and animal2) 
# in a new database (db_samples1) and insert the specified rows.
#

CREATE DATABASE db_samples1;
USE db_samples1;
SELECT database();

CREATE TABLE animal1 (
	id INT,
	name VARCHAR(15)
);

CREATE TABLE animal2 (
	id INT,
	name VARCHAR(15)
);

SHOW TABLES; 
DESCRIBE animal1;
DESCRIBE animal2;

INSERT INTO animal1 (id, name) VALUES (1, 'Lion');
INSERT INTO animal1 (name, id) VALUES ('Bear', 2);

INSERT INTO animal1 (id, name) 
VALUES (3, 'Tiger'), (4, 'Elephant');

INSERT INTO animal1 VALUES (5, 'Jaguar');

SELECT * FROM animal1;

INSERT INTO animal2
VALUES (1,'Lion'), (2, 'Giraffe'), (3, 'Panda'), (4, 'Tiger');

SELECT * FROM animal2;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
DROP TABLE IF EXISTS animal1;
DROP TABLE IF EXISTS animal2;

DROP DATABASE IF EXISTS world_1;
