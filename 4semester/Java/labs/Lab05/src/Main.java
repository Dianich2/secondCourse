import CallCenter.Client;
import CallCenter.Connection;
import CallCenter.ConnectionPool;

import java.util.LinkedList;

public class Main {


    //Call Center
    public static void main(String[] args) {
        ;
        LinkedList<Connection> list = new LinkedList<Connection>();
        list.add(new Connection(1));
        list.add(new Connection(2));
        list.add(new Connection(3));

        ConnectionPool<Connection> pool = new ConnectionPool<>(list);

        for (int i = 0; i < 10; i++){
            new Client(pool).start();
        }
    }
}