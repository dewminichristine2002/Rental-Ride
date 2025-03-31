package cusinq;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class deleteinqservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
		boolean isTrue = true;
		
		isTrue = inquirydbutil.deletinq(name);
		
		if (isTrue == true) {
			   response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            out.println("<script type='text/javascript'>");
	            out.println("alert('Inquiry Deleted Successfully.');");
	            out.println("location='inquiry.jsp';");
	            out.println("</script>");
	            out.close();
		}
		else {
			
			   response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            out.println("<script type='text/javascript'>");
	            out.println("alert('An unexpected error occurred. Please try again later.');");
	            out.println("location='inquiry.jsp';");
	            out.println("</script>");
	            out.close();
		}
		
	}

}
