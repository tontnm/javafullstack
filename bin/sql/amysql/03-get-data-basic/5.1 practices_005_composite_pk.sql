
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = Exercise � Composite Primary Key
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

CREATE TABLE person (
	name		VARCHAR(20)	NOT NULL DEFAULT "",
	gender		VARCHAR(1)	NOT NULL DEFAULT 'F',
	height		INT(3)		NOT NULL DEFAULT 160,
	eye_color	VARCHAR(10) 	NOT NULL DEFAULT "Brown",

	PRIMARY KEY person_pk(name, gender, height, eye_color)
);

/*
- Tạo bảng person với 4 cột:
- name: tên (bắt buộc, mặc định chuỗi rỗng)
- gender: giới tính (M hoặc F), mặc định 'F'
- height: chiều cao (số nguyên, tối đa 3 chữ số), mặc định 160
- eye_color: màu mắt, mặc định "Brown"
- PRIMARY KEY person_pk(...): tạo khóa chính tổng hợp từ cả 4 cột — nghĩa là tổ hợp giá 
trị của (name, gender, height, eye_color) phải duy nhất cho mỗi dòng.
📌 Nếu bạn chèn dữ liệu mà toàn bộ 4 cột này giống hệt một dòng đã có → MySQL báo lỗi 
trùng (Duplicate entry).

*/

SHOW TABLES; 
DESCRIBE person;

/*
- SHOW TABLES; → Hiển thị tất cả các bảng trong db_samples1.
- DESCRIBE person; → Xem cấu trúc bảng: tên cột, kiểu dữ liệu, khóa, mặc định...

*/

INSERT INTO person (name, gender, height) 
VALUES ('Chad', 'M', 180);

INSERT INTO person 
VALUES ('Ava', 'F', 181, 'Blue');

#Error Code: 1062. Duplicate entry
INSERT INTO person (name, gender, height) 
VALUES ('Chad', 'M', 180);	

INSERT INTO person (name, gender, height) 
VALUES ('Chad', 'M', 182);

SELECT * FROM person;

/*
💡 Tóm gọn ý chính:
- Composite Primary Key = khóa chính gồm nhiều cột → chỉ cần 1 cột khác trong nhóm là đủ 
để phân biệt bản ghi.
- Chèn trùng toàn bộ nhóm cột khóa → lỗi trùng khóa.
- Các cột có DEFAULT sẽ tự điền nếu bạn không nhập.

*/