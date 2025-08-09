/*
Quy trình thiết kế db
1. lưu đối tượng gì? -> lưu các thành phố -> table
2. Đối tượng có những thuộc tính nào? ->  tên tp, đất nước, dân số, khu vực -> columns
3. Dạng dữ liệu của mỗi thuộc tính là gì? string, string  , number, number
4. Nội dung dữ liệu
*/
CREATE TABLE cities (
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
);