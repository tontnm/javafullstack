package javacore.bai09;

public class Main1 {
    public static void main(String[] args) {
        System.out.println("11. 1,3,5,7,9,...,n dùng while, cách 2");
        int c3 = 1;
        while (c3 < 10) {
            if (c3 % 2 != 0) {
                System.out.print(c3 + " ");
            }
            c3++;
        }
        System.out.println("\n##############################\n");

        System.out.println("12. 1,2,3,5,8,13...,n dùng while");
        int a = 1, b = 2;
        int c4 = 1;
        int temp = 0;
        System.out.print(a + " ");
        while (c4 < 10) {
            System.out.print(b + " ");
            temp = a + b;
            a = b;
            b = temp;
            c4++;
        }
        System.out.println("\n##############################\n");

        System.out.println("13. 1,2,3,5,8,13...,n dùng for");
        a = 1;
        b = 2;
        System.out.print(a + " ");
        for (int i = 1; i < 10; i++) {
            System.out.print(b + " ");
            temp = a + b;
            a = b;
            b = temp;
        }
        System.out.println("\n##############################\n");

        System.out.println("14. 1,3,7,15,31,...,n dùng while");
        int c5 = 1;
        int sum3 = 1;
        while (c5 < 7) {
            System.out.print(sum3 + " ");
            sum3 = (sum3 * 2) + 1;
            c5++;
        }
        System.out.println("\n##############################\n");

        System.out.println("15. 1,-3,7,-15,31,...,n dùng while");
        int c6 = 1;
        int sum4 = 1;
        while (c6 < 7) {
            if (c6 % 2 == 0) {
                System.out.print((sum4 * -1) + " ");
            } else {
                System.out.print(sum4 + " ");
            }
            sum4 = (sum4 * 2) + 1;
            c6++;
        }
        System.out.println("\n##############################\n");

        System.out.println("16. m = 234 => S = 2 + 3 + 4 = 9, S = 2 * 3 * 4 = 24");
        int s1 = 0;
        int s2 = 1;
        int n = 234;
        int digit = 0;
        while (n > 0) {
            digit = n % 10;
            s1 += digit;
            s2 *= digit;
            n = n / 10;
        }
        System.out.println("s1=" + s1 + ", s2=" + s2);
        System.out.println("\n##############################\n");

        System.out.println("17. a=1, b=2, USCLN(GCD)=?, BSCNN(LCM)=?");
        int a1 = 7, b1 = 3, temp1 = 0;
        int originalA1 = a1, originalB1 = b1;
        while (b1 != 0) {
            temp1 = b1;
            b1 = a1 % b1;
            a1 = temp1;
        }
        int uscln = a1;
        int bscnn = (originalA1 * originalB1) / uscln;
        System.out.println("a=7, b=3, USCLN(GCD)=" + uscln + ", BSCNN(LCM)=" + bscnn);
        System.out.println("\n##############################\n");

        System.out.println("18. Nested Loop 1");
        for (int i = 1; i < 5; i++) {
            for (int j = 1; j < 5; j++) {
                System.out.println("i=" + i + ",\tj=" + j);
            }
        }
        System.out.println("\n##############################\n");

        System.out.println("19. Nested Loop 2");
        for (int i = 1; i < 5; i++) {
            for (int j = 5; j >= 1; j--) {
                System.out.println("i=" + i + ",\tj=" + j);
            }
        }
        System.out.println("\n##############################\n");

        System.out.println("20. Nested Loop 3");
        for (int i = 1; i < 5; i++) {
            for (int j = 1; j < 5; j += 2) {
                System.out.println("i=" + i + ",\tj=" + j);
            }
        }
        System.out.println("\n##############################\n");

    }
}
