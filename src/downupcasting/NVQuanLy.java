package downupcasting;

import java.util.Scanner;

public class NVQuanLy extends NVChinhThuc {

	public NVQuanLy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NVQuanLy(int id, String hoTen, int tuoi) {
		super(id, hoTen, tuoi);
		// TODO Auto-generated constructor stub
	}
	@Override
	public void addInfor() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhập id nhân viên quản lý: ");
		setId(Integer.parseInt(sc.nextLine()));
		System.out.println("Nhập họ tên nhân viên quản lý: ");
		setHoTen(sc.nextLine());
		System.out.println("Nhập tuổi nhân viên quản lý: ");
		setTuoi(Integer.parseInt(sc.nextLine()));
	}
	
	@Override
	public void showInfor() {
		System.out.println("Nhân viên quản lý: " + getId() + ", " + getHoTen() + ", " + getTuoi());
	}
}
