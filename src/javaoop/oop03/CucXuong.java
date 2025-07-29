package javaoop.oop03;

import java.time.LocalDate;

public class CucXuong {
    private String nguonGoc;
    private String kichThuoc;
    private LocalDate thoiDiemRaDoi;

    public CucXuong(String nguonGoc, String kichThuoc, String thoiDiemRaDoi) {
        this.nguonGoc = nguonGoc;
        this.kichThuoc = kichThuoc;
        this.thoiDiemRaDoi = LocalDate.now();
    }

    public String getNguonGoc() {
        return nguonGoc;
    }

    public String getKichThuoc() {
        return kichThuoc;
    }

    public String getThoiDiemRaDoi() {
        return thoiDiemRaDoi.toString();
    }

}
