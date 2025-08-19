
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = DEFAULT keyword - Logical Operators
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
		
USE db_samples1;

CREATE TABLE customer2 (
  id 		INT  		AUTO_INCREMENT PRIMARY KEY,
  first_name 	VARCHAR(30) 	NOT NULL,
  last_name 	VARCHAR(30) 	DEFAULT 'TBD',
  country 	VARCHAR(25) 	DEFAULT "UNKNOWN"
);

/*
- AUTO_INCREMENT + PRIMARY KEY: Tự tăng id, duy nhất, không NULL.
- NOT NULL: first_name bắt buộc phải có dữ liệu.
- DEFAULT: Nếu bạn KHÔNG cung cấp giá trị cho last_name hoặc country, MySQL sẽ điền lần 
lượt 'TBD' và "UNKNOWN". Nếu bạn ghi rõ NULL thì sẽ lưu NULL, không dùng DEFAULT.
- Dấu nháy: MySQL chấp nhận cả '...' và "..." cho chuỗi (trừ khi bật ANSI_QUOTES).

*/

SHOW TABLES; 
DESCRIBE customer2;

INSERT INTO customer2 (first_name) VALUES ('Monica');
INSERT INTO customer2 (first_name) VALUES ('Monica');
INSERT INTO customer2 (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer2 (first_name, last_name) VALUES ('Sue', 'Ward');
INSERT INTO customer2 (first_name, last_name) VALUES ('Sue', 'Travis');

INSERT INTO customer2 (first_name, country) 
VALUES ('Nick', 'England');

INSERT INTO customer2 (first_name, last_name, country) 
VALUES ('Tim', 'Noble', 'Canada');

INSERT INTO customer2 (first_name, last_name, country) 
VALUES ('Mike', 'Noble', 'Canada');

INSERT INTO customer2 (first_name, last_name, country) 
VALUES ('Mike', NULL, NULL);

# INSERT INTO customer2 (last_name) VALUES ('Alex');	# Error

/*
Lưu ý quan trọng:
- Bỏ cột → dùng DEFAULT.
- Ghi rõ NULL → lưu NULL, không dùng DEFAULT.
- Thiếu cột NOT NULL → lỗi.
Mẹo: có thể dùng từ khóa DEFAULT trực tiếp.

*/

SELECT * FROM customer2;

SELECT * FROM customer2
WHERE last_name IS NULL;

SELECT * FROM customer2
WHERE last_name IS NOT NULL;

SELECT * FROM customer2
WHERE last_name='TBD';


SELECT * FROM customer2
WHERE last_name='TBD' AND country='UNKNOWN';

SELECT * FROM customer2
WHERE last_name='TBD' OR country='UNKNOWN';

SELECT * FROM customer2
WHERE last_name!='TBD' && country!='UNKNOWN';

SELECT * FROM customer2
WHERE last_name!='TBD' || country!='UNKNOWN';

/*
- WHERE last_name IS NULL → Lấy ai chưa có họ (thật sự trống)
- WHERE last_name IS NOT NULL → Lấy ai có họ
- WHERE last_name='TBD' → Lấy ai bị ghi “TBD” (mặc định)
- AND (&&) → cả 2 điều kiện phải đúng
- OR (||) → chỉ cần 1 điều kiện đúng
- XOR → đúng một vế, vế còn lại sai (hoặc loại trừ)
- So sánh != với NULL sẽ không ra kết quả, vì NULL phải kiểm tra bằng IS NULL

*/

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 1: Find customers with either unknown last_name
# or unknown country (not with both)
#
SELECT * FROM customer2
WHERE last_name='TBD' XOR country='UNKNOWN';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise 2: rebuild every row of the preceding 
# truth table using the SELECT statement.
#

SELECT 1 && 1 AS n, 
	1 || 1 AS r, 
	1 XOR 1 AS x,
	!1 AS t;
    
SELECT 1 AND 0 AS n, 
	1 OR 0 AS r, 
	1 XOR 0 AS x,
	NOT 1 AS t;

SELECT 0 && 1 AS n, 
	0 || 1 AS r, 
	0 XOR 1 AS x,
	!0 AS t;
 
SELECT 0 && 0 AS n, 
	0 || 0 AS r, 
	0 XOR 0 AS x,
	!0 AS t;

