<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
     <%@ page import="User.UserClass" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RentalRide</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: white;
               background-image:url(images/profilebg.jpeg);
            background-repeat:no-repeat;
            background-size: cover;
            
        }

        .user-details {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin:60px 700px 20px 200px;
          
        }

        .user-details h2 {
            margin-top: 0;
            color: #333;
            font-size: 24px;
        }

        .user-details p {
            margin: 0;
            color: #666;
            font-size: 16px;
            line-height: 1.6;
            margin-top: 10px;
        }

        .update-button {
            display: inline-block;
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin:0 60px 0 0;
        }

        .update-button:hover {
            background-color: grey;
        }
        .bt{
         display:flex;
         align-content: center;
          margin:30px 700px 20px 200px;
         }
         .delete-button{
         display: inline-block;
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            float:right
         }
          .delete-button:hover{
           background-color: grey;
          }
                  
        
    </style>
</head>
 <jsp:include page="nav.jsp" />
<body>

<%-- Retrieve User Details from Session --%>
<% UserClass user = (UserClass) session.getAttribute("UserDetails"); %>
<% if (user != null) { %>
    <div class="user-details">
        <h2><%= user.getUsername() %></h2>
        <p><strong>User Type:</strong> <%= user.getUsertype() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Phone:</strong> <%= user.getPhone() %></p>
    </div>

	  <c:url value="UserUpdate.jsp" var="Userupdate">
            <c:param name="username" value="<%= user.getUsername() %>" />
            <c:param name="email" value="<%= user.getEmail() %>" />
            <c:param name="phone" value="<%= user.getPhone() %>" />
        </c:url>
	
		
	<div class="bt">
	<a href="${Userupdate}">
	<input type="button" name="update" class="update-button" value="Update Data">
	</a>
	
	<c:url value="UserDelete.jsp" var="UserDelete">
            <c:param name="us" value="<%= user.getUsername() %>" />
            <c:param name="ut" value="<%= user.getUsertype() %>" />
            <c:param name="email" value="<%= user.getEmail() %>" />
            <c:param name="phone" value="<%= user.getPhone() %>" />
        </c:url>
        
	<a href="${UserDelete}">
	<input type="button" name="delete" class="delete-button" value="Delete My Account">
	</a>
	</div>
	
	<% } else { %>
    <p>No user details found. Please <a href="UserLogin.jsp">login</a> again.</p>
<% } %>


</body>
</html>