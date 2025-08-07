package quiz.quiz08;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        System.out.println("1.");
        String a = "He" + "llo";
        String b = "Hello" + "";
        System.out.print(a == b);
        System.out.print(a.equals(b));
        System.out.println("\n##############################\n");

        System.out.println("2.");
        int result = 0;

        Boolean b1 = new Boolean("TRUE");
        Boolean b2 = new Boolean("true");
        Boolean b3 = new Boolean("tRuE");
        Boolean b4 = new Boolean("false");

        if (b1 == b2)
            result = 1;
        if (b1.equals(b2))
            result = result + 10;
        if (b2 == b4)
            result = result + 100;
        if (b2.equals(b4))
            result = result + 1000;
        if (b2.equals(b3))
            result = result + 10000;

        System.out.println(result);

        System.out.println("\n##############################\n");

        System.out.println("3.");
        String a5 = "Hello World!";
        String b5 = a5.replace('r', 'o'); // line 2
        String c5 = "Hello".concat(b5); // line 3
        System.out.println(c5);

        System.out.println("\n##############################\n");

        System.out.println("4.");
        String str1 = "Str1";
        String str2 = new String(str1);
        if ("Str1".equals(str1)) {
            System.out.print("Str1");
        }
        if (str2 == str1) {
            System.out.print("Str1==Str2");
        }
        if (str2.equals(str1)) {
            System.out.print("Str2EqualsStr1");
        }

        System.out.println("\n##############################\n");

        System.out.println("5.");
        double aa = getVal((byte) 1, 1.0);
        System.out.println(aa);
        System.out.println("\n##############################\n");

        System.out.println("6.");
        String aa1 = "Xin ";
        String bb1 = "Chao ";
        String cc1 = "2019";
        String d = aa1.concat(bb1).concat(cc1);
        System.out.println(d);

        System.out.println("\n##############################\n");

        System.out.println("7.");
        int i = 1;
        Boolean[] test = new Boolean[2]; // line 2
        Boolean val = test[i]; // line 3
        System.out.println(val);

        System.out.println("\n##############################\n");

        System.out.println("8.");
        int i1 = 1;
        Integer[] test1 = new Integer[2]; // line 2
        Integer val1 = test1[i1]; // line 3
        System.out.println(val1);

        System.out.println("\n##############################\n");

        System.out.println("9.");
        String str11 = "2019";
        String str22 = "2019";
        String str33 = new String("2019");

        System.out.println(str11 == str22);
        System.out.println(str33.equals(str11));

        System.out.println("\n##############################\n");

        System.out.println("10.");
        String str = null;
        // str.concat("2019");
        System.out.println(str);

        System.out.println("\n##############################\n");

        System.out.println("12.");
        int x = 1;
        Integer y = 2; // line 0
        int z = x + y; // line 1

        boolean ax = true;
        Boolean bx = new Boolean(false); // line 2
        Boolean cx = ax && bx; // line 3

        System.out.println(z + " - " + cx); // line 4

        System.out.println("\n##############################\n");

        System.out.println("13.");
        Calendar cal = Calendar.getInstance();

        cal.set(Calendar.DAY_OF_MONTH, 9);
        cal.set(Calendar.MONTH, Calendar.DECEMBER);
        cal.set(Calendar.YEAR, 2019);
        cal.set(Calendar.HOUR_OF_DAY, 10);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);

        System.out.print(cal.getTime());
        cal.set(2019, Calendar.APRIL, 30, 20, 23, 8);
        System.out.print("-");
        System.out.print(cal.getTime());

        System.out.println("\n##############################\n");

        System.out.println("14.");
        Calendar cal1 = Calendar.getInstance();

        cal1.set(Calendar.DAY_OF_MONTH, 10);
        cal1.set(Calendar.MONTH, Calendar.JUNE);
        cal1.set(Calendar.YEAR, 2019);
        cal1.set(Calendar.HOUR_OF_DAY, 10);
        cal1.set(Calendar.MINUTE, 10);
        cal1.set(Calendar.SECOND, 10);

        cal1.roll(Calendar.YEAR, -1);

        System.out.print(cal1.getTime());

        System.out.println("\n##############################\n");

        System.out.println("15.");
        Calendar cal2 = Calendar.getInstance();

        cal2.set(Calendar.DAY_OF_MONTH, 10);
        cal2.set(Calendar.MONTH, Calendar.JUNE);
        cal2.set(Calendar.YEAR, 2019);
        cal2.set(Calendar.HOUR_OF_DAY, 10);
        cal2.set(Calendar.MINUTE, 10);
        cal2.set(Calendar.SECOND, 10);

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        // System.out.println(sdf.format(cal2));

        System.out.println("\n##############################\n");

        System.out.println("16.");
        String aq = "Nguyen Van A";
        aq.replaceAll("n", "m");

        // StringBuffer bq = "Nguyen Van B"; // lỗi
        // bq.reverse();

        // System.out.println(aq + " = " + bq);

        System.out.println("\n##############################\n");

        System.out.println("17.");
        String ae = "Nguyen Van A";
        String be = ae;
        ae = "Nguyen Van B";

        StringBuffer ce = new StringBuffer("Nguyen Van C");
        StringBuffer de = ce.reverse();

        System.out.println(ae == be);
        System.out.println(ae.equals(be));

        System.out.println(ce == de);
        System.out.println(ce.equals(de));

        System.out.println("\n##############################\n");

        System.out.println("18.");
        Map<String, String> map = new HashMap<String, String>();
        map.put("A", "AAA");
        map.put("B", "BBB");
        map.put("A", "CCC");

        System.out.print(map.get("A"));
        System.out.print(map.get("B"));

        System.out.println("\n##############################\n");

        System.out.println("19.");
        Set<String> set = new HashSet<String>();
        set.add("A");
        set.add("B");
        set.add("C");
        set.add("A");
        set.add("B");
        set.add("D");

        System.out.println(set.size());

        System.out.println("\n##############################\n");

        System.out.println("20.");
        SinhVien j;
        j = new SinhVien();
        j.setHoTen("A");
        celebrateBirthday(j);
        System.out.println(j.getTuoi());

        System.out.println("\n##############################\n");

        System.out.println("21.");
        int xe = 0;
        changeA(xe);
        System.out.println(xe);

        System.out.println("\n##############################\n");
    }

    static void changeA(int a) {
        a++;
    }

    static void celebrateBirthday(SinhVien p) {
        p.setTuoi(p.getTuoi() + 1);
    }

    public static Double getVal(byte a, double z) {
        return (short) a / z * 5;
    }

}
