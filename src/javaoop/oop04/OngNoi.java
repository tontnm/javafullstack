package javaoop.oop04;

public class OngNoi extends ConNguoi {
    public OngNoi(String hoTen, int namSinh) {
        // SUPER: Gọi constructor của lớp cha (ConNguoi)
        super(hoTen, namSinh, "Nam", "Không có");
    }

    public void lamRuong() {
        System.out.println(getHoTen() + " đang làm ruộng theo phương pháp truyền thống.");
    }

    @Override
    public void gioiThieu() {
        System.out.println("Tôi là " + getHoTen());
    }
}
