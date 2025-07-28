package oop.week08final;

public class Main {
    public static void main(String[] args) {
        double d = 5.5;
        // float f = d; // Implicit conversion from double to float, may lose precision
        float f = (float) d; // Explicit conversion from double to float

        double x = 1;
        double y = 1.0;
        double z = 1.0d; // 'd' is optional for double literals
        double k = 1.0D; // 'D' is optional for double literals
        double p = 1.0F; // 'F' is for float, but can be assigned to double

        float l = 1;
        // float m = 1.0; // lỗi vì không tường minh
        float n = 1.0f; // 'd' is optional for double literals
        float o = 1.0F; // 'D' is optional for double literals
        // float q = 1.0D; // lỗi vì không tường minh

        int a = 3;
        int b = 2;
        double c = a / b;
        System.out.println(c); // Output: 1.0, because a and b are both integers, so the division is performed
                               // as integer division before being assigned to c

        double d1 = a / (double) b;
        double d2 = (double) a / b;
        System.out.println("d1: " + d1); // Output: 1.5
        System.out.println("d2: " + d2); // Output: 1.5, because one of the operands is cast to double, so the division
        // is performed as floating-point division
        // trong 1 biểu thức, nếu có ít nhất 1 toán hạng là double thì kết quả sẽ là
        // double

        double d3 = (double) (a / b);
        System.out.println("d3: " + d3); // Output: 1.0, because the division is performed as integer division first,
        // then cast to double

        double d4 = 1 / a / b;
        System.out.println("d4: " + d4); // Output: 0.0, because 1 is divided by a (3) and then by b (2)

        double d5 = 1.0 / a / b;
        System.out.println("d5: " + d5); // Output: 0.16666666666666666
    }
}

/**
 * Up casting: byte -> short -> int -> long -> float -> double
 * Down casting: double -> float -> long -> int -> short -> byte
 */