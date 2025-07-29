package javaoop.week11nullpointerexception;

public class Main {
    public static void main(String[] args) {
        String a = "a";
        a.concat("b");
        System.out.println(a); // a
        // vẫn có đối tượng mới đc tạo ra
        // do chúng ta gọi hàm concat
        // nhưng biến tham chiếu a vẫn trỏ đến đối tượng cũ

        a = a.concat("b");
        System.out.println(a); // ab
        // biến tham chiếu a trỏ đến đối tượng mới
        // nghĩa là hàm concat tạo ra 1 đối tượng mới
        // và biến tham chiếu a trỏ đến đối tượng mới đó

        // vì sao Java nó cố tình làm cho các đối tượng của Class String là bất biến?
        // chúng ta mới chỉ nhìn thấy nhược điểm của nó chưa thấy được ưu điểm của cách
        // hành xử này

        // String sql = "SELECT * FROM "+ tablenName + " WHERE id=" + id;
        // viết ntn nghĩa là chúng ta đã tạo ra bao nhiêu đối tượng của lớp String rồi?
        // chúng ta đã vô tình tạo ra 4 đối tượng của class String
        // trong khi đó chúng ta chỉ sử dụng đúng 1 đối tượng duy nhất đó là đối tượng
        // sau cùng
        // nghĩa là chúng ta đã tạo ra đc 3 đối tượng rác trong bộ nhớ
        // vừa lãng phí, vừa làm giảm hiệu xuất

        String c = "a";
        String d = "a";

        // equals vs ==

        // equals là so sánh nội dung của đối tượng String
        // == là so sánh địa chỉ của 2 biến tham chiếu đến đối tượng của class String

        System.out.println(c.equals(d));
        // kiểm tra thử đối tượng do a tham chiếu đến có nội dung giống
        // với đối tượng do b tham chiếu đến hay ko

        System.out.println(c == d);
        // kiểm tra thử 2 biến tham chiếu a và b
        // có đang cùng trỏ (tham chiếu) đến cùng 1 đối tượng hay ko?

        // ra kết quả là true true
        // nghĩa là d số 30 và 31
        // chỉ sinh ra 1 đối tượng String duy nhất, chứa chữ a.

        // Java sinh ra cơ chế bất biến cho các đối tượng String
        // để tiết kiệm bộ nhớ, cho các chuỗi có nội dung giống nhau
        // tức là, nếu người dùng khai báo các chuỗi có nội dung y hệt nhau,
        // thì Java nó sẽ ko tạo ra đối tượng String mới, mà tận dụng lại đối tượng
        // String cũ
        // ý tưởng này lúc đầu nghe rất là tuyệt vời, nhưng sau đó thì Java nó phát hiện
        // là nó bị sai rồi, nên nó sửa sai bằng cách tạo ra StringBuffer và
        // StringBuilder

        String e = "a";
        String f = new String("a");
        System.out.println(e.equals(f));
        System.out.println(e == f);

        StringBuffer sb = new StringBuffer("a");
        sb.append("b");
        System.out.println(sb);

        StringBuilder sb2 = new StringBuilder("a");
        sb2.append("b");
        System.out.println(sb2);

        StringBuffer sql = new StringBuffer("SELECT * FROM").append("abc").append(" WHERE id=").append("1");
    }
}

/**
 * 1. khi nào thì xảy ra NullPointerException?
 * - Khi bạn cố gắng truy cập một phương thức hoặc thuộc tính của một object
 * thông qua con trỏ. Mà con trỏ đó đang bị null.
 * - Ví dụ: String str = null; str.length(); // NullPointerException
 * 
 * 2. Đoạn code sau có throw NullPointerException không? Giải thích vì sao?
 * String a;
 * a = a.substring(0, 5);
 * - bị lỗi Runtime, nếu a = null thì sẽ throw NullPointerException.
 * 
 * 3.Đoạn code sau có throw NullPointerException không? Giải thích vì sao?
 * ArrayList<String> list = new ArrayList<>();
 * list.add("Hello");
 * System.out.println(list.get(1));
 * - Không throw NullPointerException, nhưng sẽ throw IndexOutOfBoundsException
 * 
 * 4. Đoạn code sau có throw NullPointerException không? Giải thích vì sao?
 * ArrayList<SinhVien> list = new ArrayList<>();
 * SinhVien sv;
 * list.add(sv);
 * SinhVien svout = list.get(0);
 * System.out.println(svout.getName());
 * - Có, vì bạn đang cố gắng truy cập phương thức null.getName().
 * 
 * 5. Đoạn code sau có throw NullPointerException không? Giải thích vì sao?
 * String a = null;
 * a = a + "Hello";
 * System.out.println(a);
 * - Không throw NullPointerException, nhưng sẽ tạo ra một chuỗi mới "Hello".
 * 
 * 6.
 * String a = null;
 * int x = a.indexOf("H");
 * System.out.println(x);
 * ---------------------------------
 * String a = null;
 * int x = (a == null) ? -1 : a.indexOf("H");
 * System.out.println(x);
 * 
 * 7.
 * 
 * 8.
 * String a;
 * if(a.equals("Hello")){
 * System.out.println("a bang Hello");
 * }
 * ---------------------------------
 * String a;
 * if ("Hello".equals(a)) {
 * System.out.println("a bang Hello");
 * }
 * 
 * 9.
 * ArrayList<GiaoVien> list = new ArrayList<>();
 * GiaoVien gv = new GiaoVien();
 * list.add(gv);
 * System.out.println(list.get(0).getName().toString());
 * 
 * có thể có nullPointerException nếu getName() trả về null.
 */
