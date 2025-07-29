package javaoop.week02accessmodifier;

public class Main {

}

/**
 * Class A "nhìn thấy" Class B nghĩa là:
 * - ở code của Class A, ta có thể: extends Class B
 * - new đối tượng của Class (hàm dựng của Class B phải được A nhìn thấy thì mới
 * new được)
 * nhưng trong tình huống, mà Class A ko hề nhìn thấy hàm dựng của Class B
 * thì Class A ko thể new đối tượng của Class B được.
 * 
 * Sau khi class A đã nhìn thấy Class B
 * thì ta mới xét tiếp là class A nhìn thấy những class members nào của lớp B.
 * 
 * protected = default(nếu xét về mức độ nhìn thấy) + cho phép class con kế thừa
 * 
 * kế thừa?
 * Class B kế thừa Class A nghĩa là:
 * - bảng mô tả B kế thừa bảng mô tả A
 * - Bảng mô tả B copy (1 phần hoặc tất cả) bảng mô tả A
 * 
 */
