package Tender;

import java.util.Random;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

public class Seller extends Thread{
    private int sellerId;
    private int price;
    private CyclicBarrier barrier;

    public Seller(int sellerId, CyclicBarrier barrier){
        this.sellerId = sellerId;
        this.barrier = barrier;
    }

    @Override
    public void run() {
        try{
            price = new Random().nextInt(100) + 50;
            System.out.println("Seller " + sellerId + " offer price: " + price);

            barrier.await();
        }catch (InterruptedException | BrokenBarrierException e){
            e.printStackTrace();
        }
    }

    public int getSellerId(){
        return sellerId;
    }

    public int getPrice(){
        return price;
    }
}
