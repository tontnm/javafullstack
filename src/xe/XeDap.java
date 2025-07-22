package xe;
public class XeDap extends XeHaiBanh {
    public XeDap(String mauSon, double trongLuong) {
        setMauSon(mauSon);
        setTrongLuong(trongLuong);
    }

    public void showMe() {
        System.out.println("--- Xe Đạp ---");
        System.out.println("Màu sơn: " + getMauSon());
        System.out.println("Trọng lượng: " + getTrongLuong() + " kg");
        dungChanChong();
        System.out.println("Không thể đổ xăng.");
    }
}