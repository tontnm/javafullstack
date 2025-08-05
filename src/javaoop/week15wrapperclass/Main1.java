package javaoop.week15wrapperclass;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Calendar;

public class Main1 {
    public static void main(String[] args) {
        LocalDate daten = LocalDate.now();
        LocalTime time = LocalTime.now();
        LocalDateTime now = LocalDateTime.now();

        System.out.println(daten);
        System.out.println(time);
        System.out.println(now);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        System.out.println("Thời gian hiện tại: " + now.format(formatter));

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        // Định nghĩa mốc thời gian ban đầu là ngày 31-07-2011

        Date date = Date.valueOf("2025-08-04");

        c1.setTime(date);
        c2.setTime(date);

        System.out.println("Ngày ban đầu : " + dateFormat.format(c1.getTime()));

        // Tăng ngày thêm 8 ngày -- Sử dụng phương thức roll()
        c1.roll(Calendar.DATE, 8);

        // c1.roll(Calendar.DATE, -8); // Giảm ngày 8 ngày ==> 23-07-2011
        System.out.println("Ngày được tăng thêm 8 ngày (Sử dụng Roll) : " + dateFormat.format(c1.getTime()));

        /*
         * Các trường hợp khác
         * c1.roll(Calendar.DATE, true); //Tăng 1 ngày -- Nếu muốn giảm một ngày truyền
         * vào false
         * c1.roll(Calendar.MONTH, 2); //Tăng lên 2 tháng
         * c1.roll(Calendar.YEAR, 2) ; //Tăng lên 2 năm
         */

        // Tăng ngày thêm 8 ngày -- Sử dụng phương thức add()
        c2.add(Calendar.DATE, 8);
        // c2.add(Calendar.DATE, -8); // Giảm ngày 8 ngày ==> 23-07-2011
        System.out.println("Ngày được tăng thêm 8 ngày (Sử dụng add)  : "
                + dateFormat.format(c2.getTime()));

        /*
         * Các trường hợp khác :
         * c2.add(Calendar.MONTH, 2); //Tăng lên 2 tháng
         * c2.add(Calendar.YEAR, 2) ; //Tăng lên 2 năm
         */

        System.out.println("1. Khoảng cách giữa 2 ngày ( Đếm số ngày giữa 2 mốc thời gian).");
        Date date1 = Date.valueOf("2011-06-15");
        Date date2 = Date.valueOf("2011-07-30");

        c1.setTime(date1);
        c2.setTime(date2);

        // Công thức tính số ngày giữa 2 mốc thời gian:
        long noDay = (c2.getTime().getTime() - c1.getTime().getTime()) / (24 * 3600 * 1000);

        System.out.print("Số ngày giữa " + dateFormat.format(c1.getTime())

                + " và " + dateFormat.format(c2.getTime()) + ": ");

        System.out.println(noDay);

        printDateDifference("15/06/2011", "30/07/2011", "dd/MM/yyyy");

        System.out.println("2. So sánh 2 mốc thời gian (So sánh 2 ngày)");
        String relation;
        if (date1.equals(date2))
            relation = "Hai ngày trùng nhau";
        else if (date1.before(date2)) // Hoặc else if (date1.after(date2)== false)
            relation = " Trước";
        else
            relation = " Sau";
        System.out.println(date1 + relation + ' ' + date2);

        System.out.println("3. Kiểm tra một chuỗi có phải là một ngày hay không");
        String d1 = "31/12/2023";
        String d2 = "31/02/2023";
        String d3 = "28-02-2023";
        String d4 = "abc";
        String d5 = "02/28/2023";

        System.out.println("Ngày " + d1 + " hợp lệ? " + isValidDate(d1, "dd/MM/yyyy"));
        System.out.println("Ngày " + d2 + " hợp lệ? " + isValidDate(d2, "dd/MM/yyyy"));
        System.out.println("Ngày " + d3 + " hợp lệ? " + isValidDate(d3, "dd/MM/yyyy"));
        System.out.println("Ngày " + d3 + " hợp lệ? " + isValidDate(d3, "dd-MM-yyyy"));
        System.out.println("Ngày " + d4 + " hợp lệ? " + isValidDate(d4, "dd/MM/yyyy"));
        System.out.println("Ngày " + d5 + " hợp lệ? " + isValidDate(d5, "dd/MM/yyyy"));

        System.out.println("4. Kiểm tra có phải năm nhuận hay không?");
        int y1 = 2025;
        int y2 = 2024;

        System.out.println("Năm " + y1 + " có phải năm nhuận? " + isLeapYear(y1));
        System.out.println("Năm " + y2 + " có phải năm nhuận? " + isLeapYear(y2));

        System.out.println("5. Đếm số ngày trong một tháng.");
        int year = 2025, year1 = 2024;
        int month = 2, month1 = 2;

        System.out.println("Số ngày trong tháng " + month + "/" + year + " là: " + getDaysInMonth(year, month));
        System.out.println("Số ngày trong tháng " + month1 + "/" + year1 + " là: " + getDaysInMonth(year1, month1));

        System.out.println("Lấy múi giờ VN và Singapore");
        ZoneId vnZone = ZoneId.of("Asia/Ho_Chi_Minh"); // Múi giờ Việt Nam (UTC+7)
        ZonedDateTime vnTimeZone = ZonedDateTime.now(vnZone);
        DateTimeFormatter zoneFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss z");

        ZoneId sgZone = ZoneId.of("Asia/Singapore"); // Múi giờ Singapore (UTC+8)
        ZonedDateTime sgTimeZone = ZonedDateTime.now(sgZone);

        System.out.println("Thời gian hiện tại ở Việt Nam: " + vnTimeZone.format(zoneFormatter));
        System.out.println("Thời gian hiện tại ở Singapore: " + sgTimeZone.format(zoneFormatter));

    }

    public static void printDateDifference(String startDateStr, String endDateStr, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

        Period period = Period.between(startDate, endDate);

        System.out.println("Khoảng thời gian giữa hai ngày:");
        System.out
                .println(period.getYears() + " năm, " + period.getMonths() + " tháng, " + period.getDays() + " ngày.");
    }

    public static int getDaysInMonth(int year, int month) {
        YearMonth yearMonth = YearMonth.of(year, month);
        return yearMonth.lengthOfMonth();
    }

    public static boolean isLeapYear(int year) {
        if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
            return true;
        }
        return false;
    }

    public static boolean isValidDate(String dateStr, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        try {
            LocalDate date = LocalDate.parse(dateStr, formatter);
            return true;
        } catch (DateTimeParseException e) {
            return false;
        }
    }

}
