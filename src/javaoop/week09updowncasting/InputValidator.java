package javaoop.week09updowncasting;

import java.util.Scanner;

class InputValidator {
    /**
     * Yêu cầu nhập một chuỗi ký tự không được rỗng.
     * 
     * @param sc     Scanner để đọc input.
     * @param prompt Lời nhắc hiển thị cho người dùng.
     * @return Chuỗi hợp lệ đã được nhập.
     */
    public static String getString(Scanner sc, String prompt) {
        String input;
        while (true) {
            System.out.print(prompt);
            input = sc.nextLine().trim(); // trim() để xóa khoảng trắng thừa ở đầu và cuối
            if (!input.isEmpty()) {
                return input;
            } else {
                System.out.println("Lỗi: Dữ liệu không được để trống. Vui lòng nhập lại.");
            }
        }
    }

    /**
     * Yêu cầu nhập một số nguyên trong một khoảng cho trước.
     * 
     * @param sc     Scanner để đọc input.
     * @param prompt Lời nhắc.
     * @param min    Giá trị nhỏ nhất cho phép.
     * @param max    Giá trị lớn nhất cho phép.
     * @return Số nguyên hợp lệ đã được nhập.
     */
    public static int getInt(Scanner sc, String prompt, int min, int max) {
        int number;
        while (true) {
            try {
                // Thay vì dùng getString rồi parse, ta lấy trực tiếp để bắt lỗi dễ hơn
                System.out.print(prompt);
                number = Integer.parseInt(sc.nextLine());
                if (number >= min && number <= max) {
                    return number;
                } else {
                    System.out.printf("Lỗi: Vui lòng nhập một số trong khoảng từ %d đến %d.\n", min, max);
                }
            } catch (NumberFormatException e) {
                System.out.println("Lỗi: Định dạng số không hợp lệ. Vui lòng nhập lại.");
            }
        }
    }

    /**
     * Yêu cầu nhập một số thực trong một khoảng cho trước.
     * 
     * @param sc     Scanner để đọc input.
     * @param prompt Lời nhắc.
     * @param min    Giá trị nhỏ nhất cho phép.
     * @param max    Giá trị lớn nhất cho phép.
     * @return Số thực hợp lệ đã được nhập.
     */
    public static double getDouble(Scanner sc, String prompt, double min, double max) {
        double number;
        while (true) {
            try {
                System.out.print(prompt);
                number = Double.parseDouble(sc.nextLine());
                if (number >= min && number <= max) {
                    return number;
                } else {
                    System.out.printf("Lỗi: Vui lòng nhập một số trong khoảng từ %.2f đến %.2f.\n", min, max);
                }
            } catch (NumberFormatException e) {
                System.out.println("Lỗi: Định dạng số không hợp lệ. Vui lòng nhập lại.");
            }
        }
    }
}
