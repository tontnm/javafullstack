package oop3;

class ChoPhap extends Cho implements IChoSan {

    public ChoPhap(String ten) {
        super(ten);
    }

    @Override
    public void sua() {
        System.out.println("Chó Pháp " + getTen() + " sủa ghê ghê.");
    }

    @Override
    public void danhHoiTimToiPham() {
        System.out.println(getTen() + " (chó Pháp) đang đánh hơi tìm tội phạm.");
    }

    public void an(PaTe pate) {
        System.out.println("Chó Pháp " + getTen() + " đang ăn pate.");
    }
}
