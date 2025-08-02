package javacore.bai09;

public class Main {
    public static void main(String[] args) {
        System.out.println("1. Dãy số 1,2,3,4,5...,n");
        for (int i = 1; i < 10; i++) {
            System.out.print(i + " ");
        }
        System.out.println("\n##############################\n");

        System.out.println("2. Dãy số 1,3,5,7,9...,n");
        for (int i = 1; i < 10; i += 2) {
            System.out.print(i + " ");
        }
        System.out.println("\n##############################\n");

        System.out.println("3. Dãy số 2,4,6,8,10...,n");
        for (int i = 2; i < 10; i += 2) {
            System.out.print(i + " ");
        }
        System.out.println("\n##############################\n");

        System.out.println("4. S = 1+2+3+...+n");
        int sum1 = 0;
        for (int i = 1; i < 10; i++) {
            sum1 += i;
        }
        System.out.println("S=" + sum1);
        System.out.println("\n##############################\n");

        System.out.println("5. S = 1+1/2+1/3+...+1/n");
        double sum2 = 0;
        for (double i = 1; i < 10; i++) {
            sum2 += ((double) 1) / i;
        }
        System.out.println("S=" + sum2);
        System.out.println("\n##############################\n");

        System.out.println("6. Dãy số 2,-4,6,-8,10,...,n");
        int sign = 1;
        for (int i = 1; i < 10; i++) {
            System.out.print(2 * i * sign + " ");
            sign *= -1;
        }
        System.out.println("\n##############################\n");

        System.out.println("7. Dãy số 2,-4,6,-8,10,...,n");
        for (int i = 1; i < 10; i++) {
            if (i % 2 != 0) {
                System.out.print(2 * i + " ");
            } else {
                System.out.print(-2 * i + " ");
            }
        }
        System.out.println("\n##############################\n");

        System.out.println("8. Giai thừa của 5");
        int result = 1;
        for (int i = 5; i >= 1; i--) {
            result *= i;
        }
        System.out.println("result=" + result);
        System.out.println("\n##############################\n");

        System.out.println("9. 1,2,3,4,...,n dùng while");
        int c1 = 1;
        while (c1 < 5) {
            System.out.print(c1 + " ");
            c1++;
        }
        System.out.println("\n##############################\n");

        System.out.println("10. 1,3,5,7,9,...,n dùng while, cách 1");
        int c2 = 1;
        while (c2 < 10) {
            System.out.print(c2 + " ");
            c2 += 2;
        }
        System.out.println("\n##############################\n");

    }
}
