package User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String Uname = request.getParameter("username");
		String Passwd = request.getParameter("pwd");
		String Repass = request.getParameter("psw-repeat");		
		String UType = request.getParameter("userType");
		String Email = request.getParameter("email");
		String CNumber = request.getParameter("contact");
		
		if(!Passwd.equals(Repass)){
			response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Passwords do not match. Please Check the password and re-Enter.');");
            out.println("location='UserRegistration.jsp';");
            out.println("</script>");
            out.close();
			
		}
		
		
		boolean success = true;
		success = UserDBUtil.InsertUserDetails(Uname, Passwd, UType, Email, CNumber);
		
		if(success == true) {
			RequestDispatcher dis1 = request.getRequestDispatcher("UserLogin.jsp");
			dis1.forward(request, response);
		
		}else {
			RequestDispatcher dis4 = request.getRequestDispatcher("UserRegistration.jsp");
			dis4.forward(request, response);
		}
		
		
	
	}

}
