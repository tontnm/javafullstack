package javaoop.oop04;

public class ConTrai extends NguoiCha {
    public ConTrai(String hoTen, int namSinh, NguoiCha nguoiCha) {
        super(hoTen, namSinh, nguoiCha); // Thực tế không cần truyền cha vào đây nữa
    }

    // --- OVERRIDE: Kế thừa và thể hiện lại tật xấu của cha ---
    @Override
    protected void ngoayLoMui() {
        System.out.println("Con trai " + getHoTen() + " cũng có tật xấu ngoáy lỗ mũi giống cha.");
    }

    // --- OVERLOAD: Cùng tên phương thức 'lamRuong' nhưng khác nhau ---
    // Phương thức này là của riêng người con trai
    public void lamRuong(String phuongPhap) {
        if (phuongPhap.equals("của cha")) {
            // SUPER: Gọi phương thức của lớp cha trực tiếp (OngNoi)
            super.lamRuong();
        } else {
            System.out.println("Con trai " + getHoTen() + " đang làm ruộng theo phương pháp của riêng mình.");
        }
    }

    public void chiVaoMucRuoiCuaMinh() {
        // Kế thừa trực tiếp thuộc tính 'mucRuoiCuaCha'
        System.out.println("Con trai " + getHoTen() + " chỉ vào mục ruồi " + this.mucRuoiCuaCha);
    }

    public void chiVaoMucRuoiCuaCha() {
        System.out.println("Con trai " + getHoTen() + " cũng chỉ vào mục ruồi " + this.mucRuoiCuaCha
                + " và nói 'Đây là mục ruồi cha để lại'.");
    }
}
