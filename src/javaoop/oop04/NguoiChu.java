package javaoop.oop04;

public class NguoiChu extends OngNoi implements IThoDien {
    public NguoiChu(String hoTen, int namSinh, OngNoi ongNoi) {
        super(hoTen, namSinh);
    }

    @Override
    public void thayBongDen() {
        System.out.println("Chú " + getHoTen() + " đang thay bóng đèn.");
    }

    // Hành vi riêng
    public void nuoiHeo() {
        System.out.println("Chú " + getHoTen() + " đang nuôi heo.");
    }

    // Tật xấu default (package-private), chỉ người "cùng nhà" (cùng package) thấy
    void nguNgay() {
        System.out.println("(Cùng nhà mới biết) Chú " + getHoTen() + " ngủ ngáy rất to.");
    }
}
