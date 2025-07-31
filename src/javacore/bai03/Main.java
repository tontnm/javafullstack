package javacore.bai03;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nhập 1 số: ");
        int n = Integer.parseInt(sc.nextLine());
        System.out.println("Số vừa nhập vào nhân với 2 có kết quả như dưới đây");
        System.out.println("result=" + (n * 2));
        System.out.println("Xác định số vừa nhập là chẳn hay lẻ");
        if (n % 2 == 0) {
            System.out.println("Đây là số chẵn");
        } else {
            System.out.println("Đây là số lẻ");
        }
        System.out.println("Chu vi: " + (2 * n * 3.1416));
        System.out.println("Diện tích: " + (3.1416 * n * n));

        int a = 1;
        int b = 2;

        a += b; // 3
        System.out.println(a);
        b -= a; // -1
        System.out.println(b);
        a *= b; // -3
        System.out.println(a);
        b /= a; // 0
        System.out.println(b);
        a++; // -2
        System.out.println(a);
        b--; // -1
        System.out.println(b);
        ++a; // -1
        System.out.println(a);
        --b; // -2
        System.out.println(b);

        if (n == 1) {
            System.out.println("one");
        }
        if (n == 2) {
            System.out.println("two");
        }
        if (n == 3) {
            System.out.println("three");
        }
        if (n == 4) {
            System.out.println("four");
        }
        if (n == 5) {
            System.out.println("five");
        }

        if (n == 1) {
            System.out.println("one");
        } else if (n == 2) {
            System.out.println("two");
        } else if (n == 3) {
            System.out.println("three");
        } else if (n == 4) {
            System.out.println("four");
        } else if (n == 5) {
            System.out.println("five");
        } else {
            System.out.println("ko phai so tu 1 den 5");
        }

        if (n == 1) {
            System.out.println("one");
        } else {
            if (n == 2) {
                System.out.println("two");
            } else {
                if (n == 3) {
                    System.out.println("three");
                } else {

                }
                if (n == 4) {
                    System.out.println("four");
                } else {
                    if (n == 5) {
                        System.out.println("five");
                    } else {
                        System.out.println("khong phai so tu 1 den 5");
                    }
                }

            }
        }

        switch (n) {
            case 1:
                System.out.println("one");
                break;
            case 2:
                System.out.println("two");
                break;
            case 3:
                System.out.println("three");
                break;
            case 4:
                System.out.println("four");
                break;
            case 5:
                System.out.println("five");
                break;
            default:
                System.out.println("khong phai so tu 1 den 5");
                break;
        }

        boolean a1 = true && false; // false
        boolean b1 = (3 > 100) || (25 % 5 == 0); // true
        boolean c = a1 && b1; // false
        boolean d = a1 || !b1; // false
        boolean e = a1 || !b1 && c; // false
        boolean f = c && d && e; // false
        boolean g = (a1 == true) || (b1 == true) || (c == false) || (d == false); // true

        // Viết biểu thức phủ định của các biểu thức sau:
        // Biểu thức 1: (a > 0) //* a<=0
        // Biểu thức 2: (a > 0) && (b > 0) //* (a <= 0) || (b <= 0)
        // Biểu thức 3: (a > 0) || (b > 0) //* (a <= 0) && (b <= 0)
        // Biểu thức 4: ((a > 0) || (b > 0)) && (a > b) //* ((a <= 0) && (b <= 0)) || (a <= b)
        // Biểu thức 5: (a > 0) && (b > 0) || (a > b) //* (a <= 0) || (b <= 0) || (a <= b)

        int x1 = 1;
        int x2 = 3;
        int temp = 0;
        System.out.println("so truoc khi doi " + x1 + ", " + x2);
        temp = x1;
        x1 = x2;
        x2 = temp;
        System.out.println("so sau khi doi " + x1 + ", " + x2);

        /**
         *  - Học viên phải trên 16 tuổi
            - Hoặc đã hoàn thành bài kiểm tra đầu vào
            - Và chưa từng bị cấm trong hệ thống
            (age > 16 || passedTest) && !isBanned
            (age <= 16 && !passedTest) || isBanned -> "Tuổi nhỏ hơn hoặc chưa qua bài test hoặc bị cấm thì không được học."
         */
    }
}
