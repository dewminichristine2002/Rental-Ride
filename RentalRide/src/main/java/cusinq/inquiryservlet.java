package cusinq;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class inquiryservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String dew = request.getParameter("name");
  
        try {
            List<inqdetails> inqdet = inquirydbutil.validate(dew);
            if (inqdet == null || inqdet.isEmpty()) {
                // If validation fails, display an alert and redirect to inquiry view page
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('Invalid Inquiry');");
                out.println("location='inquiry.jsp';");
                out.println("</script>");
                out.close();
            } else {
                // If validation succeeds, set details and forward to profile page
                request.setAttribute("inqdet", inqdet);
                RequestDispatcher dis2 = request.getRequestDispatcher("indet.jsp");
                dis2.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();

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
