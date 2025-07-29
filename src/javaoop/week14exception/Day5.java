package javaoop.week14exception;

public class Day5 {
    public static void main(String[] args) {
        try {
            omBung();
        } catch (Exception e) {
            System.out.println("");
        }
    }

    public static void omBung() throws MyException {
        // ôm bụng xem như thằng ngồi trc
        System.out.println("Thích thì chọi gạch chơi");
        throw new MyException();
    }
}
