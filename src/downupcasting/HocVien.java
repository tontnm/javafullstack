package downupcasting;

import java.util.Scanner;

public class HocVien {
	private int id;
	private String hoTen;
	private int tuoi;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public int getTuoi() {
		return tuoi;
	}

	public void setTuoi(int tuoi) {
		this.tuoi = tuoi;
	}

	public HocVien() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HocVien(int id, String hoTen, int tuoi) {
		super();
		this.id = id;
		this.hoTen = hoTen;
		this.tuoi = tuoi;
	}

	public void addInfor() {
		Scanner sc = new Scanner(System.in);
		System.out.println("Nhập id: ");
		id = Integer.parseInt(sc.nextLine());
		System.out.println("Nhập họ tên: ");
		hoTen = sc.nextLine();
		System.out.println("Nhập tuổi: ");
		tuoi = Integer.parseInt(sc.nextLine());
	}

	public void showInfor() {
		System.out.println("Hoc Vien: " + id + ", " + hoTen + ", " + tuoi);
	}

}
