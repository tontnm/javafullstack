package javaoop.week14exception;

import java.io.IOException;

public class Main1 {
    public static void main(String[] args) {
        int age = 18;
        if (age < 0) {
            throw new IllegalArgumentException("Age cannot be negative");
        }
    }

    public static void readFile(String fileName) throws IOException {

    }
}

/**
 * Exception ko phải chỉ đc chương trình phóng ra mà còn đc dev cố tình lập trình
 * để phóng ra trong một số tình huống nào đó.
 * 
 * throws
 * báo để cho java biết để cho các lập trình viên khi sử dụng đến hàm này thì phải
 * có biện pháp try-catch exception
 */