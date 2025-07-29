package javaoop.week14exception;

public class Day1 {
    public static void main(String[] args) {
        // xem hàm main như là thằng ngồi sau
        // ham main sẽ sử dụng 1 dịch vụ do ngồi trc cung cấp tên là omBung
        omBung();
    }

    public static void omBung() {
        // ôm bụng xem như thằng ngồi trc
        String a = null;
        try {
            System.out.println(a.charAt(0));
        } catch (NullPointerException e) {
            System.out.println("thằng ngồi trc đã chụp cục gạch");
        }
    }
}
