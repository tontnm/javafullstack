package javacore.bai09;

public class Main3 {
    public static void main(String[] args) {
        System.out.println("31. Hình chữ C tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (i == 0 || i == 5 - 1 || j == 0) {
                    System.out.print("*");
                }
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("32. Hình chữ C ngược tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (i == 0 || i == 5 - 1 || j == 5 - 1) {
                    System.out.print("*");
                } else {
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("33. Hình chữ U tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (i == 5 - 1 || j == 0 || j == 5 - 1) {
                    System.out.print("*");
                } else {
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("34. Hình tam giác tựa trái tạo bởi dấu *");
        for (int i = 1; i <= 5; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("35. Hình tam giác ngược tựa trái tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 5 - i; j >= 1; j--) {
                System.out.print("*");
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("36. Hình tam giác tựa phải tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 5; j > i; j--) {
                System.out.print(" ");
            }
            for (int j = 0; j <= i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");
        System.out.println("37. Hình tam giác ngược tựa phải tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print(" ");
            }
            for (int j = i + 1; j <= 5; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("38. Hình tam giác ngược rỗng ruột tựa trái tạo bởi dấu *");
        for (int i = 5; i >= 1; i--) {
            for (int j = 1; j <= i; j++) {
                if (i == 5 || j == 1 || j == i || i == 1) {
                    System.out.print("*");
                } else {
                    System.out.print(" ");
                }
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("38. Hình tam giác cân tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5 - i - 1; j++) { // * 5-i-1
                System.out.print(" ");
            }
            for (int j = 0; j < 2 * i + 1; j++) {
                System.out.print("*");
            }
            System.out.println();
        }

        System.out.println("\n##############################\n");

        System.out.println("39. Hình tam giác cân ngược tạo bởi dấu *");
        for (int i = 5; i >= 1; i--) {
            for (int j = 1; j <= 5 - i; j++) {
                System.out.print(" ");
            }
            for (int k = 1; k <= 2 * i - 1; k++) {
                System.out.print("*");
            }
            System.out.println();
        }

        System.out.println("\n##############################\n");
    }
}
