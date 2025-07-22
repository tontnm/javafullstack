package oop;

// =================================================================================
// class: Khuôn mẫu để tạo ra các đối tượng.
// =================================================================================
abstract class NhanVien {
    // ----------------- THUỘC TÍNH (Attributes) -----------------

    // static variable: Biến của lớp, chung cho tất cả đối tượng.
    public static final String TEN_CONG_TY = "ABC Tech"; // final variable: Hằng số không thể thay đổi.
    private static int tongSoNhanVien = 0;

    // encapsulation: Dữ liệu được che giấu bằng 'private'.
    private String maNV;
    private String ten;
    protected double luongCoBan; // protected: Lớp con có thể truy cập trực tiếp.

    // ----------------- KHỐI LỆNH (Blocks) -----------------
    
    // static block: Chạy một lần duy nhất khi lớp được nạp vào bộ nhớ.
    static {
        System.out.println("Lớp NhanVien đang được nạp...");
    }

    // ----------------- CONSTRUCTOR -----------------

    // constructor: Dùng để khởi tạo đối tượng.
    public NhanVien(String maNV, String ten, double luongCoBan) {
        // this: Tham chiếu đến đối tượng hiện tại.
        this.maNV = maNV;
        this.ten = ten;
        this.luongCoBan = luongCoBan;
        tongSoNhanVien++; // Mỗi lần tạo nhân viên thì tăng tổng số lên.
    }

    // ----------------- HÀNH VI (Behaviors / Methods) -----------------

    // encapsulation: Cung cấp phương thức public để truy cập dữ liệu private.
    public String getTen() {
        return this.ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMaNV() {
        return this.maNV;
    }

    // abstract method: Lớp con bắt buộc phải override.
    public abstract double tinhLuong();

    public void hienThiThongTin() {
        System.out.println("Mã NV: " + this.maNV + ", Tên: " + this.ten);
    }
    
    // final method: Phương thức này không thể bị override bởi lớp con.
    public final void xemQuyDinhCongTy() {
        System.out.println("Tất cả nhân viên phải tuân thủ quy định của " + TEN_CONG_TY);
    }

    // static method: Phương thức của lớp, gọi trực tiếp bằng tên lớp.
    public static int getTongSoNhanVien() {
        return tongSoNhanVien;
    }
}
