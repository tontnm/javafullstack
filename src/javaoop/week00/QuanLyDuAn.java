package javaoop.week00;

// =================================================================================
// inheritance: QuanLyDuAn kế thừa từ NhanVien.
// IS-A relationship: QuanLyDuAn "LÀ MỘT" NhanVien.
// =================================================================================
class QuanLyDuAn extends NhanVien {
    private double phuCapDuAn;
    private MayTinh mayTinhCaNhan; // HAS-A relationship

    public QuanLyDuAn(String maNV, String ten, double luongCoBan, double phuCapDuAn, String maMayTinh) {
        super(maNV, ten, luongCoBan);
        this.phuCapDuAn = phuCapDuAn;
        this.mayTinhCaNhan = new MayTinh(maMayTinh); // Khởi tạo đối tượng HAS-A
    }

    @Override
    public double tinhLuong() {
        return this.luongCoBan + this.phuCapDuAn;
    }

    @Override
    public void hienThiThongTin() {
        super.hienThiThongTin();
        System.out.println("Chức vụ: Quản lý dự án, Lương thực nhận: " + this.tinhLuong());
        System.out.println("Sử dụng máy tính mã số: " + this.mayTinhCaNhan.getMaSo());
    }

    // method overloading: Cùng tên phương thức nhưng khác tham số.
    public void tinhThuong() {
        System.out.println("Thưởng mặc định là 10% lương cơ bản.");
    }

    public void tinhThuong(double heSo) {
        System.out.println("Thưởng theo hệ số " + heSo + " là: " + (this.luongCoBan * heSo));
    }

    // Phương thức riêng của QuanLyDuAn
    public void hopDuAn() {
        System.out.println(getTen() + " đang họp dự án...");
    }
}
