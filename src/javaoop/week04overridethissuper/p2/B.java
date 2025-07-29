package javaoop.week04overridethissuper.p2;

public class B extends javaoop.week04overridethissuper.p1.A {
    public String a5 = "a5_con";
    protected String a6 = "a6_con";;
    String a7 = "a7_con";
    private String a8 = "a8_con";

    public B() {
        System.out.println("a1=" + a1); // public
        System.out.println("this.a1=" + this.a1); // public
        System.out.println("super.a1=" + super.a1); // public
        System.out.println("a2=" + a2); // protected
        System.out.println("this.a2=" + this.a2); // protected
        System.out.println("super.a2=" + super.a2); // protected
        // System.out.println(a3); // default
        // System.out.println(this.a3); // default
        // System.out.println(super.a3); // default
        // System.out.println(a4); // private - không thể truy cập từ lớp con
        // System.out.println(this.a4); // private - không thể truy cập từ lớp con
        // System.out.println(super.a4); // private - không thể truy cập từ lớp con
        System.out.println("a5=" + a5); // public
        System.out.println("this.a5=" + this.a5); // public
        System.out.println("super.a5=" + super.a5); // public
        System.out.println("a6=" + a6); // protected
        System.out.println("this.a6=" + this.a6); // protected
        System.out.println("super.a6=" + super.a6); // protected
        System.out.println("a7=" + a7); // default
        System.out.println("this.a7=" + this.a7); // default
        // System.out.println(super.a7); // default
        System.out.println("a8=" + a8); // private - không thể truy cập từ lớp con
        System.out.println("this.a8=" + this.a8); // private - không thể truy cập từ lớp con
        // System.out.println(super.a8); // private - không thể truy cập từ lớp con
    }
}
