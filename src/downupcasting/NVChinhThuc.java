package downupcasting;

import java.util.Scanner;

public class NVChinhThuc extends HocVien {

	public NVChinhThuc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NVChinhThuc(int id, String hoTen, int tuoi) {
		super(id, hoTen, tuoi);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addInfor() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhập id nhân viên chính thức: ");
		setId(Integer.parseInt(sc.nextLine()));
		System.out.println("Nhập họ tên nhân viên chính thức: ");
		setHoTen(sc.nextLine());
		System.out.println("Nhập tuổi nhân viên chính thức: ");
		setTuoi(Integer.parseInt(sc.nextLine()));
	}

	@Override
	public void showInfor() {
		System.out.println("Nhân viên chính thức: " + getId() + ", " + getHoTen() + ", " + getTuoi());
	}
}
