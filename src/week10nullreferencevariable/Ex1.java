package week10nullreferencevariable;

import downupcasting.SinhVien;

public class Ex1 {
    static SinhVien sv1;
    static SinhVien sv2 = null;
    static SinhVien sv3 = new SinhVien();

    public static void main(String[] args) {
        System.out.println(sv1); // sv1 = null nghĩa là sv1 chưa trỏ tới đối tượng nào
        System.out.println(sv2); // sv2 = null nghĩa là sv2 chưa trỏ tới đối tượng nào
        System.out.println(sv3); // sv3 = downupcasting.SinhVien@15db9742 ,là địa chỉ của đối tượng SinhVien được
                                 // khởi tạo
    }
}

/**
 * SinhVien sv1;
 * - Khai báo 1 //*biến tham chiếu (con trỏ) có tên là sv1.
 * - Nhưng nó có quyền trỏ đến 1 đối tượng của lớp con, cháu của lớp SinhVien.
 * - VD: sau khi viết dòng code này, ta viết dòng sv1 = new SinhVienXuatSac(); sẽ ko bị lỗi.
 * - vì SinhVienXuatSac là lớp con của lớp SinhVien. Nhưng nếu ta viết sv1 = new ConMeo(); thì sẽ báo lỗi.
 * - Và nếu viết là sv1 = new DongVat(); thì sẽ báo lỗi vì DongVat là lớp cha của SinhVien, chứ không phải là lớp con, cháu của SinhVien.
 * - Hiện tại (sau khi line 1 kêt thúc) thì sv1 trỏ đến đối tượng nào?
 * *Chưa trỏ đến đối tượng nào cả, nó đang trỏ đến null.
 */

/**
  * SinhVien sv2 = null;
  * sv1 = sv2 = null; //*chưa trỏ tới đối tượng nào cả
  */

/**
  * sv2 = new SinhVien();
  * - tạo ra 1 đối tượng của lớp SinhVien và gán cho biến tham chiếu sv2. Cấp phát vùng nhớ cho đối tượng này.
  * - Lúc này sv2 trỏ(tham chiếu) đến đối tượng SinhVien được tạo ra.
  */

  /**
   * sv1 = sv2;
   * - sv1 và sv2 cùng trỏ(tham chiếu) đến cùng 1 đối tượng SinhVien.
   * *Nếu ta thay đổi giá trị của sv2 thì sv1 cũng sẽ thay đổi
   * *Lưu ý: 1 đối tượng có thể được trỏ bởi bao nhiêu con trỏ cũng được hết.
   * Ví dụ: có 1 trung tâm gia sư (), thì chúng ta có quyền dán rất nhiều tờ quảng cáo
   * cho trung tâm này trên các cột điện ở ngoài đường. Mỗi tờ quảng cáo đều trỏ đến trung tâm
   * gia sư đó. Như vậy, ta nói 1 đối tượng là trung tâm gia sư có thể được trỏ bởi nhiều tờ
   * quảng cáo. Mỗi tờ quảng cáo chính là ví dụ điển hình về con trỏ (hay là biến tham chiếu).
   */

   /**
    * sv2 = null;
    * sv1 = null;
    * sv1 và sv2 không trỏ đến đối tượng nào cả. nên đối tượng đc tạo ở line 3 sẽ trở thành RÁC trong bộ nhớ
    * Hệ điều hành sẽ có trách nhiệm dọn dẹp rác này sau một thời gian.
    */

    /**
     * sv1.getTen(); // lỗi vì sv1 = null, không trỏ đến đối tượng nào cả
     * SinhVien sv = new SinhVien();
     * sv.getTen(); // không lỗi, 1 đối tượng SinhVien đc tạo ra trong RAM, và sv trỏ đến đối tượng này.
     * gọi method getTen() của đối tượng của lớp SinhVien
     */