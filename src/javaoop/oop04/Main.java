package javaoop.oop04;

public class Main {
    public static void main(String[] args) {
        // --- Khởi tạo các đối tượng trong gia đình ---
        OngNoi ongNoi = new OngNoi("Nguyễn Văn Tèo", 1940);
        NguoiCha nguoiCha = new NguoiCha("Nguyễn Văn Tí", 1965, ongNoi);
        NguoiChu nguoiChu = new NguoiChu("Nguyễn Văn Tủn", 1970, ongNoi);
        ConTrai conTrai = new ConTrai("Nguyễn Văn Tèo Con", 1990, nguoiCha);
        ConGai conGai = new ConGai("Nguyễn Thị Bông", 1992, nguoiCha);

        // --- Tạo một ngôi nhà (package) để thấy tật xấu của người chú ---
        System.out.println("--- Kiểm tra tật xấu ---");
        nguoiChu.nguNgay(); // Gọi được vì ở cùng package
        nguoiCha.anNhau(); // Gọi được vì là public
        conTrai.ngoayLoMui(); // Gọi được vì là protected và là con

        System.out.println("\n--- Kiểm tra vị trí mục ruồi ---");
        conTrai.chiVaoMucRuoiCuaMinh();
        conTrai.chiVaoMucRuoiCuaCha();
        conGai.chiVaoMucRuoiCuaMinh();
        conGai.chiVaoMucRuoiCuaCha();

        System.out.println("\n--- Kiểm tra làm ruộng (Overloading) ---");
        conTrai.lamRuong("của cha");
        conTrai.lamRuong("hiện đại");

        System.out.println("\n--- Minh họa TÍNH ĐA HÌNH (POLYMORPHISM) ---");
        // UPCASTING: Các đối tượng con (NguoiCha, ConTrai...) được xem như đối tượng
        // cha (ConNguoi)
        ConNguoi[] giaDinh = { ongNoi, nguoiCha, nguoiChu, conTrai, conGai };

        for (ConNguoi thanhVien : giaDinh) {
            System.out.println("---");
            // Cùng một lời gọi nhưng hành vi khác nhau tùy đối tượng
            thanhVien.gioiThieu();

            // DOWNCASTING: Cần ép kiểu để gọi phương thức riêng
            if (thanhVien instanceof NguoiCha) {
                ((IThoMoc) thanhVien).cuaGo();
            }
            if (thanhVien instanceof ConGai) {
                ((IPhatTu) thanhVien).tungKinh();
            }
        }
    }
}

