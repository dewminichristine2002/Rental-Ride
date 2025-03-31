<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
        	margin: 60px 700px 0 100px; 
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            
        }
        form input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #000;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color: #555;
        }
        form br {
            display: none;
        }
        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
    </style>
</head>

<jsp:include page="nav.jsp" />

<body>


<%

String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");
String msg = request.getParameter("msg");

%>



	<form action="updateinqServlet" method="Post" >	<br>
	
	ID :<input type="text" name="id" value="<%= id%>"readonly>	<br>
	Name :<input type="text" name="name" value="<%= name%>">	<br>
	Email :<input type="text" name="email" value="<%= email%>">	<br>
	Message :<input type="text" name="msg" value="<%= msg%>">	<br>	<br>
	
	<input type="submit" name="submit" value="Update My Data">	<br>
	
	</form>

</body>
</html>