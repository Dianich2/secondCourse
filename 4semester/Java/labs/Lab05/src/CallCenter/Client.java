package CallCenter;

public class Client extends Thread{

    private boolean reading = false;
    private ConnectionPool<Connection> pool;

    public Client(ConnectionPool<Connection> pool){
        this.pool = pool;
    }

    @Override
    public void run() {
        Connection connection = null;
        try{
            connection = pool.getResource(500);
            reading = true;
            System.out.println("Соединение Клиента № " + this.getId()
            + " соединение № " + connection.getConnectionID());
            connection.using();
        }catch (Exception e){
            System.out.println("Клиент № " + this.getId() +
                    " отказано в соединении ->"
             + e.getMessage());
        }
        finally {
            if(connection != null){
                reading = false;
                System.out.println("Соединение № " + this.getId() + " : " +
                        connection.getConnectionID() + " отсоединился");
                pool.returnResource(connection);
            }
        }
    }

    public boolean isReading() {
        return reading;
    }
}
