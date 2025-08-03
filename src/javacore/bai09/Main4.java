package javacore.bai09;

public class Main4 {
    public static void main(String[] args) {
        System.out.println("41. Hình chữ Z tạo bởi dấu *");
        System.out.println("Cách giải: in * cho hàng đầu và cuối, từ hàng 1 nếu j == 3||2||1 thì in * còn lại in space");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (i == 0 || i == 5 - 1 || j == 5 - i - 1) {
                    System.out.print("*");
                } else {
                    System.out.print(" ");
                }
            }
            System.out.println();
        }

        System.out.println("\n##############################\n");

        System.out.println("42. Hình chữ nhật chạy qua lại bên trong tạo bởi dấu *");
        System.out.println("Cách giải: in * cho hàng đầu và cuối, hàng lẻ == cột lẻ, hàng chẵn == cột chẵn thì in *");
        for (int i = 0; i < 6; i++) {
            for (int j = 0; j < 6; j++) {
                if (i == 0 || i == 6 - 1 || i % 2 == j % 2) {
                    System.out.print("*");
                } else {
                    System.out.print(" ");
                }

            }
            System.out.println();
        }

        System.out.println("\n##############################\n");
    }
}
