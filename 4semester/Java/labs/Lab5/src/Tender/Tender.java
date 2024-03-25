package Tender;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.concurrent.CyclicBarrier;

public class Tender {

    private ArrayList<Seller> sellers;
    private CyclicBarrier barrier;
    public final int SELLERS_NUMBER = 5;

    public Tender(){
        sellers = new ArrayList<>();
        barrier = new CyclicBarrier(SELLERS_NUMBER, new Runnable() {
            @Override
            public void run() {
                Seller winner = getWinner();
                System.out.println("Seller " + winner.getSellerId() + "has won, " +
                        "price: " + winner.getPrice());
            }
        });
    }

    public Seller getWinner(){
        return Collections.min(sellers, new Comparator<Seller>() {
            @Override
            public int compare(Seller o1, Seller o2) {
                return o1.getPrice() - o2.getPrice();
            }
        });
    }

    public void addSeller(Seller seller){
        sellers.add(seller);
    }

    public CyclicBarrier getBarrier(){
        return barrier;
    }

}
