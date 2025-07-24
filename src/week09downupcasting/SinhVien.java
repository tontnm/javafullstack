package week09downupcasting;

import java.util.Scanner;

public class SinhVien extends HocVien{

	
	public SinhVien() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SinhVien(int id, String hoTen, int tuoi) {
		super(id, hoTen, tuoi);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void addInfor() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhập id sinh viên: ");
		setId(Integer.parseInt(sc.nextLine()));
		System.out.println("Nhập họ tên sinh viên: ");
		setHoTen(sc.nextLine());
		System.out.println("Nhập tuổi sinh viên: ");
		setTuoi(Integer.parseInt(sc.nextLine()));
	}
	
	@Override
	public void showInfor() {
		System.out.println("Sinh Vien: " + getId() + ", " + getHoTen() + ", " + getTuoi());
	}

}
