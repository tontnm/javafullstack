package javaoop.week14exception.cocaro;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Lớp chính để quản lý và thực thi logic game Cờ ca rô.
 */
public class QuanLyCoCaRo {
    // Khai báo các hằng số cho kích thước bàn cờ
    private static final int SO_HANG = 20;
    private static final int SO_COT = 30;

    public static void main(String[] args) {
        try {
            // Bước 1 & 2: Đọc file, validate dữ liệu và lưu vào mảng 2 chiều
            // Nếu có lỗi, một ErrException sẽ được ném ra ở đây.
            String[][] banCo = docVaValidateFile(
                    "C:/projects/javafullstack/src/javaoop/week14exception/cocaro/coCaRo.txt");
            // C:/projects/javafullstack/src/javaoop/week14exception/cocaro/coCaRo.txt
            // C:\\projects\\javafullstack\\src\\javaoop\\week14exception\\cocaro\\coCaRo.txt

            // Nếu không có lỗi, tiếp tục thực hiện các yêu cầu khác
            System.out.println("--- Yeu cau 1: Doc du lieu va in ban co ---");
            inBanCo(banCo);

            System.out.println("\n--- Yeu cau 3: Kiem tra ket qua tran dau ---");
            String ketQua = xacDinhKetQua(banCo);
            System.out.println(ketQua);

        } catch (ErrException e) {
            // Yêu cầu 4: Bắt Exception tùy chỉnh và hiển thị thông báo lỗi tổng hợp
            System.out.println("--- Phat hien loi trong file dau vao ---");
            System.err.println(e.getMessage());
        } catch (IOException e) {
            System.err.println("Loi: Khong the doc file coCaRo.txt. Vui long kiem tra lai file.");
            e.printStackTrace();
        }
    }

    /**
     * Yêu cầu 1 & 2 & 4: Đọc file, thực hiện tất cả các bước validate,
     * và ném ra ErrException nếu có lỗi.
     * 
     * @param tenFile Tên file dữ liệu đầu vào.
     * @return Mảng 2 chiều chứa bàn cờ nếu dữ liệu hợp lệ.
     * @throws IOException  Nếu có lỗi khi đọc file.
     * @throws ErrException Nếu dữ liệu trong file không hợp lệ.
     */
    private static String[][] docVaValidateFile(String tenFile) throws IOException, ErrException {
        StringBuffer tongHopLoi = new StringBuffer();
        List<String[]> cacNuocDiHopLe = new ArrayList<>();
        Set<String> viTriDaDanh = new HashSet<>();
        int soQuanX = 0;
        int soQuanO = 0;
        int soDong = 0;

        try (BufferedReader br = new BufferedReader(new FileReader(tenFile))) {
            String line;
            while ((line = br.readLine()) != null) {
                soDong++;
                // dòng empty thì bỏ qua
                if (line.trim().isEmpty()) {
                    continue;
                }

                // ko đủ 3 yếu tố quân cờ, vị trí hàng, vị trí cột thì lưu lỗi,rồi bỏ qua
                String[] parts = line.split(",");
                if (parts.length != 3) {
                    tongHopLoi.append("Dong ").append(soDong).append(" co dinh dang khong hop le.");
                    continue;
                }

                // lấy quân cờ ra
                String quanCo = parts[0].trim().toUpperCase();
                int hang = -1, cot = -1;

                // ko phải x hay o thì lưu lỗi
                // Validate tên quân cờ (Yêu cầu 2a)
                if (!quanCo.equals("X") && !quanCo.equals("O")) {
                    tongHopLoi.append("Dong ").append(soDong).append(" co ten quan co khong hop le!");
                }

                // kiểm tra vị trí hàng, cột có phải là số ko, ko phải thì lưu lỗi
                // kiểm tra vị trí có nằm trong phạm vi cho phép ko, ko thì lưu lỗi
                // Validate vị trí hàng và cột (Yêu cầu 2b)
                try {
                    hang = Integer.parseInt(parts[1].trim());
                    cot = Integer.parseInt(parts[2].trim());
                    if (hang < 1 || hang > SO_HANG || cot < 1 || cot > SO_COT) {
                        tongHopLoi.append("Dong ").append(soDong).append(" co vi tri hang hoac cot khong hop le!");
                    }
                } catch (NumberFormatException e) {
                    tongHopLoi.append("Dong ").append(soDong).append(" co vi tri hang hoac cot khong phai la so!");
                }

                // Validate trùng vị trí (Yêu cầu 2c)
                if (hang != -1 && cot != -1) {
                    String viTri = hang + "," + cot;
                    if (viTriDaDanh.contains(viTri)) {
                        tongHopLoi.append("Dong ").append(soDong).append(" co xuat hien 2 quan co bi trung vi tri!");
                    } else {
                        viTriDaDanh.add(viTri);
                        // Chỉ thêm nước đi và đếm nếu vị trí hợp lệ và không trùng
                        if (quanCo.equals("X"))
                            soQuanX++;
                        else if (quanCo.equals("O"))
                            soQuanO++;
                        cacNuocDiHopLe.add(new String[] { quanCo, String.valueOf(hang), String.valueOf(cot) });
                    }
                }
            }
        }

        // Validate phân bổ số lượng quân cờ (Yêu cầu 2d)
        if (Math.abs(soQuanX - soQuanO) > 1) {
            tongHopLoi.append("Phan bo so luong quan co khong hop le!");
        }

        // Nếu có lỗi, ném ra ErrException với thông điệp tổng hợp
        if (tongHopLoi.length() > 1) {
            throw new ErrException(tongHopLoi.toString());
        }

        // Nếu không có lỗi, tạo và điền vào bàn cờ
        String[][] banCo = new String[SO_HANG + 1][SO_COT + 1];
        for (String[] nuocDi : cacNuocDiHopLe) {
            String quanCo = nuocDi[0];
            int hang = Integer.parseInt(nuocDi[1]);
            int cot = Integer.parseInt(nuocDi[2]);
            banCo[hang][cot] = quanCo;
        }
        return banCo;
    }

