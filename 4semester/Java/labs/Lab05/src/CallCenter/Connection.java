package CallCenter;

import java.util.Random;

public class Connection {

    private int connectionID;

    public Connection(int id){
        this.connectionID = id;
    }

    public void using(){
        try{
            Thread.sleep(new Random().nextInt(500));
        }catch (InterruptedException e){
            e.printStackTrace();
        }
    }

    public void setConnectionID(int connectionID) {
        this.connectionID = connectionID;
    }

    public int getConnectionID(){
        return connectionID;
    }
}
