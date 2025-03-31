package com.xadmin.vehiclelist.web;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.xadmin.vehiclelist.been.Vehicle;
import com.xadmin.vehiclelist.dao.VehicleDao;

@WebServlet("/vehicle")
public class VehicleServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehicleDao vehicleDao;

    public void init() {
        vehicleDao = new VehicleDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            listVehicle(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    private void listVehicle(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Vehicle> listVehicle = vehicleDao.getAllVehicles();
        request.setAttribute("listVehicle", listVehicle);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }
}


