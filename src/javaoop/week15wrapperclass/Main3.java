package javaoop.week15wrapperclass;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

public class Main3 {
    public static void main(String[] args) {
        System.out.println("1.Chuyển chuỗi “02/28/2019” sang kiểu java.util.Date");
        Date d = convertStringDateToUtilDate("02/28/2019", "MM/dd/yyyy");
        System.out.println(d);
        System.out.println("\n#########################################################\n");

        System.out.println(
                "2.Chuyển ngày hiện tại (của hệ thống) đang ở kiểu java.util.Date sang kiểu String theo đinh dạng YYYY/MM/DD và hiển thị ra màn hình");
        String strDate = convertUtilDateToString("yyyy/MM/dd");
        System.out.println(strDate);
        System.out.println("\n#########################################################\n");

        System.out.println("3.Lấy ngày, tháng, năm, giờ, phút, giây hiện tại của hệ thống");
        Calendar cal = Calendar.getInstance();
        System.out.println("Ngày: " + cal.get(Calendar.DAY_OF_MONTH));
        System.out.println("Tháng: " + (cal.get(Calendar.MONTH) + 1)); // Tháng bắt đầu từ 0
        System.out.println("Năm: " + cal.get(Calendar.YEAR));
        System.out.println("Giờ: " + cal.get(Calendar.HOUR_OF_DAY));
        System.out.println("Phút: " + cal.get(Calendar.MINUTE));
        System.out.println("Giây: " + cal.get(Calendar.SECOND));
        System.out.println("\n#########################################################\n");

        System.out.println(
                "4.Hãy cho biết 1 tháng sau (tính từ ngày hiện tại) sẽ rơi vào thứ mấy trong tuần, và cách ngày hiện tại bao nhiêu ngày");
        LocalDate today = LocalDate.now();
        LocalDate nextMonth = today.plusMonths(1);

        DayOfWeek dayOfWeek = nextMonth.getDayOfWeek();
        long daysBetween = ChronoUnit.DAYS.between(today, nextMonth);

        System.out.println("Một tháng sau là: " + nextMonth);
        System.out.println("Thứ trong tuần: " + dayOfWeek);
        System.out.println("Cách hiện tại: " + daysBetween + " ngày");
        System.out.println("\n#########################################################\n");

        System.out.println(
                "5.Hãy cho biết cách đây 1000 ngày (tính từ ngày hiện tại) là ngày tháng năm nào");
        LocalDate pastDate = today.minusDays(1000);
        System.out.println("1000 ngày trước là: " + pastDate);
        System.out.println("\n#########################################################\n");

        System.out.println(
                "6.Hãy nhập vào 2 String có định dạng là DD/MM/YYYY. Hãy chuyển thành 2 biến kiểu Date. Sau đó hãy tính số ngày chênh lệch giữa 2 ngày đã nhập vào");
        long soNgayChenhLech = tingNgayChenhLechGiua2Ngay("01/08/2025", "05/08/2025");
        System.out.println(soNgayChenhLech);
        System.out.println("\n#########################################################\n");

        System.out.println(
                "7.Hãy nhập vào 1 String có định dạng là DD/MM/YYYY. Sau đó, nhập vào số tự nhiên n. Hãy in ra ngày đứng sau ngày đã nhập n ngày");
        LocalDate ngayN = tinhNgaySauN("05/08/2025", 3);
        System.out.println(ngayN);
        System.out.println("\n#########################################################\n");

        System.out.println(
                "8.Hãy nhập vào 1 String. Kiểm tra xem String đó có chứa một ngày theo định dạng DD/MM/YYYY hay không");
        String test1 = "05/08/2025";
        String test2 = "05/13/2025";
        String test3 = "32/08/2025";
        String test4 = "05-08-2025";
        String test5 = "0";
        System.out.println(test1 + " -> " + isValidDate(test1, "dd/MM/yyyy"));
        System.out.println(test2 + " -> " + isValidDate(test2, "dd/MM/yyyy"));
        System.out.println(test3 + " -> " + isValidDate(test3, "dd/MM/yyyy"));
        System.out.println(test4 + " -> " + isValidDate(test4, "dd/MM/yyyy"));
        System.out.println(test5 + " -> " + isValidDate(test5, "dd/MM/yyyy"));
        System.out.println("\n#########################################################\n");
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

    public static LocalDate tinhNgaySauN(String d, int n) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date = LocalDate.parse(d, formatter);
        LocalDate result = date.plusDays(n);
        return result;
    }

    public static long tingNgayChenhLechGiua2Ngay(String d1, String d2) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date1 = LocalDate.parse(d1, formatter);
        LocalDate date2 = LocalDate.parse(d2, formatter);
        long diff = ChronoUnit.DAYS.between(date1, date2);

        return Math.abs(diff);
    }

    public static Date convertStringDateToUtilDate(String d, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        Date date;
        try {
            date = sdf.parse(d);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String convertUtilDateToString(String pattern) {
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String formattedDate = sdf.format(now);
        return formattedDate;
    }
}
