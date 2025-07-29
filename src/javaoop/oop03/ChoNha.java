package javaoop.oop03;

class ChoNha extends Cho implements IChoSan {
    public ChoNha(String ten) {
        super(ten);
    }

    @Override
    public void sua() {
        System.out.println("Chó nhà " + getTen() + " sủa gâu gâu.");
    }

    @Override
    public void danhHoiTimToiPham() {
        System.out.println(getTen() + " (chó nhà) đang đánh hơi tìm tội phạm.");
    }

    public void an(Shit s) {
        System.out.println("Chó nhà " + getTen() + " đang ăn phân.");
    }

}
