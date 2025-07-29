package javaoop.week00;

import java.util.ArrayList;
import java.util.List;

// =================================================================================
// Lớp chính để chạy chương trình và minh họa các khái niệm
// =================================================================================
public class DemoOOPToanDien {
    public static void main(String[] args) {
        System.out.println("Công ty: " + NhanVien.TEN_CONG_TY); // Gọi static variable

        // ----------------- OBJECT, POLYMORPHISM, UPCASTING -----------------
        System.out.println("\n--- Khởi tạo và Upcasting ---");
        // object: các thể hiện của class.
        // polymorphism: Một biến tham chiếu NhanVien có thể trỏ đến các đối tượng con.
        // upcasting (ngầm định): Một đối tượng LapTrinhVien được gán cho một tham chiếu
        // NhanVien.
        List<NhanVien> danhSach = new ArrayList<>();
        danhSach.add(new LapTrinhVien("LTV01", "Nguyễn Văn A", 20000000, 10));
        danhSach.add(new QuanLyDuAn("QL01", "Trần Thị B", 30000000, 5000000, "MAC01"));

        System.out.println("\n--- Hiển thị thông tin (Polymorphism) ---");
        for (NhanVien nv : danhSach) {
            // polymorphism: cùng một lời gọi nv.hienThiThongTin() nhưng cho ra kết quả khác
            // nhau
            // tùy thuộc vào đối tượng thực tế (LapTrinhVien hay QuanLyDuAn).
            nv.hienThiThongTin();
            nv.xemQuyDinhCongTy(); // Gọi final method
            System.out.println("---");
        }

        // ----------------- DOWNCASTING & INSTANCEOF -----------------
        System.out.println("\n--- Downcasting và gọi phương thức riêng ---");
        for (NhanVien nv : danhSach) {
            // Dùng instanceof để kiểm tra kiểu thực tế trước khi ép kiểu để tránh lỗi.
            if (nv instanceof LapTrinhVien) {
                // downcasting: Ép kiểu từ cha (NhanVien) xuống con (LapTrinhVien).
                LapTrinhVien ltv = (LapTrinhVien) nv;
                ltv.vietCode(); // Gọi phương thức riêng của LapTrinhVien
            } else if (nv instanceof QuanLyDuAn) {
                QuanLyDuAn ql = (QuanLyDuAn) nv;
                ql.hopDuAn(); // Gọi phương thức riêng của QuanLyDuAn

                // Minh họa method overloading
                ql.tinhThuong();
                ql.tinhThuong(0.2);
            }
        }

        // ----------------- STATIC METHOD -----------------
        System.out.println("\n--- Gọi Static Method ---");
        System.out.println("Tổng số nhân viên đã được tạo: " + NhanVien.getTongSoNhanVien());
    }
}
