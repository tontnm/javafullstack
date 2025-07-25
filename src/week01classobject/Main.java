package week01classobject;

public class Main {
	public static void main(String[] args) {
		int a = 1; // cấp cho a 1 vùng nhớ để lưu giá trị
		int b = a; // cấp cho b 1 vùng nhớ, và copy giá trị của a để gán cho b
		a = 2; // ghi đè lên ô nhớ hiện tại của biến a
		System.out.println(a); // a = 2
		System.out.println(b); // b = 1

		SinhVien sv1 = new SinhVien();
		sv1.hoTen = "Sinh Vien 1";
		SinhVien sv2 = sv1;
		sv2.hoTen = "Sinh Vien 2";
		System.out.println(sv1.hoTen); // Sinh Vien 2, tại vì cùng trỏ đến 1 vùng nhớ (1 object)
	}
}

/**
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
 * Và ta nói đối tượng là thể hiện của 1 lớp. Thể hiện = cụ thể
 * hóa = hiện thực hóa (của class).
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
 */