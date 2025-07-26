package oop.week09updowncasting;

import java.util.Scanner;

public class NVQuanly extends NVChinhThuc {
    private double phuCapChucVu;

    public void addInfor(Scanner sc) {
        super.addInfor(sc);
        phuCapChucVu = InputValidator.getDouble(sc, "Nhập phụ cấp chức vụ: ", 0, 100000);
    }

    public void showInfor() {
        super.showInfor();
        System.out.println("Phụ cấp chức vụ: " + phuCapChucVu);
    }
}