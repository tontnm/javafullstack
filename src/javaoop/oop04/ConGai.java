package javaoop.oop04;

/**
 * FINAL CLASS: Lớp này không thể có lớp con (không thể kế thừa).
 */
final class ConGai extends NguoiCha implements IPhatTu {
    private String mucRuoiRieng = "trên má trái";

    public ConGai(String hoTen, int namSinh, NguoiCha nguoiCha) {
        super(hoTen, namSinh, nguoiCha);
    }

    @Override
    public void tungKinh() {
        System.out.println("Phật tử " + getHoTen() + " đang tụng kinh...");
    }

    public void chiVaoMucRuoiCuaMinh() {
        System.out.println("Con gái " + getHoTen() + " chỉ vào mục ruồi " + this.mucRuoiRieng);
    }

    public void chiVaoMucRuoiCuaCha() {
        // SUPER: Dùng super để tham chiếu rõ ràng đến thuộc tính của lớp cha
        System.out.println("Con gái " + getHoTen() + " chỉ vào mục ruồi " + super.mucRuoiCuaCha
                + " và nói 'Đây là mục ruồi cha để lại'.");
    }
}
