package oop3;

abstract class Cho {
    private String ten;

    public Cho(String ten) {
        this.ten = ten;
    }

    public String getTen() {
        return ten;
    }
    
    public abstract void sua();

    public void an(CucXuong xuong) {
        System.out.println("Chó " + ten + " đang ăn xương.");
    }
}
