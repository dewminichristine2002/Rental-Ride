package User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("userName"); 
		String password = request.getParameter("passWord");

	try {
		
		List<UserClass> UserDetails = UserDBUtil.validate(username, password); 
		
		if (UserDetails == null || UserDetails.isEmpty()) {
			
			   // If validation fails, display an alert and redirect to login page
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Your username or password is incorrect');");
            out.println("location='UserLogin.jsp';");
            out.println("</script>");
            out.close();
            
        } else {
        	
            // If validation succeeds, set user details and forward to profile page
        	//now we are going to set what should be send to the other page
        	HttpSession session = request.getSession();
        	
        	UserClass user = UserDetails.get(0); // Assuming UserDetails contains only one UserClass object
        	
            session.setAttribute("UserDetails", user);
            
            String userType = user.getUsertype(); // Get the user type
            session.setAttribute("UserDetails", UserDetails.get(0)); // Assuming UserDetails contains only one UserClass object

            // Forward to profile page
            RequestDispatcher dis2 = request.getRequestDispatcher("HomeC.jsp");
            dis2.forward(request, response);
        }
            
        
    } catch (Exception e) {
        e.printStackTrace();


        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('An unexpected error occurred. Please try again later.');");
        out.println("location='UserLogin.jsp';");
        out.println("</script>");
        out.close(); // Ensure to close the PrintWriter

    }
	}
	}
