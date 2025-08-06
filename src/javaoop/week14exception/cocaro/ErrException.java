package javaoop.week14exception.cocaro;

/**
 * Exception tùy chỉnh để xử lý các lỗi validate.
 */
public class ErrException extends Exception {
    public ErrException(String message) {
        super(message);
    }
}