/**
 * Phần 1: Phân tích và Thiết kế
Trước khi viết code, chúng ta cần phân tích nghiệp vụ để xây dựng cấu trúc lớp cho hợp lý.
Xác định các Đối tượng và Cây kế thừa (Inheritance & IS-A):
Đối tượng gốc là ConNguoi. Đây nên là một lớp abstract vì không có "con người" chung chung, mà chỉ có những vai trò cụ thể.
OngNoi là một ConNguoi.
NguoiCha và NguoiChu là con của OngNoi. Để kế thừa kỹ năng lamRuong, chúng phải kế thừa từ OngNoi. Vậy NguoiCha extends OngNoi và NguoiChu extends OngNoi.
ConTrai và ConGai là con của NguoiCha. Vậy ConTrai extends NguoiCha và ConGai extends NguoiCha.

Cây kế thừa:

             ConNguoi (abstract)
                 ^
                 | (IS-A)
               OngNoi
                 ^
     +-----------|-----------+
     | (IS-A)                | (IS-A)
  NguoiCha                NguoiChu
     ^
 +---|---+
 |       | (IS-A)
ConTrai   ConGai (final)
```

Xác định các Khả năng riêng (Interface):
Các nghề nghiệp như "Thợ mộc", "Thợ điện" không phải là bản chất "là một" (IS-A) mà là một khả năng "có thể" (CAN-DO). 
Dùng interface là phù hợp nhất.

IThoMoc: có cuaGo(), dongBanGhe().
IThoDien: có thayBongDen().
IPhapTu: có tungKinh().

Xác định Thuộc tính và Hành vi (Encapsulation & Access Modifiers):
ConNguoi: hoTen, namSinh, gioiTinh, hoTenCha. Đây là thông tin cơ bản, nên là private và truy cập qua getters.
Tật xấu của Người Chú (ngủ ngáy): "Ai ở cùng nhà mới biết". Điều này ám chỉ đến default (package-private) access modifier. Các lớp trong cùng package (cùng nhà) có thể thấy.
Tật xấu của Người Cha (ngoáy mũi): "người khác không thấy, nhưng con thì thấy và kế thừa". Đây là mô tả hoàn hảo cho protected. Lớp con có thể truy cập và kế thừa.
Tật xấu của Người Cha (ăn nhậu): "ai cũng thấy, nhưng không muốn ai bắt chước". public để ai cũng thấy, và final để lớp con không thể override (bắt chước).
Mục ruồi: Đây là một thuộc tính được kế thừa.
NguoiCha có mục ruồi má phải -> protected String mucRuoiCuaCha.
ConGai có thêm mục ruồi má trái -> private String mucRuoiRieng.

Xác định các Phương thức đặc biệt (Overriding, Overloading, this, super):
lamRuong: ConTrai có cách làm riêng và cách của cha. Đây là một trường hợp tốt để dùng Overloading. Ta có thể tạo lamRuong(String phuongPhap).
ngoayLoMui: ConTrai kế thừa và cũng có tật xấu này -> Overriding.
chiVaoMucRuoi: ConTrai và ConGai trả lời khác nhau cho cùng câu hỏi. Ta sẽ tạo 2 phương thức: chiVaoMucRuoiCuaMinh() và chiVaoMucRuoiCuaCha(). Việc gọi mucRuoiCuaCha từ lớp ConGai sẽ dùng từ khóa super.

Phần 3: Giải thích chi tiết các khái niệm
Tính Kế thừa (Inheritance):
Thể hiện: NguoiCha extends OngNoi, ConTrai extends NguoiCha. ConTrai không chỉ kế thừa từ NguoiCha mà còn kế thừa gián tiếp từ OngNoi và ConNguoi.
Ví dụ: ConTrai có thể gọi phương thức lamRuong() của OngNoi thông qua từ khóa super.

Tính Bao đóng (Encapsulation):
Thể hiện: Các thuộc tính hoTen, namSinh... trong lớp ConNguoi được khai báo là private.
Mục đích: Che giấu dữ liệu, không cho phép truy cập trực tiếp từ bên ngoài, mà phải thông qua các phương thức public (như getHoTen()). Điều này giúp kiểm soát và bảo vệ dữ liệu.

Tính Trừu tượng (Abstraction):
Thể hiện: Lớp ConNguoi là một lớp abstract.
Mục đích: Nó định nghĩa một khái niệm chung, một "khuôn mẫu" mà không thể tạo đối tượng trực tiếp từ nó. Nó chứa phương thức abstract void gioiThieu() buộc các lớp con phải định nghĩa lại, đảm bảo mọi "Con người" trong hệ thống đều phải có khả năng tự giới thiệu.

Tính Đa hình (Polymorphism):
Thể hiện: Trong hàm main, mảng ConNguoi[] giaDinh có thể chứa nhiều loại đối tượng khác nhau (OngNoi, NguoiCha, ConTrai...).
Ví dụ: Khi gọi thanhVien.gioiThieu() trong vòng lặp, Java sẽ tự động xác định đối tượng thực tế là ai để gọi đúng phương thức gioiThieu() đã được override của lớp đó. Đây là đa hình tại thời điểm chạy (runtime polymorphism).

Override và Overload:
Override (Ghi đè): ngoayLoMui() của ConTrai ghi đè lên ngoayLoMui() của NguoiCha. gioiThieu() của các lớp con ghi đè lên phương thức abstract của ConNguoi.
Overload (Nạp chồng): ConTrai có 2 phương thức lamRuong() (kế thừa) và lamRuong(String phuongPhap) (tự định nghĩa). Chúng cùng tên nhưng khác nhau về tham số.

final class và final method:
final class: Lớp ConGai được khai báo là final, nghĩa là không một lớp nào khác có thể kế thừa từ ConGai (vì cô ấy đi tu, không sinh con).
final method: Phương thức anNhau() của NguoiCha là final, ngăn chặn ConTrai hay ConGai override (bắt chước) tật xấu này.

this và super:
this: Được dùng trong constructor của ConNguoi (this.hoTen = hoTen;) để phân biệt thuộc tính của lớp và tham số đầu vào.
super: Được dùng trong constructor của các lớp con (super(hoTen, namSinh);) để gọi constructor của lớp cha. Nó cũng được dùng trong ConTrai.lamRuong(...) để gọi phương thức của lớp cha.
*/