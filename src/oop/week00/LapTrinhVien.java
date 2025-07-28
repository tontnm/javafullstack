package oop.week00;

// =================================================================================
// inheritance: LapTrinhVien kế thừa từ NhanVien.
// IS-A relationship: LapTrinhVien "LÀ MỘT" NhanVien.
// =================================================================================
class LapTrinhVien extends NhanVien {
    private int soGioLamThem;

    public LapTrinhVien(String maNV, String ten, double luongCoBan, int soGioLamThem) {
        // super (constructor): Gọi constructor của lớp cha (NhanVien).
        super(maNV, ten, luongCoBan);
        this.soGioLamThem = soGioLamThem;
    }

    // method overriding: Ghi đè phương thức của lớp cha.
    @Override
    public double tinhLuong() {
        // super (method): Gọi phương thức/thuộc tính của lớp cha.
        return this.luongCoBan + (this.soGioLamThem * 200000);
    }
    
    @Override
    public void hienThiThongTin() {
        super.hienThiThongTin();
        System.out.println("Chức vụ: Lập trình viên, Lương thực nhận: " + this.tinhLuong());
    }
    
    // Phương thức riêng của LapTrinhVien
    public void vietCode() {
        System.out.println(getTen() + " đang viết code...");
    }
}
