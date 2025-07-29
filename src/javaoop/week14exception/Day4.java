package javaoop.week14exception;

public class Day4 {
    public static void main(String[] args) {
        try {
            omBung();
        } catch (NullPointerException e) {
            System.out.println("Ngồi sau cũng cắn 1 miếng");
        }

        // 1 exception xuất hiện nhưng đc bắt 2 lần, trong dự án cũng hay dùng tình
        // huống này
        // ví dụ khi truy vấn sql bị sai, thì tầng xử lý db nó sẽ bắt exception
        // sau khi xử lý xong, tầng đó sẽ throw exception đã bắt được, để báo hiệu
        // cho tầng phía trên biết là đã có sự cố xuất hiện ở tầng database
        // tình huống số 4 này dùng để liên lạc giữa các tầng xử lý ở trong chương trình
        // thông qua cơ chế try catch exception
    }

    public static void omBung() throws NullPointerException {
        // ôm bụng xem như thằng ngồi trc
        String a = null;
        try {
            System.out.println(a.charAt(0));
        } catch (NullPointerException e) {
            System.out.println("thơm quá, ngồi trc cắn 1 miếng");
            throw e;
        }
    }
}
