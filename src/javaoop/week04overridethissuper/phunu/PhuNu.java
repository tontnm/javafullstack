package javaoop.week04overridethissuper.phunu;

public class PhuNu implements ThienThan, HanhViDocAc, HanhViThanhThien, HanhViNongNay {

    public void lamNguoiKhacTonThuong() {
        System.out.println("Biết cách làm người khác tổn thương...");
    }

    public void caHat() {
        System.out.println("Đang ca hát véo von... 🎶");
    }

    public void nhayMua() {
        System.out.println("Đang nhảy múa uyển chuyển...");
    }

    public void gietCacConKien() {
        System.out.println("Khi độc ác: *giẫm lên một đàn kiến");
    }

    public void cuoiVoiNguoiLa() {
        System.out.println("Khi thánh thiện: *mỉm cười với một người lạ");
    }

    public void dapDoNoiChe() {
        System.out.println("Khi nóng nảy: *đạp đổ một nồi chè");
    }
}