    /**
     * In bàn cờ ra màn hình console.
     * 
     * @param banCo Mảng 2 chiều chứa bàn cờ.
     */
    private static void inBanCo(String[][] banCo) {
        System.out.println("Ban co hien tai:");
        for (int i = 1; i <= SO_HANG; i++) {
            for (int j = 1; j <= SO_COT; j++) {
                System.out.print((banCo[i][j] == null ? "-" : banCo[i][j]) + " ");
            }
            System.out.println();
        }
    }

    /**
     * Yêu cầu 3: Xác định kết quả của trận đấu.
     * 
     * @param banCo Mảng 2 chiều chứa bàn cờ.
     * @return Chuỗi thông báo kết quả.
     */
    private static String xacDinhKetQua(String[][] banCo) {
        if (kiemTraThang("X", banCo)) {
            return "Nguoi choi quan X da thang!";
        }
        if (kiemTraThang("O", banCo)) {
            return "Nguoi choi quan O da thang!";
        }

        // Kiểm tra hòa
        int soQuanCo = 0;
        for (int i = 1; i <= SO_HANG; i++) {
            for (int j = 1; j <= SO_COT; j++) {
                if (banCo[i][j] != null) {
                    soQuanCo++;
                }
            }
        }

        if (soQuanCo == SO_HANG * SO_COT) {
            return "2 nguoi choi da hoa!";
        }

        return "Chua phan thang bai, phai tiep tuc thi dau";
    }

    /**
     * Kiểm tra xem một người chơi đã thắng hay chưa (5 quân cờ liên tiếp).
     * 
     * @param quanCo "X" hoặc "O".
     * @param banCo  Mảng 2 chiều chứa bàn cờ.
     * @return true nếu người chơi đó thắng, false nếu ngược lại.
     */
    private static boolean kiemTraThang(String quanCo, String[][] banCo) {
        // Duyệt qua tất cả các ô trên bàn cờ
        for (int i = 1; i <= SO_HANG; i++) {
            for (int j = 1; j <= SO_COT; j++) {
                // Nếu ô này không phải quân cờ của người chơi, bỏ qua
                if (!quanCo.equals(banCo[i][j])) {
                    continue;
                }

                // Kiểm tra 4 hướng từ ô hiện tại: ngang, dọc, chéo xuống, chéo lên
                // Chỉ cần kiểm tra 5 ô tính từ điểm bắt đầu (i, j)

                // 1. Kiểm tra hàng ngang
                if (j + 4 <= SO_COT) {
                    boolean thang = true;
                    for (int k = 1; k < 5; k++) {
                        if (!quanCo.equals(banCo[i][j + k])) {
                            thang = false;
                            break;
                        }
                    }
                    if (thang)
                        return true;
                }

                // 2. Kiểm tra hàng dọc
                if (i + 4 <= SO_HANG) {
                    boolean thang = true;
                    for (int k = 1; k < 5; k++) {
                        if (!quanCo.equals(banCo[i + k][j])) {
                            thang = false;
                            break;
                        }
                    }
                    if (thang)
                        return true;
                }

                // 3. Kiểm tra đường chéo xuống (từ trái qua phải)
                if (i + 4 <= SO_HANG && j + 4 <= SO_COT) {
                    boolean thang = true;
                    for (int k = 1; k < 5; k++) {
                        if (!quanCo.equals(banCo[i + k][j + k])) {
                            thang = false;
                            break;
                        }
                    }
                    if (thang)
                        return true;
                }

                // 4. Kiểm tra đường chéo lên (từ trái qua phải)
                if (i - 4 >= 1 && j + 4 <= SO_COT) {
                    boolean thang = true;
                    for (int k = 1; k < 5; k++) {
                        if (!quanCo.equals(banCo[i - k][j + k])) {
                            thang = false;
                            break;
                        }
                    }
                    if (thang)
                        return true;
                }
            }
        }
        return false;
    }
}
