package quiz.quiz09;

import javaoop.week14exception.MyException;

public class Main {
    public static void main(String[] args) {
        System.out.println("1.");
        try {
            int x = 0;
            int y = 15 / x;
        } catch (Exception e) {
            System.out.print("Exception");
        } finally {
            System.out.print("Finally");
        }

        System.out.println("\n############################################\n");

        System.out.println("2.");
        try {
            int x = Integer.parseInt("12.1"); // line 1
        } catch (Exception e) { // line 2
            System.out.print("Exception");
        }
        // catch (NumberFormatException e) { // line 3
        // System.out.print("NumberFormatException");
        // }

        System.out.println("\n############################################\n");

        System.out.println("3.");
        // int x = Integer.parseInt("ABC");
        // long y = Long.parseLong("XYZ");

        System.out.println("\n############################################\n");

        System.out.println("4.");
        int y = a("10");
        System.out.println(y);

        System.out.println("\n############################################\n");

        System.out.println("5.");
        int a = doIt("10");
        System.out.println(a);
        int b = doIt("ABC");
        System.out.println(b);

        System.out.println("\n############################################\n");

        System.out.println("6.");
        int b1 = doIt1("ABC");
        System.out.println(b1);

        System.out.println("\n############################################\n");

        System.out.println("7.");
        try {
            String str = null;
            str.concat("ABC");
            try {
                int x = Integer.parseInt("ABC");
            } catch (NumberFormatException e) {
                System.out.println("InvalidNumber");
            }
        } catch (NullPointerException e) {
            System.out.println("InvalidString");
        }

        System.out.println("\n############################################\n");

        System.out.println("8.");
        try {
            String str = null;
            str.concat("ABC");
            int x = Integer.parseInt("ABC");
        } catch (Exception e) {
            System.out.println("InvalidString");
        }
        // catch (NumberFormatException e) {
        // System.out.println("InvalidNumber");
        // }

        System.out.println("\n############################################\n");

        System.out.println("9.");
        try {
            // getX();
        } catch (Exception e) {
            System.out.print("Main");
        }

        System.out.println("\n############################################\n");

        System.out.println("10.");
        // getX();
        System.out.println("\n############################################\n");

        System.out.println("11.");
        // try {
        //     System.out.println(getX11());
        // } catch (MyException e) { // line 1
        //     System.out.println("MyException");
        // }

        System.out.println("\n############################################\n");
    }

    // public static int getX11() throws Exception { // line 2
    //     try {
    //         int x = Integer.parseInt("ABC");
    //         return x;
    //     } catch (Exception e) {
    //         throw new MyException(); // line 3
    //     }
    // }

    public static int getX() throws Exception {
        try {
            int x = Integer.parseInt("ABC");
            return x;
        } catch (Exception e) {
            System.out.println("getX");
        }
        return 0;
    }

    // public static int getX() throw Exception{
    // try {
    // int x = Integer.parseInt("ABC");
    // return x;
    // } catch (Exception e) {
    // System.out.print("getX");
    // }
    // return 0;
    // }

    public static int doIt1(String str) {
        int x = 0;
        try {
            x = Integer.parseInt(str);
            System.out.println("ParseDone");
        } catch (NumberFormatException e) {
            System.out.println("Exception");
        }
        System.out.println("Here");
        return x;
    }

    public static int doIt(String str) {
        int x = 0;
        try {
            x = Integer.parseInt(str);
            return x;
        } catch (NumberFormatException e) {
            System.out.println("Exception");
        } finally {
            return -1;
        }

    }

    public static int a(String str) {
        try {
            int x = Integer.parseInt(str);
            return x;
        } catch (NumberFormatException e) {
            System.out.println("Exception");
        } finally {
            System.out.println("Finally");
        }
        return 0;
    }

}
