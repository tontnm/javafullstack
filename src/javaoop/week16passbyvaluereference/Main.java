package javaoop.week16passbyvaluereference;

public class Main {
    public int a = 0;

    public static void main(String[] args) {
        // truyền tham trị -> primitive type -> pass by value
        int x = 1;
        int y = tinhToan(x);
        System.out.println(x);
        System.out.println(y);

        // truyền tham chiếu
        Tam tam1 = new Tam();
        tam1.x = 1;
        System.out.println(tam1.tinhToan(tam1));
        System.out.println(tam1.x);
    }

    public static int tinhToan(int a) {
        a++;
        return a * 2;
    }
}

/**
 * Có 3 khái niệm liên quan đến tham số của hàm
 * - Tham trị (pass by value): Giá trị tham số truyền vào ko bị thay đổi sau khi
 * kết thúc hàm.
 * - Tham biến (): Giá trị tham số truyền vào bị thay đổi sau khi kết thúc hàm
 * - Tham chiếu (pass by reference): Giá trị tham số truyền vào là 1 tham chiếu
 * (tức là
 * 1 biến tham chiếu, hoặc là 1 con trỏ). Chúng ta không thể thay đổi giá trị
 * của biến
 * tham chiếu. Nghĩa là nếu biến tham chiếu đang trỏ đến 1 đối tượng, sau đó,
 * bên trong
 * hàm chúng ta bắt nó trỏ đến 1 đối tượng khác, thì kết thúc hàm nó sẽ quay lại
 * trỏ đến
 * đối tượng mà nó đã trỏ lúc chưa vào hàm. Tuy nhiên, chúng ta lại có thể thay
 * đổi nội
 * dung của đối tượng mà biến tham chiếu đang trỏ đến. Chính vì thế, nhiều người
 * nhầm
 * tưởng là chúng ta truyền tham số kiểu tham chiếu thì chúng ta có thể thay đổi
 * đc giá
 * trị. Ko phải vậy, con trỏ của chúng ta vẫn trỏ đến đối tượng ban đầu, ko thay
 * đổi đc,
 * nhưng nội dung của đối tượng đó có thể thay đổi sau khi ra khỏi hàm.
 */