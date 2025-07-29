package javaoop.oop04;

/**
 * TÍNH KẾ THỪA (INHERITANCE): NguoiCha kế thừa các thuộc tính và phương thức
 * từ OngNoi. Mối quan hệ IS-A: NguoiCha LÀ MỘT OngNoi (và cũng là ConNguoi).
 */
public class NguoiCha extends OngNoi implements IThoMoc {
    // Thuộc tính được bảo vệ, chỉ lớp con mới thấy và kế thừa
    protected String mucRuoiCuaCha = "trên má phải";

    public NguoiCha(String hoTen, int namSinh, OngNoi ongNoi) {
        super(hoTen, namSinh);
        // Có thể truy cập getHoTen() của ongNoi vì nó là public
        // super(hoTen, namSinh, ongNoi.getHoTen()); // Cách khác để gán tên cha
    }

    // --- OVERRIDE: Ghi đè phương thức của interface IThoMoc ---
    @Override
    public void cuaGo() {
        System.out.println("Cha " + getHoTen() + " đang cưa gỗ.");
    }

    @Override
    public void dongBanGhe() {
        System.out.println("Cha " + getHoTen() + " đang đóng bàn ghế.");
    }

    // Hành vi riêng
    public void nuoiGa() {
        System.out.println("Cha " + getHoTen() + " đang nuôi gà.");
    }

    // Tật xấu được bảo vệ, con cái thấy và kế thừa
    protected void ngoayLoMui() {
        System.out.println("(Bí mật) Cha " + getHoTen() + " đang ngoáy lỗ mũi.");
    }

    /**
     * FINAL METHOD: Phương thức này không thể bị override (bắt chước).
     */
    public final void anNhau() {
        System.out.println("Cha " + getHoTen() + " đang ăn nhậu, ai cũng thấy nhưng đừng bắt chước!");
    }
}
