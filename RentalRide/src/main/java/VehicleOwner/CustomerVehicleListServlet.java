package VehicleOwner;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class CustomerVehicleList
 */
public class CustomerVehicleListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the list of vehicles from the database
    	
    	try {
        ArrayList<Vehicle> vehicleList = VehicleDButil.displayVehicleDetails();
        
        
        // Set the list of vehicles as a request attribute
        request.setAttribute("vehicleList", vehicleList);
        
    	}catch (Exception e) {
    		
    		e.printStackTrace();
    	}
        // Forward the request to the JSP page to display the list of vehicles
        RequestDispatcher dis = request.getRequestDispatcher("CustomerVehicleList.jsp");
        
        dis.forward(request, response);
    	}
    
}
