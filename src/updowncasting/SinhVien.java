package updowncasting;

import java.util.Scanner;

public class SinhVien extends HocVien {
    private String truongHoc;
    private double diemTrungBinh;

    public void addInfor(Scanner sc) {
        super.addInfor(sc);
        truongHoc = InputValidator.getString(sc, "Nhập trường học: ");
        diemTrungBinh = InputValidator.getDouble(sc, "Nhập điểm trung bình: ", 0, 10);
    }

    public void showInfor() {
        super.showInfor();
        System.out.println("Trường học: " + truongHoc);
        System.out.println("Điểm trung bình: " + diemTrungBinh);
    }
}