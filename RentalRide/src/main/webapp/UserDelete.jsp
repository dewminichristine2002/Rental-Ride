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
           background-image:url(images/deletebg.jpeg);
            background-repeat:no-repeat;
            background-size: cover;
            align-items: center;
            height: 100vh;
        }
        form {
             margin: 60px 100px 0 800px; 
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
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
        }
        input[type="text"][readonly],
        input[type="email"][readonly],
        input[type="tel"][readonly] {
            background-color: #e9ecef;
            color: #495057;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: black;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: grey;
        }
        </style>
</head>
 <jsp:include page="nav.jsp" />
<body>
<%
    // Retrieve parameters from the request
    String Uname = request.getParameter("us");
    String utype = request.getParameter("ut");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
%>
<form action="UserDeleteServlet" method="post">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<%= Uname %>" readonly>
    </div>
    <div class="form-group">
        <label for="utype">User Type:</label>
        <input type="text" id="utype" name="utype" value="<%= utype %>" readonly>
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" readonly>
    </div>
    <div class="form-group">
        <label for="contact">Contact Number:</label>
        <input type="tel" id="contact" name="contact" value="<%= phone %>" readonly>
    </div>
    <input type="submit" name="submit" value="Delete Account">
</form>
</body>


</html>