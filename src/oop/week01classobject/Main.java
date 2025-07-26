package oop.week01classobject;

public class Main {
	public static void main(String[] args) {
		ConCho conCho1 = new ConCho();
		conCho1.ten = "Buddy";
		conCho1.tuoi = 3;
		conCho1.tuToChucSinhNhat();
		System.out.println(conCho1.tuoi);

		ConCho conCho2 = new ConCho();
		conCho2.ten = "Max";
		conCho2.tuoi = 5;
		conCho1.tuToChucSinhNhatConChoKhac(conCho2);
		System.out.println(conCho2.tuoi);

	}
}

/** 
 * https://viettuts.vn/java/tong-quan-java-oops"
 * Lập trình hướng đối tượng khác LT hướng thủ tục (hướng hàm)
 * 
 * Nguyên tắc đầu tiên để LTHĐT được là phải biết khái niệm
 * //* Trừu tượng hóa
 * Đi từ những cái cụ thể, cái riêng ---> Đến cái trừu tượng (khái
 * quát, tổng quát)
 * Nhìn nhiều con chó để đúc kết được định nghĩa về CHÓ
 * 
 * Để trừu tượng hóa được thì ta phải bỏ những cái râu ria, tiểu
 * tiết, không phải là cái chung
 * chỉ giữ lại những đặc điểm chung, quan trọng, tối cần thiết
 * 
 * Sau khi trừu tượng hóa được con chó rồi thì ta sẽ có 1 bảng mô tả
 * các đặc tính cở bản của CHÓ
 * Bảng mô tả này giúp ta có thể xác định được 1 con chó mới (có
 * thể không nằm trong ds những con chó lúc đầu)
 * 
 * Bảng mô tả đó người ta gọi là CLASS (lớp)
 * Dựa vào class ta có thể sinh ra vô vàn các đối tượng. Mỗi đối
 * tượng là 1 đại diện (chính là) cho 1 con chó cụ thể.
 * 
 * Và ta nói đối tượng là thể hiện của 1 lớp. Thể hiện = cụ thể hóa = hiện thực hóa (của class).
 * Lớp: người ta gọi là khuôn mẫu để tạo ra các đối tượng.
 * Lớp: là 1 bảng mô tả (các thuộc tính và hành vi) của một tập hợp
 * các đối tượng (có thuộc tính và hành vi giống nhau)
 * 
 * đưa ra design trong Class file
 * Class file được compile thành byte code
 * jvm sẽ tạo object dựa trên byte code đó
 * 
 * design in California, assembly in China
 * 
 * Lớp có cái gì bên trong?
 * Thuộc tính (biến) và hành vi (phương thức - hàm)
 * Đối tượng có cái gì bên trong?
 * Thuộc tính (biến) và hành vi (phương thức - hàm)
 * 
 * Nói như vậy thì lớp và đối tượng giống hệt nhau à?
 * 
 * Lớp không chứa thuộc tính và phương thức mà lớp có mô tả các
 * thuộc tính và phương thức
 * Đối tượng có sở hữu các thuộc tính và phương thức
 * 
 * Khi coding thì mình sẽ code trong LỚP
 * Khi chương trình chạy thì Java cần đến các đối tượng để thực thi
 * chương trình
 * 
 * Inner Class là khai báo 1 cái class nằm bên trong 1 class, inner class có thể
 * dùng từ khóa static
 * Anonymous Inner Class là class chỉ muốn dùng 1 lần rồi thôi
 * 
 * * no F(no), no F(yes), yes F(no), yes F(yes)
 * main
 * hành vi được thực hiện qua methods
 * chỉ cần để return trong hàm, thì nó sẽ thoát hàm sau đó
 * học cách return trực tiếp, ko cần dùng biến
 * có nhiều methods thì phải maintain nhiều document, còn phải nghĩ ra nhiều method name nữa
 * method overloading: 2 hay nhiều methods cùng tên trong cùng class (kể cả khi dùng extends), khác số lượng param, khác param type
 * mỗi method sẽ có stack riêng của nó
 * 
 * his and super methods
 * mỗi object sẽ có 1 constructor mặc định, khi tạo object, constructor này sẽ tự động được gọi
 * mỗi constructor sẽ có 1 super() mặc định, và super() method này sẽ tự động đc gọi
 * tất cả các class trong java đều extends từ Object class
 * super() method, đứng từ lớp con, gọi đến constructor của lớp cha
 * this() method, đừng từ lớp con, gọi đến constructor trong cùng lớp
 * 
 * method overriding
 * 2 methods giống tên nhau ở 2 class khác nhau, 1 class cha, 1 class con, thì gọi là method overriding, khi tạo object con, thì xài method con
 * access modifer ở lớp con mà ít quyền hơn ở lớp cha thì báo lỗi
 * hàm static không được OR, nhưng vẫn OL bình thường
 * 
 * this and super keywords
 * nếu class A extends class B, Class A có biến a, Class B sẽ copy biến a của Class A qua Class B
 * nếu class A extends class B, Class A có biến a, Class B cũng có biến a, khi dùng a hoặc this.a sẽ lấy trước tiếp a của Class B, khi dùng super.a, thì sẽ lấy biến a đã được copy từ Class A qua Class B
 * khi kiếm ở Class B, biến a và this.a, phù hợp, nó sẽ lấy ở Class B, còn khi có từ khóa super, thì nó lấy thẳng ở Class A
 * đó gọi là instance variable overiding
 * ví dụ nốt ruồi
 * 
 */