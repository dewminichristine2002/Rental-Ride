package User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Uname = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("contact");
		
		boolean updated = true;
		
		updated = UserDBUtil.updateUser(Uname, email, phone);
		
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
		
		if(updated == true) {
						
			  out.println("<script type='text/javascript'>");
	            out.println("alert('User details updated successfully.Please login to view the updated Profile.');");
	            out.println("location='UserLogin.jsp';");
	            out.println("</script>");
			
		}
		else {

	        
	        out.println("<script type='text/javascript'>");
	        out.println("alert('An unexpected error occurred while Updating. Please try again.');");
	        out.println("location='UserUpdate.jsp';");
	        out.println("</script>");
	    
			
		}
		
	    out.close();
		
	}

}
