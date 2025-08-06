package javacore.bai19;

public class Main {
    public static void main(String[] args) {
        int[] arr = { 5, 8, 2, 5, 1, 9, 10, 3, 4, 6 };
        int n = arr.length;
        boolean swapped;

        for (int i : arr) {
            System.out.print(i + " ");
        }
        System.out.println();
        for (int i = 0; i < n - 1; i++) {
            swapped = false;

            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    // Hoán đổi
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    swapped = true;
                }
            }

            // Nếu không có hoán đổi nào → mảng đã sắp xếp
            if (!swapped)
                break;
        }
        for (int i : arr) {
            System.out.print(i + " ");
        }
    }
}

/**
 * !CỜ HIỆU (Flag)
 * - Cờ là 1 biến có giá trị là đúng hoặc sai (để trả lời các câu hỏi như
 * *xong chưa, có hay không, hoàn thành chưa, đủ chưa...)
 * - Thường kết hợp với vòng lặp
 * - Trong quá trình lặp của vòng lặp thì cờ nó sẽ thay đổi giá trị. Nhưng ko
 * phải
 * bao giờ nó cũng thay đổi mà nó thay đổi khi thỏa điều kiện nào đó ( tức là
 * thường có câu
 * lệnh if nào đó xuất hiện, và biến cờ đó nằm trong lệnh if đó và bị thay đổi
 * giá trị)
 * Ex: tìm trong mảng có k hay ko?
 * 
 * !LÍNH CANH (Sentinel)
 * - Lính canh cũng là 1 biến, thường có giá trị thuộc kiểu bất kỳ (bao gồm
 * boolean)
 * - Cũng xuất hiện trong vòng lặp
 * - Trong quá trình chạy của vòng lặp thì lính canh cũng thay đổi giá trị
 * - Nhưng khác cờ hiệu ở chỗ là khi biến lính canh thay đổi giá trị trong
 * vòng lặp thì
 * vòng lặp không dừng lại ngay tại đó mà vẫn cứ chạy tiếp cho đến hết vòng
 * lặp
 * - Một lính canh có thể thay đổi nhiều giá trị khác nhau trong qua
 * trình chạy vòng lặp
 */