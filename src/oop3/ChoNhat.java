package oop3;

class ChoNhat extends Cho {
    public ChoNhat(String ten) {
        super(ten);
    }

    @Override
    public void sua() {
        System.out.println("Chó Nhật " + getTen() + " sủa hây hây.");
    }

    public void an(PaTe pate) {
        System.out.println("Chó Pháp " + getTen() + " đang ăn pate.");
    }
}
