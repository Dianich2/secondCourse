package com.example.lab910.repositories;

import com.example.lab910.entities.Player;
import com.example.lab910.entities.ROLES;
import com.example.lab910.entities.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class Repository {

    private String url;
    private String user;
    private String password;
    private Connection con;
    private Statement statement;

    public Repository(){
        getProperties();
    }


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

    public Boolean getConnection() {
        try{
            getProperties();
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            statement = con.createStatement();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public void saveUser(User user) throws SQLException {
        getConnection();
        String sql = "INSERT INTO users (password, role, username) " +
                "VALUES ('" + user.getPassword() +"', " +
                "'"+ user.getRole().toString() +"'," +
                " '"+ user.getUsername() +"')";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.executeUpdate();
        closeConnection();
    }

    public void savePlayer(Player player) throws SQLException {
        getConnection();
        String sql = "INSERT INTO players (coach_id, name, tel, email) " +
                "VALUES (?, ?, ?, ?)";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setInt(1, player.getCoachId());
        preparedStatement.setString(2, player.getName());
        preparedStatement.setString(3, player.getTel());
        preparedStatement.setString(4, player.getEmail());
        preparedStatement.executeUpdate();
        preparedStatement.close();
        closeConnection();
    }

    public List<Player> findPlayersByCoachId(Integer coachId) throws SQLException {
        getConnection();
        String sql = "SELECT players.id, players.coach_id, players.name, players.tel, players.email " +
                     "FROM players WHERE coach_id = ?";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setInt(1, coachId);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<Player> players = new ArrayList<>();
        while (resultSet.next()){
            players.add(new Player(
                    resultSet.getInt("id"),
                    resultSet.getInt("coach_id"),
                    resultSet.getString("name"),
                    resultSet.getString("tel"),
                    resultSet.getString("email")
                    ));
        }
        closeConnection();
        return players;
    }

    public User findUserByUsername(String username) throws SQLException {
        getConnection();
        User user = null;
        String sql = "SELECT users.id, users.username, users.role, users.password FROM users "+
                "WHERE username ='" + username + "'";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        user = new User();
        resultSet.next();
        user.setId(resultSet.getInt(1));
        user.setUsername(resultSet.getString(2));
        user.setRole(ROLES.valueOf(resultSet.getString(3)));
        user.setPassword(resultSet.getString(4));
        closeConnection();
        return user;
    }


    public void deletePlayerById(int id) throws SQLException {
        getConnection();
        String sql = "DELETE FROM players WHERE id = ?";
        PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        preparedStatement.close();
        closeConnection();
    }

    public void closeConnection() {
        try {
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
