package com.xadmin.CVehicleManagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.xadmin.CVehicleManagement.been.Vehicle;
import com.xadmin.CVehicleManagement.dao.VehicleDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VehicleServlet2")
public class VehicleServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehicleDao vehicleDao;

    public void init() {
        vehicleDao = new VehicleDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertVehicle(request, response);
                    break;
                case "/delete":
                    deleteVehicle(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateVehicle(request, response);
                    break;
                default:
                    listVehicle(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listVehicle(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Vehicle> listVehicle = vehicleDao.selectAllVehicles();
        request.setAttribute("listVehicle", listVehicle);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CVehiclelist.jsp"); // Corrected path
        dispatcher.forward(request, response);
    }
   
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vehicle-form.jsp"); // Corrected path
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Vehicle existingVehicle = vehicleDao.selectVehicle(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vehicle-form.jsp"); // Corrected path
        request.setAttribute("vehicle", existingVehicle);
        dispatcher.forward(request, response);
    }

    private void insertVehicle(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        String name = request.getParameter("name");
        String availability = request.getParameter("availability");
        String duration = request.getParameter("duration");
        Vehicle newVehicle = new Vehicle(0, name, availability, duration); // Set id to 0 for new vehicle
        vehicleDao.insert(newVehicle);
        response.sendRedirect("list");
    }

    private void updateVehicle(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String availability = request.getParameter("availability");
        String duration = request.getParameter("duration");
        Vehicle vehicle = new Vehicle(id, name, availability, duration);
        vehicleDao.updateVehicle(vehicle);
        response.sendRedirect("list");
    }

    private void deleteVehicle(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        vehicleDao.deleteVehicle(id);
        response.sendRedirect("list");
    }
}

