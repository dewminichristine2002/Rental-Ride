package VehicleOwner;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class UpdateVehicleServlet
 */
public class UpdateVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String registrationNo = request.getParameter("regNo");
		String model = request.getParameter("vmodel");
		String features = request.getParameter("features");
		String pricerate = request.getParameter("priceRate");
		
		
		boolean isTrue=true;
	
		isTrue = VehicleDButil.updateVehicleInfo(registrationNo, model, features, pricerate);
		
		if(isTrue == true) {
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<script type='text/javascript'>");
	        out.println("alert('Vehicle Updated Successfully.');");
	        out.println("location='VehicleList.jsp';");
	        out.println("</script>");
	        out.close(); // Ensure to close the PrintWriter
		
		}
		else {
			
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<script type='text/javascript'>");
	        out.println("alert('An unexpected error occurred. Please try again later.');");
	        out.println("location='UpdateVehicle.jsp';");
	        out.println("</script>");
	        out.close(); // Ensure to close the PrintWriter
			
		}
	}

}
