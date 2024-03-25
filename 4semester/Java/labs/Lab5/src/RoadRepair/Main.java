package RoadRepair;

public class Main {
    public static void main(String[] args) {
        Road road = new Road();

        for (int i = 1; i < 11; i++){
            Direction direction = i % 2 == 0 ? Direction.LEFT : Direction.RIGHT;
            new Car(i, direction, road).start();
        }
    }
}
