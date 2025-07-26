package oop.week03protectedinheritancethissuper.hinh;
public abstract class Hinh {
    private String mauVien;
    private String mauNen;

    public Hinh() {
    }

    public abstract double chuVi();
    public abstract double dienTich();

    public void showMe() {
        System.out.println("Màu viền: " + this.mauVien);
        System.out.println("Màu nền: " + this.mauNen);
    }

    public String getMauVien() {
        return mauVien;
    }

    public void setMauVien(String mauVien) {
        this.mauVien = mauVien;
    }

    public String getMauNen() {
        return mauNen;
    }

    public void setMauNen(String mauNen) {
        this.mauNen = mauNen;
    }

    
}
