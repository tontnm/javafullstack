package javaoop.week02accessmodifier.p1;

public class D extends C {
    public void C() {
        C cc = new C();

        // protected String a;
        cc.a = "a1";
        a = "a2";
        this.a = "a3";
        super.a = "a4";

        // String b;
        cc.b = "b1";
        b = "b2";
        this.b = "b3";
        super.b = "b4";

        // public String c;
        cc.c = "c1";
        c = "c2";
        this.c = "c3";
        super.c = "c4";

        // private String d;
        // cc.d = "d1"; // This line would cause an error because 'd' is private in C
        // d = "d2"; // This line would also cause an error because 'd' is private in C
        // this.d = "d3"; // This line would also cause an error because 'd' is private
        // in C
        // super.d = "d4"; // This line would also cause an error because 'd' is private
        // in C
    }
}
