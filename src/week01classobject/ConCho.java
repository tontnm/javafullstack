package week01classobject;

import java.util.ArrayList;

class ConCho {
    public String ten;
    public int tuoi;

    public void tuToChucSinhNhat() {
        System.out.println(ten + " đang tổ chức sinh nhật.");
        tuoi++;
    }

    public void tuToChucSinhNhatConChoKhac(ConCho cc) {
        System.out.println(ten + " đang tổ chức sinh nhật con chó khác.");
        cc.tuoi++;
    }

    public void anXuong(CucXuong xuong) {
        System.out.println(ten + " đang ăn xương " + xuong.ten + " có khối lượng " + xuong.khoiLuong);
    }

    public void anNhieuXuong(ArrayList<CucXuong> xuongs) {
        for (CucXuong xuong : xuongs) {
            System.out.println(ten + " đang ăn xương " + xuong.ten + " có khối lượng " + xuong.khoiLuong);
        }
    }

    public Shit anXuong2(CucXuong xuong) {
        System.out.println(ten + " đang ăn xương " + xuong.ten + " có khối lượng " + xuong.khoiLuong);
        System.out.println("thải ra 1 shit");
        return new Shit();
    }

    public ArrayList<Shit> anXuong3(CucXuong xuong) {
        System.out.println(ten + " đang ăn xương " + xuong.ten + " có khối lượng " + xuong.khoiLuong);
        System.out.println("thải ra nhiều shit");
        ArrayList<Shit> shits = new ArrayList<>();
        shits.add(new Shit());
        return shits;
    }
}
