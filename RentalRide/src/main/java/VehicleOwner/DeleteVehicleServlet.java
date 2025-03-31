package VehicleOwner;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class DeleteVehicleServlet
 */
public class DeleteVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String registrationNo = request.getParameter("regNo");
		
		boolean isTrue = true;
		
		isTrue = VehicleDButil.deleteVehicle(registrationNo);
		
		if(isTrue=true) {
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<script type='text/javascript'>");
	        out.println("alert('Vehicle deleted successfully.');");
	        out.println("location='VehicleList.jsp';");
	        out.println("</script>");
	        out.close();
		}
		else {
		
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<script type='text/javascript'>");
	        out.println("alert('An unexpected error occurred. Please try again later.');");
	        out.println("location='DeleteVehicle.jsp';");
	        out.println("</script>");
	        out.close(); // Ensure to close the PrintWriter
		}
	}

}
