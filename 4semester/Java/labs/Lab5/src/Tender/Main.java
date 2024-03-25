package Tender;

import java.util.Random;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        Tender tender = new Tender();

        for (int i = 1; i <= tender.SELLERS_NUMBER; i++){
            Seller seller = new Seller(i, tender.getBarrier());
            tender.addSeller(seller);
            seller.start();
            Thread.sleep(new Random().nextInt(1000) + 2000);
        }
    }
}
