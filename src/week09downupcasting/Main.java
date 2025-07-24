package week09downupcasting;

import java.util.Scanner;


public class Main {
	public static void Nhap(HocVien[] hv) {
		Scanner scan = new Scanner(System.in);
		for (int i = 0; i < 10; i++) {
			System.out.println("Chọn loại học viên cần nhập: ");
			System.out.println("1: Hoc Vien");
			System.out.println("2: Sinh Vien");
			System.out.println("3: Nhan Vien Thu Viec");
			System.out.println("4: Nhan Vien Chinh Thuc");
			System.out.println("5: Chuyen Vien");
			System.out.println("6: Nhan Vien Quan Ly");
			int loai = scan.nextInt();

			switch (loai) {
			case 1:
				HocVien hocvien = new HocVien();
				hv[i] = hocvien;
				hv[i].addInfor();
				break;
			case 2:
				SinhVien sv = new SinhVien();
				hv[i] = sv;
				hv[i].addInfor();
				break;
			case 3:
				NVThuViec nvtv = new NVThuViec();
				hv[i] = nvtv;
				hv[i].addInfor();
				break;
			case 4:
				NVChinhThuc nvct = new NVChinhThuc();
				hv[i] = nvct;
				hv[i].addInfor();
				break;
			case 5:
				ChuyenVien cv = new ChuyenVien();
				hv[i] = cv;
				hv[i].addInfor();
				break;
			case 6:
				NVQuanLy nvql = new NVQuanLy();
				hv[i] = nvql;
				hv[i].addInfor();
				break;
			default:
				break;
			}
		}
	}

	public static void xuat(HocVien[] hv) {
		System.out.println("Thong tin hoc vien");
		for (int i = 0; i < 10; i++) {
			if (hv[i] instanceof SinhVien) {
				SinhVien d = (SinhVien) hv[i];
				d.showInfor();
			} else if (hv[i] instanceof NVThuViec) {
				NVThuViec d = (NVThuViec) hv[i];
				d.showInfor();
			} else if (hv[i] instanceof NVChinhThuc) {
				NVChinhThuc d = (NVChinhThuc) hv[i];
				d.showInfor();
			} else if (hv[i] instanceof ChuyenVien) {
				ChuyenVien d = (ChuyenVien) hv[i];
				d.showInfor();
			} else if (hv[i] instanceof NVQuanLy) {
				NVQuanLy d = (NVQuanLy) hv[i];
				d.showInfor();
			} else {
				hv[i].showInfor();
			}
		}
	}

	public static void main(String[] args) {
		HocVien[] hocVien = new HocVien[10];
		Nhap(hocVien);
		xuat(hocVien);
	}

}
