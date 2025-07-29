package javaoop.quiz06;

public class D extends C {
    void m(D d) {
        System.out.print("D");
    }

    public static void main(String[] args) {
        A a = new A();
        B b = new B();
        C c = new C();
        D d = new D();
        d.m(a);
        d.m(b);
        d.m(c);

    }
}
