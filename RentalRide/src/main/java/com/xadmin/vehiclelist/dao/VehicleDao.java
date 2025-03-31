package com.xadmin.vehiclelist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xadmin.vehiclelist.been.Vehicle;

public class VehicleDao {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/rentalride?useSSL=true&requireSSL=true";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Dew@suki12";
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try {
            Class.forName(JDBC_DRIVER);
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
                 PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM vehicles");
                 ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Vehicle vehicle = new Vehicle();
                    vehicle.setId(rs.getInt("id"));
                    vehicle.setName(rs.getString("name"));
                    vehicle.setAvailability(rs.getString("availability"));
                    vehicle.setDuration(rs.getString("duration"));
                    vehicles.add(vehicle);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }
}
