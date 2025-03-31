package com.xadmin.Customerbookings.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.xadmin.Customerbookings.dao.CVehicleBookingDao;

@WebServlet("/bookings")
public class BookVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CVehicleBookingDao vehicleBookingDao;

    public void init() {
        vehicleBookingDao = new CVehicleBookingDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vehicleName = request.getParameter("vehicleName");
        String rentalDuration = request.getParameter("rentalDuration");
        String customerName = request.getParameter("customerName");

        boolean bookingResult = vehicleBookingDao.bookVehicle(vehicleName, rentalDuration, customerName);
        if (bookingResult) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("cerror.jsp");
        }
    }
}
