package javaoop.week16passbyvaluereference;

public class Tam {
    public int x = 0;

    public int tinhToan(Tam tam) {
        Tam tam2 = new Tam();
        tam = tam2;
        tam2.x = 2;
        return tam2.x * 2;
    }
}
