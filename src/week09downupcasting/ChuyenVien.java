package week09downupcasting;

import java.util.Scanner;

public class ChuyenVien extends NVChinhThuc {

	public ChuyenVien() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChuyenVien(int id, String hoTen, int tuoi) {
		super(id, hoTen, tuoi);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addInfor() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhập id chuyên viên: ");
		setId(Integer.parseInt(sc.nextLine()));
		System.out.println("Nhập họ tên chuyên viên: ");
		setHoTen(sc.nextLine());
		System.out.println("Nhập tuổi chuyên viên: ");
		setTuoi(Integer.parseInt(sc.nextLine()));
	}

	@Override
	public void showInfor() {
		System.out.println("Chuyên viên: " + getId() + ", " + getHoTen() + ", " + getTuoi());
	}

}
