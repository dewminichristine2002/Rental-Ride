package cusinq;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class updateinqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String msg = request.getParameter("msg");
		
		boolean updated=true;
		
		updated = inquirydbutil.updatinq(id, name, email, msg);
		
		if(updated == true) {
			 response.setContentType("text/html");
             PrintWriter out = response.getWriter();
             out.println("<script type='text/javascript'>");
             out.println("alert('Your Inquiry has been updated successfully. Enter your name to view Inquiry.');");
             out.println("location='inquiry.jsp';");
             out.println("</script>");
             out.close();
		}else {
			 response.setContentType("text/html");
             PrintWriter out = response.getWriter();
             out.println("<script type='text/javascript'>");
             out.println("alert('Unexpected error occured please try again');");
             out.println("location='inquiry.jsp';");
             out.println("</script>");
             out.close();
			
		}
		
	}

}
