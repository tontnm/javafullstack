package javaoop.week14exception;

public class Day2 {
    public static void main(String[] args) {
        // xem hàm main như là thằng ngồi sau
        // ham main sẽ sử dụng 1 dịch vụ do ngồi trc cung cấp tên là omBung
        try {
            omBung();
        } catch (NullPointerException e) {
            System.out.println("Ngồi sau đã bắt");
        }

    }

    public static void omBung() throws NullPointerException, NumberFormatException {
        // ôm bụng xem như thằng ngồi trc
        String a = null;
        System.out.println(a.charAt(0));
        System.out.println("thằng ngồi trc đã né cục gạch");
        System.out.println("vẫn đến đây");
    }
}
