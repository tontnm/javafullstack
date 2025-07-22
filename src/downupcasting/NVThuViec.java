package downupcasting;

import java.util.Scanner;

public class NVThuViec extends HocVien {

	public NVThuViec() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NVThuViec(int id, String hoTen, int tuoi) {
		super(id, hoTen, tuoi);
		// TODO Auto-generated constructor stub
	}
	@Override
	public void addInfor() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhập id nhân viên thử việc: ");
		setId(Integer.parseInt(sc.nextLine()));
		System.out.println("Nhập họ tên nhân viên thử việc: ");
		setHoTen(sc.nextLine());
		System.out.println("Nhập tuổi nhân viên thử việc: ");
		setTuoi(Integer.parseInt(sc.nextLine()));
	}
	@Override
	public void showInfor() {
		System.out.println("Nhan Vien Thu Viec: " + getId() + ", " + getHoTen() + ", " + getTuoi());
	}
}
