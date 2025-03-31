package cusinq;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class inqinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String msg = request.getParameter("message");
		
		boolean isTrue;
		
		isTrue = inquirydbutil.insertinq(name, email, msg);
		
		if(isTrue == true) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("inquiry.jsp");
			dispatcher.forward(request,response);
			
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
