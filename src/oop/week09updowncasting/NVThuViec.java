package oop.week09updowncasting;

import java.util.Scanner;

public class NVThuViec extends HocVien {
    private int thoiGianThuViec;
    private String viTri;

    public void addInfor(Scanner sc) {
        super.addInfor(sc);
        thoiGianThuViec = InputValidator.getInt(sc, "Nhập thời gian thử việc (tháng): ", 1, 12);
        viTri = InputValidator.getString(sc, "Nhập vị trí: ");
    }

    public void showInfor() {
        super.showInfor();
        System.out.println("Thời gian thử việc: " + thoiGianThuViec + " tháng");
        System.out.println("Vị trí: " + viTri);
    }
}