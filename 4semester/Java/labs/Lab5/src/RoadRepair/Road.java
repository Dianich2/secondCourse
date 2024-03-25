package RoadRepair;

import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

public class Road {
    private Semaphore semaphore = new Semaphore(3);
    private AtomicInteger carsOnRoad = new AtomicInteger(0);
    private boolean isThereCarsInOppositeDirection;

    public void carArrives(int carId, Direction direction) throws InterruptedException{
        System.out.println("Car " + carId + " arrived, moves " + direction);
        isThereCarsInOppositeDirection = carsOnRoad.get() > 0 &&
                (direction == Direction.LEFT && carsOnRoad.get() % 2 == 1
                || direction == Direction.RIGHT && carsOnRoad.get() % 2 == 0);
        while (isThereCarsInOppositeDirection){
            Thread.sleep(100);
        }

        semaphore.acquire();
        carsOnRoad.incrementAndGet();
        System.out.println("Car " + carId + " is moving " + direction);
        Thread.sleep(2000);
        carsOnRoad.decrementAndGet();
        semaphore.release();
        isThereCarsInOppositeDirection = carsOnRoad.get() > 0 &&
                (direction == Direction.LEFT && carsOnRoad.get() % 2 == 1
                || direction == Direction.RIGHT && carsOnRoad.get() % 2 == 0);

    }

}
