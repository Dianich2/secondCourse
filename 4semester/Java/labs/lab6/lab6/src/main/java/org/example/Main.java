package org.example;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {

    public static void main(String[] args) {
        try {
            DAO db = new DAO();
            db.getConnection();

            System.out.println("Query # 1");
            /* Вывести информацию обо всех планетах, на которых присутствует жизнь, и их спутниках.*/
            ResultSet resultSet = db.ExecuteQuery("""
                    SELECT planets.Name,  planets.Radius, moons.Name as moon, moons.Radius, moons.Distance
                    FROM planets
                    JOIN planets_moons on planets.Name = planets_moons.planet
                    JOIN moons on moons.Name = planets_moons.moon
                    where LifePresence = 1
                    """);

            while (resultSet.next()){
                System.out.print(resultSet.getString(1) + "\t|\t");
                System.out.print(resultSet.getString(2) + "\t|\t");
                System.out.print(resultSet.getString(3) + "\t|\t");
                System.out.print(resultSet.getString(4) + "\t|\t");
                System.out.print(resultSet.getString(5) + "\t|\t");
                System.out.println();
            }

            System.out.println("\nQuery # 2");
            /*Вывести информацию о планетах и их спутниках, имеющих наименьший радиус и
            наибольшее количество спутников. */
            resultSet = db.ExecuteQuery("""
                    SELECT planets.Name,  planets.Radius, moons.Name as moon, moons.Radius, moons.Distance
                    FROM planets
                    JOIN planets_moons on planets.Name = planets_moons.planet
                    JOIN moons on moons.Name = planets_moons.moon
                    where moons.Radius = (SELECT min(Radius) FROM moons)
                    """);
            while (resultSet.next()){
                System.out.print(resultSet.getString(1) + "\t|\t");
                System.out.print(resultSet.getString(2) + "\t|\t");
                System.out.print(resultSet.getString(3) + "\t|\t");
                System.out.print(resultSet.getString(4) + "\t|\t");
                System.out.print(resultSet.getString(5) + "\t|\t");
                System.out.println();
            }

            System.out.println("\nPrepared statement");
            resultSet = db.ExecutePreparedStatement(2);
            while(resultSet.next()) {
                System.out.print(resultSet.getString(1) + "\t|\t");
                System.out.print(resultSet.getString(2) + "\t| ");
                System.out.println();
            }
            System.out.println("\nТранзакция");
            db.ExecuteTransaction();
            db.closeConnection();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}