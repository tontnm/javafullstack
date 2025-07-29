package javaoop.week03protectedinheritancethissuper.hinh;

public class HinhTamGiacCan extends HinhTamGiac {

    public HinhTamGiacCan(String mauVien, String mauNen, double canhA, double canhB, double canhC) {
        this.setMauVien(mauVien);
        this.setMauNen(mauNen);
        this.setCanhA(canhA);
        this.setCanhB(canhB);
        this.setCanhC(canhC);
    }

    public void showMe() {
        System.out.println("--- Thông tin Hình Tam Giác Cân ---");
        System.out.println("Màu viền: " + this.getMauVien() + ". Màu nền: " + this.getMauNen() + ".");
        System.out.println("Các cạnh: " + this.getCanhA() + ", " + this.getCanhB() + ", " + this.getCanhC());
        System.out.printf("Chu vi: %.2f\n", chuVi());
        double dt = dienTich();
        if (dt != -1) {
            System.out.printf("Diện tích: %.2f\n", dt);
        } else {
            System.out.println("Không phải tam giác cân!");
        }
    }

    public double dienTich() {
        if (this.getCanhA() == this.getCanhB()) {
            double h = Math.sqrt(this.getCanhA() * this.getCanhA() - (this.getCanhC() / 2) * (this.getCanhC() / 2));
            return 0.5 * this.getCanhC() * h;
        } else if (this.getCanhA() == this.getCanhC()) {
            double h = Math.sqrt(this.getCanhA() * this.getCanhA() - (this.getCanhB() / 2) * (this.getCanhB() / 2));
            return 0.5 * this.getCanhB() * h;
        } else if (this.getCanhB() == this.getCanhC()) {
            double h = Math.sqrt(this.getCanhB() * this.getCanhB() - (this.getCanhA() / 2) * (this.getCanhA() / 2));
            return 0.5 * this.getCanhA() * h;
        } else {
            return -1; // Không phải tam giác cân
        }
    }
}
