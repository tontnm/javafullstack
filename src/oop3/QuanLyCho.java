package oop3;

import java.util.ArrayList;
import java.util.Scanner;

public class QuanLyCho {
    private static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        menu();
        int luaChon = Integer.parseInt(sc.nextLine());

        switch (luaChon) {
            case 1:
                chucNang1();
                break;
            case 2:
                chucNang2();
                break;
            default:
                System.out.println("Lựa chọn không hợp lệ.");
                break;
        }
    }

    private static void chucNang2() {
        int n = nhapSoLuongCho();
        ArrayList<ChoNha> dsChoNha = new ArrayList<>();
        ArrayList<ChoPhap> dsChoPhap = new ArrayList<>();
        ArrayList<ChoNhat> dsChoNhat = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            System.out.println("Chọn loại chó:");
            System.out.println("1.Chó Nhà");
            System.out.println("2.Chó Pháp");
            System.out.println("3.Chó Nhật");
            int loaiCho = Integer.parseInt(sc.nextLine());

            switch (loaiCho) {
                case 1:
                    // upcasting từ ChoNha -> Cho
                    dsChoNha.add(new ChoNha("Lu"));
                    thongBaoThanhCong("Chó nhà");
                    break;
                case 2:
                    // upcasting từ ChoPhap -> Cho
                    dsChoPhap.add(new ChoPhap("Michi"));
                    thongBaoThanhCong("Chó pháp");
                    break;
                case 3:
                    // upcasting từ ChoNhat -> Cho
                    dsChoNhat.add(new ChoNhat("Yuki"));
                    thongBaoThanhCong("Chó nhật");
                    break;
                default:
                    System.out.println("Ko hop le");
                    break;
            }
        }

        System.out.println("Thông tin của các con chó và chức năng của chúng");
        xuatThongTinCho(dsChoNha);
        xuatThongTinCho(dsChoPhap);
        xuatThongTinCho(dsChoNhat);
    }

    private static void xuatThongTinCho(ArrayList<? extends Cho> loaiCho) {
        for (Cho cho : loaiCho) {
            if (cho != null) {
                cho.sua();
            }
        }
    }

    // --- CHƯƠNG TRÌNH 1: Dùng 1 ArrayList ---
    private static void chucNang1() {
        int n = nhapSoLuongCho();
        ArrayList<Cho> dsCho = new ArrayList<>();

        for (int i = 0; i < n; i++) {
            System.out.println("Chọn loại chó:");
            System.out.println("1.Chó Nhà");
            System.out.println("2.Chó Pháp");
            System.out.println("3.Chó Nhật");
            int loaiCho = Integer.parseInt(sc.nextLine());

            switch (loaiCho) {
                case 1:
                    // upcasting từ ChoNha -> Cho
                    dsCho.add(new ChoNha("Lu"));
                    thongBaoThanhCong("Chó nhà");
                    break;
                case 2:
                    // upcasting từ ChoPhap -> Cho
                    dsCho.add(new ChoPhap("Michi"));
                    thongBaoThanhCong("Chó pháp");
                    break;
                case 3:
                    // upcasting từ ChoNhat -> Cho
                    dsCho.add(new ChoNhat("Yuki"));
                    thongBaoThanhCong("Chó nhật");
                    break;
                default:
                    System.out.println("Ko hop le");
                    break;
            }
        }

        System.out.println("Thông tin của các con chó và chức năng của chúng");
        for (Cho cho : dsCho) {
            if (cho != null) {
                if (cho instanceof ChoNha) {
                    cho.sua();
                    ChoNha choNha = (ChoNha) cho;
                    choNha.danhHoiTimToiPham();
                } else if (cho instanceof ChoNhat) {
                    cho.sua();
                } else if (cho instanceof ChoPhap) {
                    cho.sua();
                    ChoPhap choPhap = (ChoPhap) cho;
                    choPhap.danhHoiTimToiPham();
                }
            }
        }
    }

    private static void thongBaoThanhCong(String msg) {
        System.out.println(msg + " nhập thành công.");
    }

    private static int nhapSoLuongCho() {
        System.out.print("Nhập số lượng chó muốn quản lý: ");
        return Integer.parseInt(sc.nextLine());
    }

    public static void menu() {
        System.out.println("Chọn chức năng:");
        System.out.println("1. Yêu cầu 1 (Dùng 1 ArrayList, gọi sủa và đánh hơi)");
        System.out.println("2. Yêu cầu 2 (Dùng 3 ArrayList, gọi sủa theo thứ tự)");
        System.out.print("Lựa chọn của bạn: ");
    }
}
