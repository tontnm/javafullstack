package hinh;
public class HinhTamGiacVuong extends HinhTamGiac {

    public HinhTamGiacVuong(String mauVien, String mauNen, double canhA, double canhB, double canhC) {
        this.setMauVien(mauVien);
        this.setMauNen(mauNen);
        this.setCanhA(canhA);
        this.setCanhB(canhB);
        this.setCanhC(canhC);
    }

    private boolean laTamGiacVuong() {
        double a2 = this.getCanhA() * this.getCanhA();
        double b2 = this.getCanhB() * this.getCanhB();
        double c2 = this.getCanhC() * this.getCanhC();

        return ganBang(a2 + b2, c2) || ganBang(a2 + c2, b2) || ganBang(b2 + c2, a2);
    }

    private boolean ganBang(double x, double y) {
        return Math.abs(x - y) < 1e-6;
    }

    public double chuVi() {
        return this.getCanhA() + this.getCanhB() + this.getCanhC();
    }

    public double dienTich() {
        if (!laTamGiacVuong())
            return -1;

        if (ganBang(this.getCanhA() * this.getCanhA() + this.getCanhB() * this.getCanhB(),
                this.getCanhC() * this.getCanhC())) {
            return 0.5 * this.getCanhA() * this.getCanhB();
        } else if (ganBang(this.getCanhA() * this.getCanhA() + this.getCanhC() * this.getCanhC(),
                this.getCanhB() * this.getCanhB())) {
            return 0.5 * this.getCanhA() * this.getCanhC();
        } else {
            return 0.5 * this.getCanhB() * this.getCanhC();
        }
    }

    public void showMe() {
        System.out.println("--- Thông tin Hình Tam Giác Vuông ---");
        System.out.println("Màu viền: " + this.getMauVien() + ". Màu nền: " + this.getMauNen() + ".");
        System.out.println("Các cạnh: " + this.getCanhA() + ", " + this.getCanhB() + ", " + this.getCanhC());
        System.out.printf("Chu vi: %.2f\n", chuVi());
        double dt = dienTich();
        if (dt != -1) {
            System.out.printf("Diện tích: %.2f\n", dt);
        } else {
            System.out.println("Không phải tam giác vuông!");
        }
    }
}
