/* ORDER BY */
SELECT * FROM products ORDER BY price, weight DESC;
SELECT * FROM products ORDER BY name;

/* LIMIT - get first limit
 * OFFSET - skip first records/rows
 */
SELECT * FROM phones ORDER BY price DESC LIMIT 3 OFFSET 1;

SELECT * FROM users OFFSET 40; -- bỏ qua 40 rows đầu, lấy những cái phía sau
SELECT * FROM users LIMIT 10; -- lấy 10 rows đầu tiên
SELECT * FROM products ORDER BY price LIMIT 5; -- lấy 5 món rẻ nhất
SELECT * FROM products ORDER BY price DESC LIMIT 5; -- lấy 5 món đắt nhất
SELECT * FROM products ORDER BY price DESC LIMIT 5 OFFSET 1; -- ko lấy món đắt nhất, lấy 5 cái mắc tiếp theo

--! LIMIT + OFFSET đi chung với nhau cho việc phân trang
SELECT * FROM products ORDER BY price LIMIT 20 OFFSET 0; -- lấy 20 sản phẩm đầu tiên ở trang 1
SELECT * FROM products ORDER BY price LIMIT 20 OFFSET 20; -- lấy 20 sản phẩm tiếp theo ở trang 2

SELECT name FROM phones ORDER BY price DESC LIMIT 2 OFFSET 1;