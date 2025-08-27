package sql.bai095;

public class Main {
    
}

/*
https://viblo.asia/p/mo-hinh-quan-he-thuc-the-entity-relationship-model-oOVlYEenl8W
https://thinhnotes.com/chuyen-nghe-ba/erd-la-gi/
https://nthnhung.wordpress.com/2019/07/18/bai-1-cach-doc-entity-relation-diagram-erd-gioi-thieu-cong-cu-erdplus/

1. xác định ERD: entity, relationship, attribute
2. convert ERD qua DB: table, column, data
3. thuộc tính đa trị phải tách ra bảng riêng
4. 1-1: lấy 1 bỏ vào 1
5. 1-n: Lấy khóa chính của bảng 1 bỏ vào trong bảng nhiều để tạo thành 1 khóa ngoai của 
bảng nhiều.
6. n-n: 
Trong DB không thể biểu diễn quan hệ n-n được, nên ta phải phân rã quan hệ n-n thành 
2 quan hệ 1-n bằng cách tạo ra 1 bảng thứ 3. Và khi đó, khóa chính của bảng thứ 3 này 
sẽ được tạo thành bằng cách góp khóa từ 2 bảng chính đã tham gia
7.Khi gặp quan hệ 3 ngôi trở lên ta chuyển như sau:
Trong DB cũng không thể biểu diễn quan hệ 3 ngôi trở lên, nên ta phải phân rã quan hệ 3 
ngôi trở lên thành các quan hệ 1-n bằng cách tạo ra 1 bảng thứ 3. Và khi đó, khóa chính 
của bảng thứ 3 này sẽ được tạo thành bằng cách góp khóa từ các bảng chính đã tham gia
*/
