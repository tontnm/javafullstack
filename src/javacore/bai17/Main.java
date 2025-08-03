package javacore.bai17;

public class Main {
    /**
     * no f(no), no f(yes), yes f(no), yes f(yes)
     * return: 1. trả về giá trị từ hàm, 2. quay về lại nơi đã gọi hàm
     * hàm dùng để chia nhỏ code dài thành code ngắn để dễ code, dễ kiểm soát
     * tách những việc lặp đi lặp lại ra thành những hàm riêng. Chỉ cần code 1 lần
     * cho những chỗ có những dòng code giống nhau. Từ đó, mỗi lần ta sửa code thì
     * chỉ sửa 1 chỗ thôi, chứ ko cần sửa nhiều chỗ.
     * 2 hàm trùng tên, khác danh sách tham số -> ok
     * 2 hàm trùng tên, cùng ds tham số, khác kiểu trả về -> not ok
     * biến local và biến global giống tên nhau thì sao? giá trị sẽ đc gán vào local
     * ko nên để 2 loại biến này giống tên nhau
     * hàm gọi hàm được
     * hàm return về 1 hàm khác có đc ko? -> được
     * hàm nằm trong điều kiện của  if hoặc while có đc ko? -> được
     * debug từng bước, debug in ra i, j
     */
}
