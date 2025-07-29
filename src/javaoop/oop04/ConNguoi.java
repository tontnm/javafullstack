package javaoop.oop04;

/**
 * TÍNH TRỪU TƯỢNG (ABSTRACTION): Lớp abstract định nghĩa khái niệm chung
 * mà không cần có đối tượng cụ thể.
 */
abstract class ConNguoi {
    /**
     * TÍNH BAO ĐÓNG (ENCAPSULATION): Dữ liệu được che giấu bằng 'private'
     * và chỉ được truy cập qua các phương thức public (getters).
     */
    private String hoTen;
    private int namSinh;
    private String gioiTinh;
    private String hoTenCha;

    // CONSTRUCTOR: Dùng để khởi tạo đối tượng
    public ConNguoi(String hoTen, int namSinh, String gioiTinh, String hoTenCha) {
        // THIS: Tham chiếu đến thuộc tính của đối tượng hiện tại
        this.hoTen = hoTen;
        this.namSinh = namSinh;
        this.gioiTinh = gioiTinh;
        this.hoTenCha = hoTenCha;
    }

    public String getHoTen() {
        return hoTen;
    }

    public int getNamSinh() {
        return namSinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public String getHoTenCha() {
        return hoTenCha;
    }

    public abstract void gioiThieu();
}
