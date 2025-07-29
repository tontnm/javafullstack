package javaoop.week02accessmodifier.p2;

import javaoop.week02accessmodifier.p1.C;

public class D1 extends C {
    public D1() {
        C cc = new C(); // class D nhìn thấy được class C

        // protected String a;
        // cc.a = "a1"; // lỗi
        a = "a2"; // truy cập đến biến a của chính class D1
        this.a = "a3"; // truy cập đến biến a của chính class D1
        super.a = "a4"; // truy cập đến biến a của chính class D1

        // String b;
        // cc.b = "b1"; // lỗi
        // b = "b2"; // lỗi
        // this.b = "b3"; // lỗi
        // super.b = "b4"; // lỗi

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
