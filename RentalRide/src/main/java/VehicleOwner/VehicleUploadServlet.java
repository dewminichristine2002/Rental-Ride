package VehicleOwner;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//import java.util.ArrayList;
import java.util.ArrayList;

public class VehicleUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String registrationNo = request.getParameter("regNo");
		String model = request.getParameter("vmodel");
		String features = request.getParameter("features");
		String pricerate = request.getParameter("priceRate");
		String owner = request.getParameter("oName");
		
		boolean isTrue = true;
		
		isTrue = VehicleDButil.insertVehicle(registrationNo, model, features, pricerate, owner);
		
		if(isTrue == true) {
			
			try {
		        ArrayList<Vehicle> vehicleList = VehicleDButil.displayVehicleDetails();
		        
		        
		        // Set the list of vehicles as a request attribute
		        request.setAttribute("vehicleList", vehicleList);
		        
		    	}catch (Exception e) {
		    		
		    		e.printStackTrace();
		    	}
		        // Forward the request to the JSP page to display the list of vehicles
		        RequestDispatcher dis = request.getRequestDispatcher("VehicleList.jsp");
		        
		        dis.forward(request, response);
		    	
				
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("VehicleUpload.jsp");
			dis2.forward(request, response);	
		}

		

	}
	
	
	}



