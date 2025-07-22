package nguoi;
public class DanOng extends ConNguoi implements NguoiChong, NhanVien, NguoiBan {

    public void suyNghi() {
        System.out.println("Một người đàn ông đang suy nghĩ...");
    }

    public void layVo() {
        System.out.println("Có khả năng lấy vợ.");
    }

    public void choVoDiBoi() {
        System.out.println("Chở vợ đi bơi cuối tuần.");
    }

    public void diNhau() {
        System.out.println("Đi nhậu với bạn bè.");
    }

    public void congHienChoCongTy() {
        System.out.println("Làm việc hết mình để cống hiến.");
    }
    
}
