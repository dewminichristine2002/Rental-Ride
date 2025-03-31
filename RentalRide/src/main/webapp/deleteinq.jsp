<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Inquiry</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
  
    align-items: center;
    height: 100vh;
}

h3 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

.container {
      margin: 6px 450px 450px;       
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"] {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

input[type="submit"] {
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: black;
    color: white;
    font-weight: bold;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: grey;
}


</style>
</head>


<jsp:include page="nav.jsp" />

<body>

	<h3>Delete Inquiry</h3>

<%

String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");
String msg = request.getParameter("msg");

%>
<div class="container">
<form action="deleteinqservlet" method="Get" >	<br>
	
	ID <input type="text" name="id" value="<%= id%>"readonly>	<br>
	Name<input type="text" name="name" value="<%= name%>"readonly>	<br>
	Email <input type="text" name="email" value="<%= email%>"readonly>	<br>
	Message<input type="text" name="msg" value="<%= msg%>"readonly>	<br>	<br>
	
	
	<input type="submit" name="submit" value="Delete My Inquiry">	<br>
	
</div>
	
	
</form>
</body>
</html>