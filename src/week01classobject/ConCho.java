package week01classobject;

class ConCho {
    private String ten;
    private int tuoi;

    public ConCho(String ten, int tuoi) {
        this.ten = ten;
        this.tuoi = tuoi;
    }

    public void showInfor() {
        System.out.println("Tên: " + ten);
        System.out.println("Tuổi: " + tuoi);
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getTuoi() {
        return tuoi;
    }

    public void setTuoi(int tuoi) {
        this.tuoi = tuoi;
    }
}
