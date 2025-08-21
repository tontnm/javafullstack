/*
 * Grouping - GROUP BY - giảm nhiều rows xuống còn 1 vài row
 * Aggregates - COUNT(), SUM(), AVG(), MIN(), MAX() - giảm nhiều giá trị thành 1 giá trị
 * */
SELECT photo_id, count(*) FROM "comments" GROUP BY photo_id;

/*
 * FROM -> JOIN -> WHERE -> GROUP BY -> HAVING (dùng cho group by và luôn đi chung với nó
 * bên trong HAVING ta sử dụng aggregate functions)
 * */
SELECT photo_id , count(*) 
FROM comments 
WHERE photo_id < 3 
GROUP BY photo_id 
HAVING count(*) > 2;

SELECT user_id, count(*)
FROM "comments" 
WHERE photo_id < 3 
GROUP BY user_id 
HAVING count(*) > 2; 


SELECT user_id 
FROM comments 
GROUP BY user_id;
/*
! Giải thích cách hoạt động của GROUP BY 
* GROUP BY user_id 
* -> tạo 1 bảng tạm chứa user_id là duy nhất
* -> so sánh user_id ở bảng tạm với bảng chính, nếu trùng nhau thì copy từ bảng chính qua bảng tạm 
* -> lúc này chỉ đc chọn cột GROUPED user_id thôi
*/

SELECT MAX(id) FROM comments; --100
SELECT MIN(id) FROM comments; --1
SELECT AVG(id) FROM comments; --50
SELECT COUNT(id) FROM comments; --100
SELECT SUM(id) FROM comments; --5050

SELECT MAX(id), id FROM comments; --error
/*
! Giải thích aggregate funtions
* 1 là đi 1 mình
* 2 là đi chung với GROUP BY
*/
SELECT user_id, MAX(id), COUNT(id)
FROM comments 
GROUP BY user_id;

SELECT COUNT(user_id) FROM photos; --20 ko đếm NULL, count theo column
SELECT COUNT(*) FROM photos; --21, count số lượng rows

SELECT user_id, COUNT(*)
FROM comments
GROUP BY user_id;

--có bao nhiêu comments cho mỗi photos?

SELECT manufacturer, SUM(price*units_sold)
FROM phones
GROUP BY manufacturer
HAVING SUM(price*units_sold) > 1000000;