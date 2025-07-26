package oop.week03protectedinheritancethissuper;

public class Main {
    
}

/**
 * https://viettuts.vn/java/tinh-ke-thua-trong-java
 * https://viettuts.vn/java/access-modifier-trong-java
 * https://viettuts.vn/java/constructor-trong-java
 * https://www.youtube.com/watch?v=18I4i2e_clo
 * 
 * Class A "nhìn thấy" Class B nghĩa là:
 *  - ở code của Class A, ta có thể: extends Class B
 *  - new đối tượng của Class (hàm dựng của Class B phải được A nhìn thấy thì mới new được)
 * nhưng trong tình huống, mà Class A ko hề nhìn thấy hàm dựng của Class B
 * thì Class A ko thể new đối tượng của Class B được.
 * 
 * Sau khi class A đã nhìn thấy Class B
 * thì ta mới xét tiếp là class A nhìn thấy những class members nào của lớp B.
 * 
 * protected = default(nếu xét về mức độ nhìn thấy) + cho phép class con kế thừa   
 * 
 *  kế thừa?
 * Class B kế thừa Class A nghĩa là:
 *  - bảng mô tả B kế thừa bảng mô tả A
 *  - Bảng mô tả B copy (1 phần hoặc tất cả) bảng mô tả A
 * bản chấp của kế thừa là copy, sau khi copy xong thì tạo ra 1 cái riêng của class con (không có chuyện lớp con truy cập vào thuốc tính hay phương thức của lớp cha
 * mà chỉ là truy cập đến phương thức hoặc thuộc tính của chính nó, và những pt/tt đó được copy từ class Cha
 *
 * parent class - child class, super class - sub class, base class - derived class
 * dùng kế thừa để ko bị dư code
 * java ko support đa kế thừa, chỉ hỗ trợ đơn kế thừa
 * 
 * Constructor
 * tạo data cho instance variable theo ý mình muốn ngay khi object được tạo, nếu không java sẽ để giá trị mặc định cho các instance variable
 * contructor cũng giống method nhưng ko có return type, tên constructor giống với tên Class
 * khi tạo object, thì constructor sẽ tự động được object call, mình ko cần call
 * để follow convention, thì khi muốn khởi tạo data, luôn khởi tạo trong constructor, ko nên để trực tiếp ở instance variable
 * viết code connect với database ở trong constructor
 * default constructor, parameterized constructor
 */