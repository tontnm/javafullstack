package hinh;
public class HinhThoi extends Hinh {
    private double canh;
    private double duongCheo1;
    private double duongCheo2;

    public HinhThoi(String mauVien, String mauNen, double canh, double duongCheo1, double duongCheo2) {
        this.setMauVien(mauVien);
        this.setMauNen(mauNen);
        this.canh = canh;
        this.duongCheo1 = duongCheo1;
        this.duongCheo2 = duongCheo2;
    }

    public double chuVi() {
        return 4 * canh;
    }

    public double dienTich() {
        return 0.5 * duongCheo1 * duongCheo2;
    }

    public void showMe() {
        System.out.println("--- Thông tin Hình Thoi ---");
        System.out.println("Màu viền: " + this.getMauVien() + ". Màu nền: " + this.getMauNen() + ".");
        System.out.println("Cạnh: " + canh);
        System.out.println("Đường chéo 1: " + duongCheo1 + ", Đường chéo 2: " + duongCheo2);
        System.out.printf("Chu vi: %.2f\n", chuVi());
        System.out.printf("Diện tích: %.2f\n", dienTich());
    }

    public double getCanh() {
        return canh;
    }

    public void setCanh(double canh) {
        this.canh = canh;
    }

    public double getDuongCheo1() {
        return duongCheo1;
    }

    public void setDuongCheo1(double duongCheo1) {
        this.duongCheo1 = duongCheo1;
    }

    public double getDuongCheo2() {
        return duongCheo2;
    }

    public void setDuongCheo2(double duongCheo2) {
        this.duongCheo2 = duongCheo2;
    }

    
}