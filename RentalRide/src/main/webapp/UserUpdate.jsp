<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RentalRide</title>

      <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            background-image:url(images/updatebg.jpeg);
            background-repeat:no-repeat;
            background-size: cover;
          
            height: 100vh;
        }
        form {
         margin: 60px 700px 0 100px;        
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333333;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="text"][readonly] {
            background-color: #e9ecef;
            color: #495057;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #000000;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #333333;
        }
    </style>
</head>
 <jsp:include page="nav.jsp" />
<body>
<%
        String Uname = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
    %>
<form action="UserUpdateServlet" method="post">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%= Uname %>" readonly>
    </div>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
    </div>

    <div class="form-group">
        <label for="contact">Contact Number:</label>
        <input type="tel" id="contact" name="contact" value="<%= phone %>" pattern="[0-9]{10}" required>
    </div>
    
    <input type="submit" name="submit" value="Update Data">
</form>
</body>
</html>