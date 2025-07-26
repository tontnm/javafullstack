package oop.week09updowncasting;

import java.util.Scanner;

public class NVChinhThuc extends HocVien {
    protected double luongCoBan;
    protected String phongBan;

    public void addInfor(Scanner sc) {
        super.addInfor(sc);
        System.out.print("Nhập lương cơ bản: ");
        luongCoBan = InputValidator.getDouble(sc, "Nhập lương cơ bản: ", 1, 500000);
        phongBan = InputValidator.getString(sc, "Nhập phòng ban: ");
    }

    public void showInfor() {
        super.showInfor();
        System.out.println("Lương cơ bản: " + luongCoBan);
        System.out.println("Phòng ban: " + phongBan);
    }
}