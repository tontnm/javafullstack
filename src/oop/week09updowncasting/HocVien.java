package oop.week09updowncasting;

import java.util.Scanner;

public class HocVien {
    protected String maSo;
    protected String hoTen;

    public void addInfor(Scanner sc) {
        maSo = InputValidator.getString(sc, "Nhập mã số: ");
        hoTen = InputValidator.getString(sc, "Nhập họ tên: ");
    }

    public void showInfor() {
        System.out.println("Mã số: " + maSo);
        System.out.println("Họ tên: " + hoTen);
    }
}