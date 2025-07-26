package oop.week03protectedinheritancethissuper.xe;
public class XeKhach extends XeBonBanh {
    public XeKhach(String mauSon, double trongLuong) {
        setMauSon(mauSon);
        setTrongLuong(trongLuong);
    }

    public void choKhach() {
        System.out.println("Đang chở khách.");
    }

    public void showMe() {
        System.out.println("--- Xe Khách ---");
        System.out.println("Màu sơn: " + getMauSon());
        System.out.println("Trọng lượng: " + getTrongLuong() + " kg");
        doXang();
        choKhach();
    }
}