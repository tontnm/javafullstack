package week01classobjectanswer;

import java.util.ArrayList;

public class Main1 {
	// Chưa hoàn thiện, hãy tự code thêm vào
	
	public static void main(String[] args) {
		// Yeu cau 1:
		ConCho conCho1 = new ConCho();
		ConCho conCho2 = new ConCho();
		conCho1.ten = "x";
		conCho2.ten = "y";
		
		// Yeu cau 2:
		conCho1.tuoi = 10;
		System.out.println("Tuoi truoc khi to chuc sinh nhat 1: " + conCho1.tuoi);
		conCho1.tuToChucSinhNhat();
		System.out.println("Tuoi sau khi to chuc sinh nhat 1:" + conCho1.tuoi);
		
		conCho2.tuoi = 7;
		System.out.println("Tuoi truoc khi to chuc sinh nhat 2 : " + conCho1.tuoi);
		conCho2.tuToChucSinhNhat();
		System.out.println("Tuoi sau khi to chuc sinh nhat 2:" + conCho1.tuoi);
		
		// Yeu cau 3:
		
		conCho1.toChucSinhNhatChoConChoKhac(conCho2);
		System.out.println("Sau khi to chuc sinh nhat:" + conCho2.tuoi);
		
		// Yeu cau 4:
		CucXuong cucXuong1 = new CucXuong();
		cucXuong1.tenCucXuong = "cuc xuong ham";
		cucXuong1.kichThuocCucXuong = 100;
		
		conCho1.anXuong(cucXuong1);
		
		// Yeu cau 5:
		ArrayList<CucXuong> dsCucXuong = new ArrayList<CucXuong>();
		
		CucXuong cucXuongA = new CucXuong();
		cucXuongA.tenCucXuong = "cuc A";
		cucXuongA.kichThuocCucXuong = 1;
		dsCucXuong.add(cucXuongA);
		
		CucXuong cucXuongB = new CucXuong();
		cucXuongB.tenCucXuong = "cuc B";
		cucXuongB.kichThuocCucXuong = 2;
		dsCucXuong.add(cucXuongB);
		
		conCho2.anNhieuCucXuong(dsCucXuong);
		
		// Yeu cau 6:
		conCho1.anXuong2(cucXuong1); // Khong don nhan cuc Shit tra ve
		Shit shitTraVe = conCho1.anXuong2(cucXuong1); //  Co don nhan cuc shit tra ve
		
		System.out.println("Cuc shit tra ve co ten la: " + shitTraVe.tenCucShit);
		System.out.println("Khoi luong cuc shit là: " + shitTraVe.kichThuocCucShit);
		
		Shit shitTraVe2 = conCho1.anXuong2(cucXuong1);

		System.out.println("Cuc shit tra ve co ten la: " + shitTraVe.tenCucShit);
		System.out.println("Khoi luong cuc shit là: " + shitTraVe.kichThuocCucShit);

		// Yeu cau 7:
		ArrayList<Shit> dsShitTraVe = conCho1.anXuong3(cucXuong1);
		for (int i = 0; i < dsShitTraVe.size(); i++) {
			System.out.println("Cuc shit tra ve co ten la: " + dsShitTraVe.get(i).tenCucShit);
			System.out.println("Khoi luong cuc shit là: " + dsShitTraVe.get(i).kichThuocCucShit);
			
		}
		
	}
}
