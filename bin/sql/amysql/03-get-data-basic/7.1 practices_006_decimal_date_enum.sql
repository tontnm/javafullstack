
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# = = DECIMAL - DATE - ENUM
# = = CONCAT() � LEFT() � Mathematical Operators
# = = = = = = = = = = = = = = = = = = = = = = = = = = = =

USE db_samples1;

CREATE TABLE employees(
	emp_no		INT		PRIMARY KEY AUTO_INCREMENT,
	birth_date	DATE		NOT NULL,
	first_name	VARCHAR(20)	NOT NULL,
	last_name	VARCHAR(16)	NOT NULL,
	gender		ENUM('M','F')	NOT NULL,
	hire_date	DATE		NOT NULL,
	salary		DECIMAL(9,2)	NOT NULL
);

/*
Giải thích cột & kiểu dữ liệu:
- emp_no: số nguyên, tự tăng (AUTO_INCREMENT), khóa chính (PRIMARY KEY).
- birth_date: kiểu ngày (YYYY-MM-DD).
- first_name, last_name: chuỗi ký tự có giới hạn độ dài.
- gender: giá trị cố định 'M' hoặc 'F' nhờ kiểu ENUM.
- hire_date: ngày được tuyển.
- salary: số thập phân với tối đa 9 chữ số, 2 chữ số sau dấu phẩy.
📌 DECIMAL(9,2) thích hợp cho tiền lương vì tránh lỗi làm tròn của số thực

*/

SHOW TABLES; 
DESCRIBE employees;

/*
- SHOW TABLES: liệt kê các bảng trong db_samples1.
- DESCRIBE employees: liệt kê cột, kiểu dữ liệu, khóa, giá trị mặc định...

*/

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Maria', 'Flowers', 'F', '2000-02-28', 65000.45);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Maria', 'Jimenez', 'F', '2000-02-28', 65000.23);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Benny', 'Flowers', 'M', '2000-02-28', 75000.23);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Benny', 'Jimenez', 'M', '2000-02-28', 60000.91);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Janice', 'Myers', 'F', '2000-02-28', 60000.10);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-02-28', 'Marcos', 'Myers', 'M', '2000-02-28', 85000.75);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-03-28', 'Marcos', 'Hill', 'M', '2000-03-28', 65000.73);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-03-28', 'Barbara', 'Ballard', 'F', '2000-03-28', 80000.13);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1980-03-28', 'Alan', 'Ballard', 'M', '2000-03-28', 62000.42);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1981-03-21', 'Bradford', 'Bush', 'M', '2001-04-21', 61000.40);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1978-03-21', 'Clinton', 'Cunningham', 'M', '2000-04-21', 91000.13);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Keith', 'Martinez', 'M', '2000-04-21', 93000.55);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Keith', 'Beck', 'M', '2000-04-21', 83000.38);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Shelia', 'Martinez', 'F', '2000-04-21', 94000.12);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-20', 'Traci', 'Rice', 'F', '2000-04-21', 65000.73);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-19', 'Lillian', 'Rice', 'F', '2000-04-21', 89000.20);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1979-06-18', 'Kathleen', 'Rice', 'F', '2000-04-21', 55000.21);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1982-05-18', 'Kathleen', 'Chandler', 'F', '2000-04-21', 61000.44);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1983-05-18', 'Jay', 'Lindsey', 'M', '2004-04-22', 39000.95);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1983-05-18', 'Mark', 'Hunt', 'M', '2004-04-23', 99000.12);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1985-05-18', 'Jack', 'Hunt', 'M', '2005-04-23', 91000.22);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1986-03-18', 'Jaden', 'Hunt', 'M', '2006-04-23', 81000.22);

INSERT INTO employees (birth_date, first_name, last_name, gender, hire_date, salary)
VALUES ('1986-03-19', 'Jad', 'Hunt', 'M', '2006-04-24', 81000.61);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Lấy toàn bộ dữ liệu của bảng employees.
SELECT * FROM employees;

--Lọc các nhân viên có first_name đúng là Maria.
--MySQL mặc định không phân biệt hoa/thường với chuỗi khi so sánh
SELECT * FROM employees WHERE first_name='Maria';
SELECT * FROM employees WHERE first_name='MAriA';

--Lọc các nhân viên có họ là Ballard.
SELECT * FROM employees WHERE last_name='Ballard';

--Lấy nhân viên họ Ballard và giới tính F.
SELECT * FROM employees 
WHERE last_name='Ballard' AND gender='F';

--Lấy các nhân viên sinh ngày 1980-03-28.
SELECT * FROM employees 
WHERE birth_date='1980-03-28';

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
--Hiển thị emp_no dưới tên mới là id, và ghép first_name + khoảng trắng + last_name 
--thành cột name.
SELECT emp_no AS id , 
	CONCAT(first_name, ' ', last_name) AS name 
FROM employees;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Exercise: dispaly rows in this format: Maria's last name: Flowers'
SELECT CONCAT(first_name, "'s last name: ", last_name) AS name
FROM employees;

SELECT CONCAT(first_name, '''s last name: ', last_name) AS name 
FROM employees;

SELECT CONCAT(first_name, '"s last name: ', last_name) AS name
FROM employees;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT 9+2, 9-2, 9*2, 9/2, 9 DIV 2, 9%2;

/*
Thực hiện các phép toán số học:
- + cộng, - trừ, * nhân, / chia thực,
- DIV chia lấy nguyên,
- % lấy phần dư.
*/

SELECT emp_no, salary, 
salary * 10 AS mult,
salary / 10 AS div1,
salary DIV 10 AS div2,
salary % 10 AS modulo   
FROM employees;
/*
Thực hiện phép tính trực tiếp trên cột salary và hiển thị thêm các kết quả:
- nhân 10, chia thực 10, chia nguyên 10, lấy dư khi chia 10.

*/

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SELECT first_name, last_name, 
LEFT(first_name,1), LEFT(last_name,1) 
FROM employees;
-- Lấy ký tự đầu tiên của first_name và last_name.

# Exercise: display employees first_name, last_name, and initials
SELECT first_name, last_name, 
CONCAT(LEFT(first_name,1), LEFT(last_name,1)) AS Initials 
FROM employees;
--Tạo cột Initials (chữ cái đầu của tên và họ), ví dụ: Maria Flowers → MF.