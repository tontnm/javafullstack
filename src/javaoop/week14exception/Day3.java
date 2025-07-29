package javaoop.week14exception;

public class Day3 {
    public static void main(String[] args) {
        omBung(); // ko bắt thì cục gạch sẽ văng vô mặt người sử dụng
    }

    public static void omBung() throws NullPointerException, NumberFormatException {
        // ôm bụng xem như thằng ngồi trc
        String a = null;
        System.out.println(a.charAt(0));
        System.out.println("thằng ngồi trc đã né cục gạch");
        System.out.println("vẫn đến đây");
    }
}
