/* Bad way
* Increase 'likes' column everytime a user click like button
* like once? who unlike? who like this post? user deleted how remove like?
*/

/*
users           likes								posts
id | name       id | user_id | post_id	| type 		id | url
1    A          1    2         1          sad  		1    abc.jpg
2    B          2    3         2          happy		2    def.jpg
3    C          3    2         1 (error)  love 		3    fff.jpg

1. # of likes on post 2
2. name of people who like post 2
3. top 5 most like posts
4. post url that user 3 like
*/
SELECT post_id, count(*)
FROM likes
WHERE post_id = 2;

SELECT name
FROM likes l
JOIN users u ON l.user_id = u.id
WHERE post_id = 2;

SELECT p.id FROM posts p
JOIN likes l ON p.id = l.post_id
GROUP BY user_id
ORDER BY count(*) DESC
LIMIT 5;

SELECT p.url 
FROM posts p
JOIN likes l ON p.id = l.post_id
WHERE l.user_id = 3;

/*
 * 3 ways
 * 1. multiple tables - like_post, like_comment tables
 * 2. one table with many different columns - post_id, comment_id columns
 * 3. polymorphic associations - like_id(plain int), like_type(post,comment)
 * 
 * Which one?
 * 2. post_id, comment__id, at least one of them actually has to be defined
 * 
 * Explain:
 * - just like, no other information associated with a like, no reaction type.
*/
-- track value FROM LEFT TO RIGHT IF NULL THEN ignore, GET NEXT value
SELECT COALESCE(NULL,20,30); -- 20
SELECT COALESCE(NULL,NULL,30); -- 30

ADD CHECK OF 
(
	COALESCE((post_id)::BOOLEAN:INTEGER,0)
	+
	COALESCE((post_id)::BOOLEAN:INTEGER,0)
) = 1

SELECT COALESCE((NULL)::BOOLEAN::INTEGER,0); --0
SELECT NULL::BOOLEAN; --NULL
SELECT NULL::BOOLEAN::INTEGER; --NULL
SELECT 534::BOOLEAN; --true
SELECT 555::BOOLEAN::INTEGER; --1
SELECT COALESCE(1,0); --1
SELECT COALESCE((1)::BOOLEAN::INTEGER,0); --1

/*
cách 1: polymorphic association
- vấn đề nằm ở cột liked_id, nó ko thể làm foreign key cho cả post và comment
- cho nên có thể sẽ để liked_id là 9999 mà ko bị postgresql phát hiện lỗi

cách 2: alternative
- sử dụng 2 cột liked_post_id, liked_comment_id để phân biệt, đây là 2 foreign key thực thụ
- khi like 1 cái thì chỉ cần điền vào 1 trong 2 cột
- nếu không có cái nào thì sẽ là NULL
- có 1 vấn đề đó là post_id và comment_id cùng tồn tại hoặc cả 2 đều NULL, 
- mục tiêu là chỉ 1 trong 2 có giá trị
- nên phải add constraint để tránh insert sai data
- 1 cái chưa hay ở đây là, nếu muốn like nhiều cái khác, thì phải tạo nhiều cột khác

cách 3: cách dễ nhất
- tạo 2 table, mỗi table đại diện cho 1 kiểu like: post_likes, comment_likes table
- cái cùi bắp của nó thì cũng như ở trên, nếu like nhiều thứ, thì tạo nhiều table
- nếu muốn thống kê số lượng likes thì phải dùng union hay view
- cái tốt ở phương pháp này là nếu có kiểu reaction type, thì thêm cột reaction_type vào
 table post_likes

 ! Ở đây ta sẽ chọn cách 2 với lý do sau:
 - khi like, thì chỉ like 1 post hay 1 comment
 - ko có reaction type, kiểu như love, haha, sad...
 - ko có sự khác nhau khi like 1 post hay 1 comment
 - nên ko cần tạo 2 bảng khác nhau, vì khi tạo 2 bảng, ta có thể thêm những thông tin khác
 cụ thể thêm cho từng bảng
 - 1 là like, 2 là xóa like, ko có khái niệm update like, nên là trong bảng ko cần updated_at
 - còn created_at ở đây có thể dùng để thống kê, những like nào gần đây
*/