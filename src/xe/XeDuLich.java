package xe;
public class XeDuLich extends XeBonBanh {
    public XeDuLich(String mauSon, double trongLuong) {
        setMauSon(mauSon);
        setTrongLuong(trongLuong);
    }

    public void choSepCongTac() {
        System.out.println("Đang chở sếp đi công tác.");
    }

    public void showMe() {
        System.out.println("--- Xe Du Lịch ---");
        System.out.println("Màu sơn: " + getMauSon());
        System.out.println("Trọng lượng: " + getTrongLuong() + " kg");
        doXang();
        choSepCongTac();
    }
}