package javaoop.week13collections;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        // Nếu ko có Java bean

        // cách 1
        String[] hoTen = new String[5];
        int[] tuoi = new int[5];

        hoTen[0] = "a";
        tuoi[0] = 18;

        hoTen[1] = "b";
        tuoi[0] = 20;

        // in thông tin của nv thứ 2
        System.out.println("ten" + hoTen[1]);
        System.out.println("tuoi" + tuoi[1]);

        // cách 2 dùng arraylist

        // Java bean: gom những thông tin có liên quan với nhau của 1 nhóm đối tượng
        // lại thành 1 class
        // ví dụ như sinh viên là 1 nhóm đối tượng có các thuộc tính như họ tên, tuổi
        // thì tạo ra 1 class SinhVien gọi là class Java bean để lưu trữ các thông tin
        // đó
        // Mục đích cuối cùng: lưu trữ dữ liệu trong quá trình xử lý nghiệp vụ một cách
        // tiện lợi
        // Java bean không chứa các hàm xử lý business logic (nghiệp vụ)

        SinhVien[] svs = new SinhVien[5];

        SinhVien sv1 = new SinhVien();
        sv1.setTen("a");
        sv1.setAge(18);
        svs[0] = sv1;

        // svs là 1 thùng to , chứ nhiều thùng nhỏ, mỗi thùng nhỏ chính là java bean
        // mỗi thùng nhỏ chứa họ tên, tuổi...

        ArrayList<SinhVien> svAL = new ArrayList<>();

        SinhVien sv2 = new SinhVien();
        sv2.setTen("b");
        sv2.setAge(19);
        svAL.add(sv2);

        // Nhớ:
        // Chuẩn bị dữ liệu cho thùng nhỏ trước
        // sau đó mới bỏ thùng nhỏ đó vào thùng to

        ArrayList<SinhVien> svA = new ArrayList<>();

        SinhVien sv;
        for (int i = 0; i < 5; i++) {
            sv = new SinhVien();
            sv.setTen("ho ten " + i);
            sv.setAge(i);
            svA.add(sv);
        }

        for (int i = 0; i < 5; i++) {
            SinhVien svnew = new SinhVien();
            svnew.setTen("ho ten " + i);
            svnew.setAge(i);
            svA.add(svnew);
        }

        // Tạm hiểu: Collections đối tượng
        // bản chất: chỉ chứa các địa chỉ trỏ đến các đối tượng

        List<SinhVien> al = new ArrayList<>();
        Map<String, SinhVien> m = new HashMap<>();
        // Map: ánh xạ (trong toán học, hồi cấp 3)
        // y = 2x;
        // với mỗi giá trị của x, chỉ cho ra 1 giá trị duy nhất của y
        // Map<Key, Value>
        String key1 = "sv1";
        SinhVien sv10 = new SinhVien();
        sv10.setTen("a");
        sv10.setAge(18);
        m.put(key1, sv10);

        SinhVien sv12 = new SinhVien();
        sv12.setTen("b");
        sv12.setAge(19);
        m.put(key1, sv12);

        SinhVien sv11 = m.get(key1);
        System.out.println(sv11.getTen());
        System.out.println(sv11.getAge());

        Set<String> s = new HashSet<>();
        s.add("a");
        s.add("a");
        s.add("b");
        System.out.println(s.size());
    }
}
