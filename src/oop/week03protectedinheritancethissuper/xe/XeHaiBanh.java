package oop.week03protectedinheritancethissuper.xe;
public class XeHaiBanh extends Xe {
    public XeHaiBanh() {}
    
    public XeHaiBanh(String mauSon, double trongLuong) {
        setMauSon(mauSon);
        setTrongLuong(trongLuong);
    }

    public void dungChanChong() {
        System.out.println("Đã dựng chân chống.");
    }
}