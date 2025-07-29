package javaoop.oop04;

public class Main {
    public static void main(String[] args) {
        // --- Khởi tạo các đối tượng trong gia đình ---
        OngNoi ongNoi = new OngNoi("Nguyễn Văn Tèo", 1940);
        NguoiCha nguoiCha = new NguoiCha("Nguyễn Văn Tí", 1965, ongNoi);
        NguoiChu nguoiChu = new NguoiChu("Nguyễn Văn Tủn", 1970, ongNoi);
        ConTrai conTrai = new ConTrai("Nguyễn Văn Tèo Con", 1990, nguoiCha);
        ConGai conGai = new ConGai("Nguyễn Thị Bông", 1992, nguoiCha);

        // --- Tạo một ngôi nhà (package) để thấy tật xấu của người chú ---
        System.out.println("--- Kiểm tra tật xấu ---");
        nguoiChu.nguNgay(); // Gọi được vì ở cùng package
        nguoiCha.anNhau(); // Gọi được vì là public
        conTrai.ngoayLoMui(); // Gọi được vì là protected và là con

        System.out.println("\n--- Kiểm tra vị trí mục ruồi ---");
        conTrai.chiVaoMucRuoiCuaMinh();
        conTrai.chiVaoMucRuoiCuaCha();
        conGai.chiVaoMucRuoiCuaMinh();
        conGai.chiVaoMucRuoiCuaCha();

        System.out.println("\n--- Kiểm tra làm ruộng (Overloading) ---");
        conTrai.lamRuong("của cha");
        conTrai.lamRuong("hiện đại");

        System.out.println("\n--- Minh họa TÍNH ĐA HÌNH (POLYMORPHISM) ---");
        // UPCASTING: Các đối tượng con (NguoiCha, ConTrai...) được xem như đối tượng
        // cha (ConNguoi)
        ConNguoi[] giaDinh = { ongNoi, nguoiCha, nguoiChu, conTrai, conGai };

        for (ConNguoi thanhVien : giaDinh) {
            System.out.println("---");
            // Cùng một lời gọi nhưng hành vi khác nhau tùy đối tượng
            thanhVien.gioiThieu();

            // DOWNCASTING: Cần ép kiểu để gọi phương thức riêng
            if (thanhVien instanceof NguoiCha) {
                ((IThoMoc) thanhVien).cuaGo();
            }
            if (thanhVien instanceof ConGai) {
                ((IPhatTu) thanhVien).tungKinh();
            }
        }
    }
}
