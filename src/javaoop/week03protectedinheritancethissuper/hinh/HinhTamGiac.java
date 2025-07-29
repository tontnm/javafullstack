package javaoop.week03protectedinheritancethissuper.hinh;

public class HinhTamGiac extends Hinh {
    private double canhA;
    private double canhB;
    private double canhC;

    public HinhTamGiac() {
    }

    public HinhTamGiac(String mauVien, String mauNen, double canhA, double canhB, double canhC) {
        this.setMauVien(mauVien);
        this.setMauNen(mauNen);
        this.canhA = canhA;
        this.canhB = canhB;
        this.canhC = canhC;
    }

    public void showMe() {
        System.out.println("--- Thông tin hình Tam Giác ---");
        System.out.println("Màu viền: " + this.getMauVien() + ". Màu nền: " + this.getMauNen() + ".");
        System.out.println("Độ dài các cạnh: " + canhA + "," + canhB + "," + canhC);
        System.out.printf("Chu vi: %.2f\n", chuVi());
        System.out.printf("Diện tích: %.2f\n", dienTich());
    }

    public double chuVi() {
        return canhA + canhB + canhC;
    }

    public double dienTich() {
        double p = chuVi() / 2;
        return Math.sqrt(p * (p - canhA) * (p - canhB) * (p - canhC));
    }

    public double getCanhA() {
        return canhA;
    }

    public void setCanhA(double canhA) {
        this.canhA = canhA;
    }

    public double getCanhB() {
        return canhB;
    }

    public void setCanhB(double canhB) {
        this.canhB = canhB;
    }

    public double getCanhC() {
        return canhC;
    }

    public void setCanhC(double canhC) {
        this.canhC = canhC;
    }

}
