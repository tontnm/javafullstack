package javacore.bai09;

public class Main2 {
    public static void main(String[] args) {
        System.out.println("21. Nested Loop 4");
        for (int i = 1; i < 5; i++) {
            for (int j = 1; j < 5; j += 2) {
                for (int k = 1; k < 5; k++) {
                    System.out.println("i=" + i + ",\tj=" + j + ",\tk=" + k);
                }
            }
        }
        System.out.println("\n##############################\n");

        System.out.println("22. S = 1 + 1/2! + 1/3! ... 1/n!, cách 2 for rườm rà");
        double sum5 = 0, sum6 = 0;
        int f = 1;
        for (int i = 1; i <= 5; i++) {
            f = 1;
            for (int j = 1; j <= i; j++) {
                f *= j;
            }
            sum5 += ((double) 1) / f;
            sum6 += 1 / f;
        }
        System.out.println("S=" + sum5);
        System.out.println("S=" + sum6);
        System.out.println("\n##############################\n");

        System.out.println("23. S = 1 + 1/2! + 1/3! ... 1/n!, cách nhanh");
        double sum7 = 1;
        double f1 = 1;
        for (int i = 2; i <= 5; i++) {
            f1 *= i;
            sum7 += ((double) 1) / f1;
        }
        System.out.println("S=" + sum7);
        System.out.println("\n##############################\n");

        System.out.println("24. S = 1 + 1/3! + 1/5! ... 1/(2n-1)!, dùng 2 for");
        double sum8 = 0;
        int fac = 1;
        for (int i = 1; i <= (2 * 5) - 1; i += 2) {
            fac = 1;
            for (int j = 1; j <= i; j++) {
                fac *= j;
            }
            sum8 += ((double) 1) / fac;
        }
        System.out.println("s=" + sum8);
        System.out.println("\n##############################\n");

        System.out.println("25. S = 1 + 1/3! + 1/5! ... 1/(2n-1)!, dùng 2 for");
        double sum9 = 0;
        int fac1 = 1;
        int currentIndex = 1;
        for (int i = 1; i <= 5; i++) {
            int target = 2 * i - 1;
            for (int j = currentIndex + 1; j <= target; j++) {
                fac1 *= j;
            }
            currentIndex = target;
            sum9 += ((double) 1) / fac1;
        }
        System.out.println("s=" + sum9);
        System.out.println("\n##############################\n");

        System.out.println("26. Hình Vuông tạo bởi chữ A");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                System.out.print("A");
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("27. Hình Vuông tạo bởi chữ AA, BB");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (i % 2 == 0) {
                    System.out.print("A");
                } else {
                    System.out.print("B");
                }
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("28. Hình Vuông tạo bởi chữ AB");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (j % 2 == 0) {
                    System.out.print("A");
                } else {
                    System.out.print("B");
                }
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("29. Hình Vuông tạo bởi dấu *");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
        System.out.println("\n##############################\n");

        System.out.println("30. Hình Vuông tạo bởi dấu * rỗng ruột");
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if (i == 0 || i == 5 - 1 || j == 0 || j == 5 - 1) {
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
