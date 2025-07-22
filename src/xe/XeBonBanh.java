package xe;
public class XeBonBanh extends Xe {
    public XeBonBanh() {}
    
    public XeBonBanh(String mauSon, double trongLuong) {
        setMauSon(mauSon);
        setTrongLuong(trongLuong);
    }

    public void doXang() {
        System.out.println("Đang đổ xăng cho xe bốn bánh.");
    }
}