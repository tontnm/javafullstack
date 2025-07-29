package javaoop.week09updowncasting;

import java.util.Scanner;

public class ChuyenVien extends NVChinhThuc {
    private int soNamKinhNghiem;

    public void addInfor(Scanner sc) {
        super.addInfor(sc);
        soNamKinhNghiem = InputValidator.getInt(sc, "Nhập số năm kinh nghiệm: ", 1, 40);
    }

    public void showInfor() {
        super.showInfor();
        System.out.println("Số năm kinh nghiệm: " + soNamKinhNghiem);
    }
}