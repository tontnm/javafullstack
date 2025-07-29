package javaoop.week03protectedinheritancethissuper.xe;

public class XeGanMay extends XeHaiBanh {
    public XeGanMay(String mauSon, double trongLuong) {
        setMauSon(mauSon);
        setTrongLuong(trongLuong);
    }

    public void doXang() {
        System.out.println("Đang đổ xăng cho xe gắn máy.");
    }

    public void showMe() {
        System.out.println("--- Xe Gắn Máy ---");
        System.out.println("Màu sơn: " + getMauSon());
        System.out.println("Trọng lượng: " + getTrongLuong() + " kg");
        dungChanChong();
        doXang();
    }
}