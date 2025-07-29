package javaoop.week03protectedinheritancethissuper.xe;

public class Xe {
    private String mauSon;
    private double trongLuong;

    public Xe() {

    }

    public void setMauSon(String mauSon) {
        this.mauSon = mauSon;
    }

    public String getMauSon() {
        return mauSon;
    }

    public void setTrongLuong(double trongLuong) {
        this.trongLuong = trongLuong;
    }

    public double getTrongLuong() {
        return trongLuong;
    }

    public void chay() {
        System.out.println("Xe đang chạy...");
    }

    public void dung() {
        System.out.println("Xe đã dừng.");
    }

    public void choNguoi() {
        System.out.println("Xe đang chở người.");
    }

    public void showMe() {
        System.out.println("Màu sơn: " + mauSon);
        System.out.println("Trọng lượng: " + trongLuong + " kg");
    }
}