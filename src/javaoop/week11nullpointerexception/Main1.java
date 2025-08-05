package javaoop.week11nullpointerexception;

public class Main1 {
    public static void main(String[] args) {
        System.out.println(
                "1.Cho chuỗi “Hello World”   Lấy ra chữ World bằng cách dùng StringBuffer và StringBuilder");
        StringBuffer sbf = new StringBuffer("Hello World");
        StringBuilder sbd = new StringBuilder("Hello World");

        String result1 = sbf.substring(6); // từ vị trí 6 đến hết
        String result2 = sbd.substring(6);

        System.out.println("StringBuffer: " + result1); // World
        System.out.println("StringBuilder: " + result2); // World

        System.out.println("\n############################################\n");

        System.out.println(
                "2.Cho chuỗi “Hello World”  Thay o thành f bằng cách dùng StringBuffer và StringBuilder.");
        for (int i = 0; i < sbf.length(); i++) {
            if (sbf.charAt(i) == 'o') {
                sbf.setCharAt(i, 'f');
            }
        }

        for (int i = 0; i < sbd.length(); i++) {
            if (sbd.charAt(i) == 'o') {
                sbd.setCharAt(i, 'f');
            }
        }

        System.out.println("StringBuffer: " + sbf); // Hellf Wfrld
        System.out.println("StringBuilder: " + sbd); // Hellf Wfrld

        System.out.println("\n############################################\n");

        System.out.println(
                "3.Cho chuỗi “Hello” và chuỗi “World”  Nối 2 chuỗi này bằng cách dùng String object, StringBuffer và StringBuilder.");
        String s1 = "Hello";
        String s2 = "World";

        // String
        String result3 = s1 + " " + s2;

        // StringBuffer
        StringBuffer sbf1 = new StringBuffer(s1);
        sbf1.append(" ").append(s2);

        // StringBuilder
        StringBuilder sbd1 = new StringBuilder(s1);
        sbd1.append(" ").append(s2);

        System.out.println("String: " + result3); // Hello World
        System.out.println("StringBuffer: " + sbf1); // Hello World
        System.out.println("StringBuilder: " + sbd1); // Hello World

        System.out.println("\n############################################\n");

        System.out.println("4. Đoạn code tạo bao nhiêu đối tượng và kết quả là gì");
        String a = "A"; // 1 đối tượng trong pool
        String b = new String("A"); // 1 đối tượng mới trong heap
        String c = "A"; // trỏ đến cùng đối tượng với a
        b.concat("B"); // tạo chuỗi mới "AB" nhưng không gán
        String d = c.concat("C"); // tạo chuỗi mới "AC"
        StringBuffer e = new StringBuffer("E"); // đối tượng mới
        e.append("F"); // thay đổi nội dung thành "EF"
        StringBuilder g = new StringBuilder("G"); // đối tượng mới
        g.append("H"); // thay đổi nội dung thành "GH"

        System.out.println(a + b + c + d + e + g);

        System.out.println("\n############################################\n");

        System.out.println(
                "5.Viết chương trình phân biệt sự khác nhau giữa so sánh bằng method equals và so sánh bằng toán tử == khi sử dụng String object, StringBuffer và StringBuilder");
        // String
        String s5 = "Hello";
        String s6 = new String("Hello");

        System.out.println("String equals: " + s5.equals(s6)); // true (so sánh nội dung)
        System.out.println("String ==: " + (s5 == s6)); // false (so sánh địa chỉ)

        // StringBuffer
        StringBuffer sb5 = new StringBuffer("Hello");
        StringBuffer sb6 = new StringBuffer("Hello");

        System.out.println("StringBuffer equals: " + sb5.equals(sb6)); // false (không override equals)
        System.out.println("StringBuffer ==: " + (sb5 == sb6)); // false

        // StringBuilder
        StringBuilder sbd5 = new StringBuilder("Hello");
        StringBuilder sbd6 = new StringBuilder("Hello");

        System.out.println("StringBuilder equals: " + sbd5.equals(sbd6)); // false
        System.out.println("StringBuilder ==: " + (sbd5 == sbd6)); // false
        System.out.println("\n############################################\n");

        System.out.println("StringBuffer -> toString -> equals: " + sb5.toString().equals(sb6.toString())); // ✅ true
        System.out.println("StringBuilder -> toString -> equals: " + sbd5.toString().equals(sbd6.toString())); // ✅ true

    }
}
