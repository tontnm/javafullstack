package javaoop.week01classobjectanswer;

import java.util.ArrayList;

public class ConCho {
	public String ten;
	public int tuoi;

	// Yeu cau 2
	public void tuToChucSinhNhat() {
		tuoi++;
	}

	// Yeu cau 3
	public void toChucSinhNhatChoConChoKhac(ConCho conChoKhac) {
		conChoKhac.tuoi++;
	}

	// Yeu cau 4
	public void anXuong(CucXuong cucXuong) {
		System.out.println(ten + " da an cuc xuong co ten la: "
				+ cucXuong.tenCucXuong);
		System.out.println("Cuc xuong nay co kich thuoc la: "
				+ cucXuong.kichThuocCucXuong);
	}

	// Yeu cau 5
	public void anNhieuCucXuong(ArrayList<CucXuong> listCucXuong) {
		for (int i = 0; i < listCucXuong.size(); i++) {
			System.out.println(ten + " đã ăn cục xương tên là :"
					+ listCucXuong.get(i).tenCucXuong);
			System.out.println("Kích thước cục xương này là: "
					+ listCucXuong.get(i).kichThuocCucXuong);
		}
	}

	// Yeu cau 6
	public Shit anXuong2(CucXuong cucXuong) {
		System.out.println(ten + " Đã ăn cục xương tên là :"
				+ cucXuong.tenCucXuong);
		System.out.println("Kích thước cục xương này là :"
				+ cucXuong.kichThuocCucXuong);

		Shit shit = new Shit();
		shit.tenCucShit = "Shit 1";
		shit.kichThuocCucShit = 12;
		return shit;

	}

	// Yeu cau 7
	public ArrayList<Shit> anXuong3(CucXuong cucXuong) {

		System.out.println("Đã ăn cục xương tên là : " + cucXuong.tenCucXuong);
		System.out.println("kích thước cục xương là : "
				+ cucXuong.kichThuocCucXuong);

		Shit phan1 = new Shit();
		phan1.tenCucShit = "a";
		phan1.kichThuocCucShit = 1;
		Shit phan2 = new Shit();
		phan2.tenCucShit = "b";
		phan2.kichThuocCucShit = 2;
		Shit phan3 = new Shit();
		phan3.tenCucShit = "c";
		phan3.kichThuocCucShit = 3;

		ArrayList<Shit> shitList = new ArrayList<Shit>();
		shitList.add(phan1);
		shitList.add(phan2);
		shitList.add(phan3);

		return shitList;
	}
}
