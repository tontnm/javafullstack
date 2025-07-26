package oop.week03protectedinheritancethissuper.xe;
public class XeTai extends XeBonBanh {
    public XeTai(String mauSon, double trongLuong) {
        setMauSon(mauSon);
        setTrongLuong(trongLuong);
    }

    public void choHangHoa() {
        System.out.println("Đang chở hàng hóa.");
    }

    public void showMe() {
        System.out.println("--- Xe Tải ---");
        System.out.println("Màu sơn: " + getMauSon());
        System.out.println("Trọng lượng: " + getTrongLuong() + " kg");
        doXang();
        choHangHoa();
    }
}