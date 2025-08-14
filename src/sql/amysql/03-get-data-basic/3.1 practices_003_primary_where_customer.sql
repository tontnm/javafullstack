
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Primary Key - WHERE clause - Exercise (Customer table)
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
-- Kích hoạt database db_samples1 để tất cả các lệnh sau đây được thực hiện trên đó.
USE db_samples1;

CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30),
  country VARCHAR(25)
);
/*
- id INT AUTO_INCREMENT PRIMARY KEY
- id: số nguyên.
- AUTO_INCREMENT: khi thêm bản ghi mới, giá trị id sẽ tự động tăng 1.
- PRIMARY KEY: khóa chính, đảm bảo mỗi id là duy nhất và không NULL.
- first_name VARCHAR(30) NOT NULL: tên, bắt buộc nhập.
- last_name VARCHAR(30): họ, có thể bỏ trống (NULL).
- country VARCHAR(25): tên quốc gia.

*/

SHOW TABLES; 
DESCRIBE customer;
/*
- SHOW TABLES: liệt kê các bảng trong DB hiện tại.
- DESCRIBE customer: hiển thị cấu trúc bảng (cột, kiểu dữ liệu, khóa, ràng buộc…).

*/

INSERT INTO customer (first_name) VALUES ('Monica');
INSERT INTO customer (first_name) VALUES ('Monica');
INSERT INTO customer (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer (first_name, last_name) VALUES ('Sue', 'Travis');
INSERT INTO customer (first_name, country) VALUES ('Nick', 'England');

INSERT INTO customer (first_name, last_name, country) 
VALUES ('Tim', 'Noble', 'Canada');

INSERT INTO customer (first_name, last_name, country) 
VALUES ('Mike', 'Noble', 'Canada');

INSERT INTO customer (last_name) VALUES ('Alex'); # Error
--- Lỗi vì first_name là NOT NULL, nên không được để trống.

--Hiển thị toàn bộ bảng.
SELECT * FROM customer;

--- Lọc các khách hàng tên Monica.
SELECT * FROM customer
WHERE first_name='Monica';

--- Lọc các khách hàng tên Sue.
SELECT * FROM customer
WHERE first_name='Sue';

-- Lọc khách hàng ở Canada
SELECT * FROM customer
WHERE country='Canada';

-- Lấy những dòng mà last_name chưa có dữ liệu.
SELECT * FROM customer
WHERE last_name IS NULL;

-- Lấy những dòng mà last_name đã được nhập.
SELECT * FROM customer
WHERE last_name IS NOT NULL;

/*
- Không cần chỉ định id vì AUTO_INCREMENT sẽ tự tăng.
- Có thể nhập dữ liệu cho một số cột, miễn là các cột NOT NULL phải có giá trị.

*/