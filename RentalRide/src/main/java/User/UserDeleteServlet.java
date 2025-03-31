package User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		
        boolean deleted = true;
		
		deleted = UserDBUtil.deleteUser(uname);
		
		if(deleted == true) {
			
			
			RequestDispatcher dis1 = request.getRequestDispatcher("HomeC.jsp");
						
			dis1.forward(request, response);
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("UserDelete.jsp");
			
			dis2.forward(request, response);
			
		}
		
	
	}

}
