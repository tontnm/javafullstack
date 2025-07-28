package oop.week04overridethissuper;

import oop.week04overridethissuper.p1.A;
import oop.week04overridethissuper.p2.B;

public class Main {
    public static void main(String[] args) {
        B b = new B();
    }
}

/**
 * Override biến: a5, a6, a7, biến của con che khuất biến của cha mà nó copy đc
 * Ví dụ nốt ruồi
 * 
 * IS-A: ConNguoi là DongVat
 * HAS-A: ConNguoi có ConMat, Chan, String
 * 
 * IS-A và HAS-A là quan hệ giữa các lớp với nhau trong OOP.
 */