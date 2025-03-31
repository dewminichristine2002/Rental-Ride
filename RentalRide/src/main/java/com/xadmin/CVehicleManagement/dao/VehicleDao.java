package com.xadmin.CVehicleManagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xadmin.CVehicleManagement.been.Vehicle;

public class VehicleDao {
    // JDBC URL without username and password
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/rentalride?useSSL=true&requireSSL=true";

    // Database username and password
    private static final String username = "root";
    private static final String password = "Dew@suki12";

    // JDBC Driver
    private static final String jdbcDriver = "com.mysql.cj.jdbc.Driver";

    // Singleton instance
    private static VehicleDao instance;

    // Private constructor to prevent instantiation from outside
    public VehicleDao() {
        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading JDBC driver", e);
        }
    }

    // Method to get the Singleton instance
    public static VehicleDao getInstance() {
        if (instance == null) {
            synchronized (VehicleDao.class) {
                if (instance == null) {
                    instance = new VehicleDao();
                }
            }
        }
        return instance;
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, username, password);
    }

    public void insert(Vehicle vehicle) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VEHICLE_SQL)) {
            preparedStatement.setString(1, vehicle.getName());
            preparedStatement.setString(2, vehicle.getAvailability());
            preparedStatement.setString(3, vehicle.getDuration());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            handleSQLException(e);
        }
    }

    public Vehicle selectVehicle(int id) {
        Vehicle vehicle = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VEHICLE_BY_ID_SQL)) {
            preparedStatement.setInt(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    String name = rs.getString("name");
                    String availability = rs.getString("availability");
                    String duration = rs.getString("duration");
                    vehicle = new Vehicle(id, name, availability, duration);
                }
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return vehicle;
    }

    public List<Vehicle> selectAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_VEHICLES_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String availability = rs.getString("availability");
                String duration = rs.getString("duration");
                vehicles.add(new Vehicle(id, name, availability, duration));
            }
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return vehicles;
    }

    public boolean updateVehicle(Vehicle vehicle) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_VEHICLE_SQL)) {
            statement.setString(1, vehicle.getName());
            statement.setString(2, vehicle.getAvailability());
            statement.setString(3, vehicle.getDuration());
            statement.setInt(4, vehicle.getId());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return rowUpdated;
    }

    public boolean deleteVehicle(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_VEHICLE_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            handleSQLException(e);
        }
        return rowDeleted;
    }

    private void handleSQLException(SQLException ex) {
        // Log the exception instead of printing directly to the console
        // Use a logging framework like Log4j or SLF4J
        ex.printStackTrace();
    }

    // SQL Queries
    private static final String INSERT_VEHICLE_SQL = "INSERT INTO vehicles (name, availability, duration) VALUES (?, ?, ?)";
    private static final String SELECT_VEHICLE_BY_ID_SQL = "SELECT id, name, availability, duration FROM vehicles WHERE id = ?";
    private static final String SELECT_ALL_VEHICLES_SQL = "SELECT id, name, availability, duration FROM vehicles";
    private static final String DELETE_VEHICLE_SQL = "DELETE FROM vehicles WHERE id = ?";
    private static final String UPDATE_VEHICLE_SQL = "UPDATE vehicles SET name = ?, availability = ?, duration = ? WHERE id = ?";
}

