package oop.week03protectedinheritancethissuper.hinh;
public class HinhThang extends Hinh {
    private double dayLon;
    private double dayNho;
    private double canhBen1;
    private double canhBen2;
    private double chieuCao;

    public HinhThang(String mauVien, String mauNen, double dayLon, double dayNho, double canhBen1, double canhBen2, double chieuCao) {
        this.setMauVien(mauVien);
        this.setMauNen(mauNen);
        this.dayLon = dayLon;
        this.dayNho = dayNho;
        this.canhBen1 = canhBen1;
        this.canhBen2 = canhBen2;
        this.chieuCao = chieuCao;
    }

    public double chuVi() {
        return dayLon + dayNho + canhBen1 + canhBen2;
    }

    public double dienTich() {
        return 0.5 * (dayLon + dayNho) * chieuCao;
    }

    public void showMe() {
        System.out.println("--- Thông tin Hình Thang ---");
        System.out.println("Màu viền: " + this.getMauVien() + ". Màu nền: " + this.getMauNen() + ".");
        System.out.println("Đáy lớn: " + dayLon + ", Đáy nhỏ: " + dayNho);
        System.out.println("Cạnh bên: " + canhBen1 + ", " + canhBen2);
        System.out.println("Chiều cao: " + chieuCao);
        System.out.printf("Chu vi: %.2f\n", chuVi());
        System.out.printf("Diện tích: %.2f\n", dienTich());
    }

    public double getDayLon() {
        return dayLon;
    }

    public void setDayLon(double dayLon) {
        this.dayLon = dayLon;
    }

    public double getDayNho() {
        return dayNho;
    }

    public void setDayNho(double dayNho) {
        this.dayNho = dayNho;
    }

    public double getCanhBen1() {
        return canhBen1;
    }

    public void setCanhBen1(double canhBen1) {
        this.canhBen1 = canhBen1;
    }

    public double getCanhBen2() {
        return canhBen2;
    }

    public void setCanhBen2(double canhBen2) {
        this.canhBen2 = canhBen2;
    }

    public double getChieuCao() {
        return chieuCao;
    }

    public void setChieuCao(double chieuCao) {
        this.chieuCao = chieuCao;
    }

    
}
