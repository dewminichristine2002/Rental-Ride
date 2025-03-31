package com.xadmin.Customerbookings.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CVehicleBookingDao {
    // JDBC URL, username, and password
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/rentalride?useSSL=true&requireSSL=true";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Dew@suki12";

    // Load the MySQL JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load MySQL JDBC driver");
        }
    }

    // Method to book a vehicle
    public boolean bookVehicle(String vehicleName, String rentalDuration, String customerName) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            String sql = "INSERT INTO bookings (vehicle_name, rental_duration, cus_name) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, vehicleName);
            preparedStatement.setString(2, rentalDuration);
            preparedStatement.setString(3, customerName);
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
