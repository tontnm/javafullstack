package javaoop.week14exception;

public class Main {
    public static void main(String[] args) {
        // đoạn code này quăng exception
        // String x = "a";
        // int i = Integer.parseInt(x);
        // i++;
        // System.out.println(i);

        // đoạn code ngăn dừng chương trình

        String o = "123";
        int ii = 0;
        try {
            ii = Integer.parseInt(o); // exception phóng ra ở đây, thì nhảy xuống catch liền
            System.out.println("vẫn chạy ok"); // dòng này ko chạy được nếu có exception
        } catch (NumberFormatException e) {
            System.out.println("Chuỗi đầu vào ko hợp lệ.");
            e.printStackTrace();
        }

        ii++;
        System.out.println(ii);

        String y = "1234a";
        int result = convert(y);
        result++;
        System.out.println(result);

    }

    private static int convert(String x) {
        int i = 0;
        try {
            i = Integer.parseInt(x); // exception phóng ra ở đây, thì nhảy xuống catch liền
            System.out.println("vẫn chạy ok"); // dòng này ko chạy được nếu có exception
        } catch (NumberFormatException e) {
            System.out.println("Chuỗi đầu vào ko hợp lệ.");
            e.printStackTrace();
            // throw new RuntimeException(); // nếu ko có dòng này, thì 2 dòng finally đều
            // chạy, nếu có dòng này thì chỉ finally thật chạy
            return 0; // nếu ko có dòng này, thì 2 dòng finally đều chạy, nếu có dòng này thì chỉ
                      // finally thật chạy
        } catch (NullPointerException e) {
            System.out.println(e.getMessage());
        } finally {
            System.out.println("Finally Thật");
        }
        System.out.println("Finally Giả");
        return i;
    }
}

/**
 * Exception ko phải là lỗi
 * Ngoại lệ, ko theo quy củ, ko như thông thường
 * 
 * vd: trúng số (ngoại lệ tốt)
 * vd: đi ngoài đường, bị đập đầu xuống đất (ngoại lệ xấu)
 * 
 * Exception <> Error?
 * Error: nếu chương trình lỗi thì dừng chương trình luôn
 * Exception: cũng có dừng? khi nào dừng?
 * - Khi chúng ta có biện pháp bảo vệ (bảo hộ) thì chương trình ko dừng
 * - vd: đội mũ bảo hiểm
 * - bảo vệ, bảo hộ trong exception chính là try catch
 * NumberFormatException
 * 
 * cái gì sẽ ném ra exception? -> từ 1 hàm hoặc constructor
 * 
 * có mấy loại exception?
 * - bắt buộc phải try catch -> checked exception -> đội mũ bảo hiểm
 * - ko bắt buộc phải try catch -> unchecked exception -> mặc áo mưa
 * - ko có try catch, ko báo lỗi, thì là unchecked exception
 * 
 * - unchecked exception là exception là con, cháu của class RuntimeException
 * 
 * - khi có exception thì nhảy vào catch và bỏ câu lệnh ngay sau vị trí xảy ra
 * exception
 * - nếu ko có catch thì dừng chương trình
 * 
 * finally
 * - cho dù có exception xảy ra hay ko thì các dòng lệnh bên trong khôi finally
 * - vẫn sẽ được thực hiện
 * 
 * ứng dụng finally: close connection(DB), close file
 * 
 * Advance Exception
 * 
 * Câu chuyện giữa 2 người bạn thân học chung 1 lớp
 * Sáng sáng 2 thằng chở nhau đi học
 * 
 * Ngày 1:
 * - đang đi trên đường, thằng ngồi phía trc phát hiện có cục gạch văng vô đầu
 * hắn
 * - //*lấy tay chụp cục gạch.
 * - Cục gạch = Exception
 * 
 * Ngày 2:
 * - đang đi trên đường, thằng ngồi phía trc phát hiện có cục gạch văng vô đầu
 * hắn
 * - thằng ngồi phía trước hén né, để thằng ngồi sau lo mà tránh
 * - //*thằng ngồi sau thấy vậy chụp lấy cục gạch
 * - Cục gạch = Exception
 * 
 * Ngày 3:
 * - đang đi trên đường, thằng ngồi phía trc phát hiện có cục gạch văng vô đầu
 * hắn
 * - thằng ngồi phía trước hén né, để thằng ngồi sau lo mà tránh
 * - //* thằng ngồi sau thấy vậy né luôn
 * - Cục gạch (hôi thối) = Exception
 * 
 * Ngày 4:
 * - đang đi trên đường, thằng ngồi phía trc phát hiện có trái ổi văng vô đầu
 * hắn
 * - thằng ngồi trc chụp, cắn 1 miếng, rồi ném phía sau
 * - thằng ngồi sau thấy vậy chụp xong cắn tiếp
 * - trái ổi (thơm ngon) = Exception
 * 
 * Ngày 5:
 * - đang đi trên đường, thằng ngồi phía trc ko phát hiện cái gì hết, mà hắn lén
 * lấy
 * - cục gạch giấu trong người hắn giả vờ ném ra phía sau.
 * - thằng phía sau làm gì thì đó là chuyện của thằng phía sau
 * - cục gạch (do thằng trc tự tạo ra) = Exception
 */