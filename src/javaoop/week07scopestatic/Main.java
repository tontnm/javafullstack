package javaoop.week07scopestatic;

public class Main {

    public static void main(String[] args) {
        Tam tam1 = new Tam();
        Tam tam2 = new Tam();

        tam1.x = 20; // Changing the static variable using tam1
        System.out.println("tam2.x: " + tam2.x); // Output: 20

        tam2.x = 30; // Changing the static variable using tam2
        System.out.println("tam1.x: " + tam1.x); // Output: 30
        System.out.println("tam2.x: " + tam2.x); // Output: 30
        System.out.println("Tam.x: " + Tam.x); // Output: 30, since x is static and shared across all instances

        // biến static x là biến chung của tất cả các đối tượng Tam
        // khi thay đổi giá trị của x thông qua một đối tượng, tất cả các đối tượng khác
        // sẽ thấy sự thay đổi này.
        // Điều này là do biến static được lưu trữ trong bộ nhớ tĩnh, không phải trong
        // bộ nhớ của từng đối tượng riêng lẻ.
    }
}

/**
 * https://viettuts.vn/java/bien-trong-java
 * Static Context:
 * - Static chỉ chơi với 2 cái:
 * 1. Static chỉ chơi với static.
 * 2. tôi là static, a muốn chơi với tôi thì a phải thông qua object của tôi.
 * 
 * kết nối database không sử dụng hàm static
 */