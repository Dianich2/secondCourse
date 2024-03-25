package org.example;


import javax.xml.transform.Result;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class DAO implements IConnection, IQuery{
    private static final Logger LOGGER = Logger.getLogger(DAO.class.getName());
    static {
        try {
            LOGGER.setUseParentHandlers(false);
            FileHandler fileHandler = new FileHandler("application.log");

            SimpleFormatter formatter = new SimpleFormatter();
            fileHandler.setFormatter(formatter);

            LOGGER.addHandler(fileHandler);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String url;
    private String user;
    private String password;
    private Connection con;
    private Statement statement;

    public DAO(){
        logInfo();
        getProperties();
    }

    public void logInfo(){
        LOGGER.info("Main started");
    }

    @Override
    public ArrayList<String> getProperties() {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
        url = resourceBundle.getString("db.url");
        user = resourceBundle.getString("db.username");
        password = resourceBundle.getString("db.password");

        ArrayList<String> properties = new ArrayList<>();
        properties.add(url);
        properties.add(user);
        properties.add(password);
        return properties;
    }

    @Override
    public Boolean getConnection() {
        try{
            LOGGER.info("Connection...");
            getProperties();
            con = DriverManager.getConnection(url, user, password);
            statement = con.createStatement();
            LOGGER.info("Connected!");
            return true;
        }catch (Exception e){
            LOGGER.log(Level.WARNING, "Error while connecting");
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ResultSet ExecuteQuery(String sql) {
        try{
            return statement.executeQuery(sql);
        }catch (SQLException e){
            e.printStackTrace();
            LOGGER.log(Level.WARNING, "Error while executing query");
            return null;
        }
    }

    public ResultSet ExecutePreparedStatement(int numberOfMoons){
        try{
            /* Найти планету, сумма радиусов спутников которой наибольшая*/
            String sql = """
                    SELECT Name, total_moon_radius
                    FROM(
                    select planets.Name, sum(moons.Radius) as total_moon_radius
                    from planets
                    join planets_moons on planets.Name = planets_moons.planet
                    join moons on planets_moons.moon = moons.Name
                    group by planets.Name
                    ) AS planet_moon_raduis
                    ORDER BY total_moon_radius DESC
                    LIMIT 1
                    """;
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            return preparedStatement.executeQuery();
        }catch (SQLException e){
            e.printStackTrace();
            LOGGER.log(Level.WARNING, "Error while executing query");
            return null;
        }
    }

    public void ExecuteTransaction() throws SQLException {
        con.setAutoCommit(false);
        {
            statement.executeUpdate("UPDATE planets SET LifePresence = true WHERE Name = 'Earth'");
            statement.executeUpdate("UPDATE planets SET LifePresence = false WHERE Name = 'Mars'");
        }

        ResultSet resultSet = statement.executeQuery("SELECT Name, LifePresence FROM planets");

        System.out.println("Before update");
        while (resultSet.next()){
            System.out.print(resultSet.getString(1) + "\t|\t");
            System.out.println(resultSet.getString(2));
        }

        System.out.println("After update");
        statement.executeUpdate("UPDATE planets SET LifePresence = false WHERE Name = 'Earth'");
        statement.executeUpdate("UPDATE planets SET LifePresence = true WHERE Name = 'Mars'");
        con.commit();

        resultSet = statement.executeQuery("SELECT Name, LifePresence FROM planets");
        while (resultSet.next()){
            System.out.print(resultSet.getString(1) + "\t|\t");
            System.out.println(resultSet.getString(2));
        }

    }

    @Override
    public void closeConnection() {
        try {
            con.close();
            LOGGER.info("Connection closed");
        }catch (Exception e){
            e.printStackTrace();
            LOGGER.log(Level.WARNING, "Error while closing connection");
        }
    }
}
