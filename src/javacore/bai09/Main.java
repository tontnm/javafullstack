package javacore.bai09;

public class Main {
    public static void main(String[] args) {
        System.out.println("Dãy số 1,2,3,4,5...,n");
        for (int i = 1; i < 10; i++) {
            System.out.print(i + " ");
        }
        System.out.println();

        System.out.println("Dãy số 1,3,5,7,9...,n");
        for (int i = 1; i < 10; i += 2) {
            System.out.print(i + " ");
        }
        System.out.println();

        System.out.println("Dãy số 2,4,6,8,10...,n");
        for (int i = 2; i < 10; i += 2) {
            System.out.print(i + " ");
        }
        System.out.println();

        System.out.println("S = 1+2+3+...+n");
        int sum1 = 0;
        for (int i = 1; i < 10; i++) {
            sum1 += i;
        }
        System.out.println("S=" + sum1);

        System.out.println("S = 1+1/2+1/3+...+1/n");
        double sum2 = 0;
        for (double i = 1; i < 10; i++) {
            sum2 += ((double) 1) / i;
        }
        System.out.println("S=" + sum2);

        System.out.println("Dãy số 2,-4,6,-8,10,...,n");
        int sign = 1;
        for (int i = 1; i < 10; i++) {
            System.out.print(2 * i * sign + " ");
            sign *= -1;
        }
        System.out.println();

        System.out.println("Dãy số 2,-4,6,-8,10,...,n");
        for (int i = 1; i < 10; i++) {
            if (i % 2 != 0) {
                System.out.print(2 * i + " ");
            } else {
                System.out.print(-2 * i + " ");
            }
        }
        System.out.println();

        System.out.println("Giai thừa của 5");
        int result = 1;
        for (int i = 5; i >= 1; i--) {
            result *= i;
        }
        System.out.println("result=" + result);

        System.out.println("1,2,3,4,...,n dùng while");
        int c1 = 1;
        while (c1 < 5) {
            System.out.print(c1 + " ");
            c1++;
        }
        System.out.println();

        System.out.println("1,3,5,7,9,...,n dùng while, cách 1");
        int c2 = 1;
        while (c2 < 10) {
            System.out.print(c2 + " ");
            c2 += 2;
        }
        System.out.println();

        System.out.println("1,3,5,7,9,...,n dùng while, cách 2");
        int c3 = 1;
        while (c3 < 10) {
            if (c3 % 2 != 0) {
                System.out.print(c3 + " ");
            }
            c3++;
        }
        System.out.println();

        System.out.println("1,2,3,5,8,13...,n dùng while");
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
        System.out.println();

        System.out.println("1,2,3,5,8,13...,n dùng for");
        a = 1;
        b = 2;
        System.out.print(a + " ");
        for (int i = 1; i < 10; i++) {
            System.out.print(b + " ");
            temp = a + b;
            a = b;
            b = temp;
        }
        System.out.println();

        System.out.println("1,3,7,15,31,...,n dùng while");
        int c5 = 1;
        int sum3 = 1;
        while (c5 < 7) {
            System.out.print(sum3 + " ");
            sum3 = (sum3 * 2) + 1;
            c5++;
        }
        System.out.println();

        System.out.println("1,-3,7,-15,31,...,n dùng while");
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
        System.out.println();
    }
}
