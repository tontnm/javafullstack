--! Trường hợp 1 yêu cầu, cần phải có 2 query khác nhau cùng 1 bảng (vì mỗi query có các 
--! sorting riêng) không thể kết hợp thành 1 query được, thì mình xài UNION, UNION nó sẽ
--! xem xét nếu cùng 1 kết quả xuất hiện ở cả 2 câu query, thì nó chỉ hiển thị 1 thôi
--! Nếu dùng UNION ALL thì nó sẽ hiển thị tất cả kết quả, bao gồm cả trùng lặp
--! NOTE: chỉ dùng đc UNION, khi cả 2 query trả về cùng tên column, khi đã cùng tên thì phải
--! cùng kiểu dữ liệu nữa

/* UNION - join results of 2 queries and remove duplicate rows
 * - same column, name, data type
 * UNION ALL - join results of 2 queries
 * */
(
	SELECT * FROM products ORDER BY price DESC LIMIT 4 -- 1,2,3
)
UNION 
(
	SELECT * FROM products ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1,2,3,4

(
	SELECT * FROM products ORDER BY price DESC LIMIT 4 -- 1,2,3
)
UNION ALL
(
	SELECT * FROM products ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1,1,2,3,4

/* INTERSECT - find rows common in the result of 2 queries, remove duplicate
 * INTERSECT ALL - find rows common in the result of 2 queries
 * */
 /*
 ! INTERSECT
 * 2 câu query khác nhau trên cùng 1 bảng
 * trường hợp cả 2 câu query đều cùng chứa 1 row giống nhau, thì trả về 1 row thôi
 * những row khác nhau thì ko lấy
 * trường hợp câu query 1 trả 2 row id 7, còn query 2 trả 1 row id 7, thì dùng INTERSECT ALL
 * sẽ trả về nhiều hơn 1 row id 7
 */
(
	SELECT * FROM products ORDER BY price DESC LIMIT 4 -- 1,1,2,3
)
INTERSECT  
(
	SELECT * FROM products ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1

(
	SELECT * FROM products ORDER BY price DESC LIMIT 4 -- 1,1,2,3
)
INTERSECT ALL
(
	SELECT * FROM products ORDER BY price / weight DESC LIMIT 4 -- 1,4
); -- 1,1

/* EXCEPT - find rows belong to first query, not second, remove duplicate
 * EXCEPT ALL - find rows belong to first query, not second, duplicate
 * */
 /*
 * có 2 câu query, lấy từng row cẩ query, so sánh với từng row của query 2
 * nếu row ở query 1 ko tồn tại trong row của query 2, thì giữ lại
 * nếu row ở query 1 tồn tại trong row của query 2, thì bỏ
 */
(
	SELECT * FROM products ORDER BY price DESC LIMIT 4 -- 1,2,3,4
)
EXCEPT  
(
	SELECT * FROM products ORDER BY price / weight DESC LIMIT 4 -- 2,4,5,6
); -- 1,3

(
	SELECT * FROM products ORDER BY price DESC LIMIT 4
)
EXCEPT ALL
(
	SELECT * FROM products ORDER BY price / weight DESC LIMIT 4
);

(
	SELECT manufacturer 
	FROM phones
	WHERE price < 170
)
UNION
(
	SELECT manufacturer 
	FROM phones
	GROUP BY manufacturer
	HAVING COUNT(*) > 2
);