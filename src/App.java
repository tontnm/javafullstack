import javaoop.week09updowncasting.*;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        // HocVien hocVien1 = new HocVien(); // ko có casting
        // HocVien hocVien2 = (SinhVien) hocVien1; // down trc, up sau, runtime error
        // ChuyenVien hocVien3 = (ChuyenVien) hocVien2; // down, runtime error
        // NVChinhThuc hocVien4 = hocVien3; // up
        // HocVien hocVien5 = hocVien3; // up
        // HocVien hocVien6 = (HocVien) hocVien2; // ép ngang
        // HocVien hocVien7 = (NVQuanly) hocVien6; // down, up , compile error
        // NVChinhThuc hocVien8 = (NVChinhThuc) hocVien7;
        // // SinhVien hocVien9 = (SinhVien) hocVien3; // compile error
        // HocVien hocVien10 = new SinhVien(); // up
        // ChuyenVien hocVien11 = (ChuyenVien) hocVien10; // down, ngang
        // HocVien hocVien12 = (HocVien) new SinhVien(); // down, ngang

        // HocVien hocVien13 = new SinhVien(); // up
        // HocVien hocVien14 = (SinhVien) hocVien13; // down, up
        // // SinhVien hocVien15 = new HocVien(); // down, ko tường minh nên lỗi
        // SinhVien hocVien16 = (SinhVien) new HocVien(); // down, ngang, runtime error

        HocVien[] dsHocVien = nhap();

        System.out.println("Danh sách học viên đã nhập:");
        inDanhSachHocVien(dsHocVien);
        thongKeHocVien(dsHocVien);
    }

    public static HocVien[] nhap() {
        Scanner sc = new Scanner(System.in);
        final int soLuongHocVien = 4;
        HocVien[] dsHocVien = new HocVien[soLuongHocVien];

        for (int i = 0; i < soLuongHocVien; i++) {
            System.out.println("Chọn loại học viên muốn thêm:");
            loaiHocVien();

            int choice = Integer.parseInt(sc.nextLine());
            while (choice < 1 || choice > 4) {
                System.out.println("Lựa chọn không hợp lệ. Vui lòng chọn lại:");
                loaiHocVien();
                choice = Integer.parseInt(sc.nextLine());
            }
            switch (choice) {
                case 1:
                    dsHocVien[i] = new SinhVien();
                    break;
                case 2:
                    dsHocVien[i] = new NVThuViec();
                    break;
                case 3:
                    dsHocVien[i] = new ChuyenVien();
                    break;
                case 4:
                    dsHocVien[i] = new NVQuanly();
                    break;
                default:
                    break;
            }
            dsHocVien[i].addInfor(sc);
        }

        return dsHocVien;
    }

    public static void loaiHocVien() {
        System.out.println("1. Sinh viên");
        System.out.println("2. Nhân viên thử việc");
        System.out.println("3. Chuyên viên");
        System.out.println("4. Quản lý");
    }

    public static void inDanhSachHocVien(HocVien[] dsHocVien) {
        for (HocVien hocVien : dsHocVien) {
            if (hocVien != null) {
                hocVien.showInfor();
            }
        }
        System.out.println();
    }

    public static void thongKeHocVien(HocVien[] dsHocVien) {
        int soLuongSinhVien = 0;
        int soLuongNVThuViec = 0;
        int soLuongChuyenVien = 0;
        int soLuongNVQuanLy = 0;

        for (HocVien hocVien : dsHocVien) {
            if (hocVien instanceof SinhVien) {
                soLuongSinhVien++;
            } else if (hocVien instanceof NVThuViec) {
                soLuongNVThuViec++;
            } else if (hocVien instanceof ChuyenVien) {
                soLuongChuyenVien++;
            } else if (hocVien instanceof NVQuanly) {
                soLuongNVQuanLy++;
            }
        }

        System.out.println("Số lượng sinh viên: " + soLuongSinhVien);
        System.out.println("Số lượng nhân viên thử việc: " + soLuongNVThuViec);
        System.out.println("Số lượng chuyên viên: " + soLuongChuyenVien);
        System.out.println("Số lượng nhân viên quản lý: " + soLuongNVQuanLy);
    }
}