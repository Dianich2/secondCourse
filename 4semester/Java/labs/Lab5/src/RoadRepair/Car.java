package RoadRepair;

public class Car extends Thread{
    private int carId;
    private Direction direction;
    private Road road;

    public Car(int carId, Direction direction, Road road){
        this.carId = carId;
        this.direction = direction;
        this.road = road;
    }

    @Override
    public void run(){
        try{
            road.carArrives(carId, direction);

        }catch (InterruptedException e){
            e.printStackTrace();
        }
    }

    public int getCarId(){
        return carId;
    }

    public Direction getDirection(){
        return direction;
    }
}
