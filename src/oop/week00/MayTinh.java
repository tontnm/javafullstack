package oop.week00;

// =================================================================================
// final class: Lớp này không thể được kế thừa.
// default access modifier: Lớp này chỉ có thể được truy cập trong cùng package.
// Khái niệm HAS-A: Một QuanLyDuAn "CÓ MỘT" MayTinh.
// =================================================================================
final class MayTinh {
    private String maSo; // private access modifier

    public MayTinh(String maSo) {
        this.maSo = maSo;
    }

    public String getMaSo() {
        return maSo;
    }
}
