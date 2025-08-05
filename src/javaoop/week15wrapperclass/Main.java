package javaoop.week15wrapperclass;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Boxing: Là quá trình chuyển đổi thủ công một giá trị nguyên thủy thành một
        // đối tượng wrapper.
        int primitiveInt = 100;
        Integer wrapperInt = Integer.valueOf(primitiveInt); // Chuyển int thành Integer

        // Unboxing: Là quá trình chuyển đổi thủ công một đối tượng wrapper trở lại giá
        // trị nguyên thủy của nó.
        wrapperInt = Integer.valueOf(200);
        primitiveInt = wrapperInt.intValue(); // Chuyển Integer về lại int

        List<Integer> numbers = new ArrayList<>();

        // Auto-boxing: int (5) tự động chuyển thành Integer
        numbers.add(5);
        numbers.add(10);

        // Auto-unboxing: phần tử Integer đc tự động chuyển thành int
        int sum = numbers.get(0) + numbers.get(1);

        System.out.println("Tổng là: " + sum);
    }
}
