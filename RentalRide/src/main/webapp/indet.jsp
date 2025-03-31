<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Your Inquiry</title>


<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('background.jpg'); /* Add your background image here */
        background-size: cover;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container1 {
        background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        width: 100%;
    }
    h3 {
        margin: 10px 0 5px;
        color: #333;
        display: inline; /* Display each header on the same line */
    }
    .detail {
        margin-bottom: 20px;
    }
    .button-container {
        display: flex;
        justify-content: space-between;
    }
    .button {
        display: inline-block;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        background-color: #000;
        color: #fff;
        font-size: 16px;
        text-decoration: none;
        text-align: center;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .button:hover {
        background-color: #555;
    }
    a {
        text-decoration: none;
    }
</style>
</head>

<jsp:include page="nav.jsp" />
<body>
<c:forEach var="inqde" items="${inqdet}">

	<div class="container1">
	
	<c:set var="id" value="${inqde.id}"/>
	<c:set var="name" value="${inqde.name}"/>
	<c:set var="email" value="${inqde.email}"/>
	<c:set var="msg" value="${inqde.msg}"/>
	
	
	
	<br>
	
	<h3>Inquiry ID :</h3>		${inqde.id} <br> <br>
	
	<h3>Inquiry Name :</h3>		${inqde.name} <br> <br>
	
	<h3>Inquiry email :</h3>	${inqde.email} <br> <br>
	
	<h3>Inquiry Massage :</h3>	${inqde.msg} <br> <br>
	<br>
	<br>
	<br>
	
	
	<c:url value="updateinq.jsp" var="inqupdate">
		<c:param name="id" value="${id}"/>
		<c:param name="name" value="${name}"/>
		<c:param name="email" value="${email}"/>
		<c:param name="msg" value="${msg}"/>
	</c:url>
	
	
	<a href = "${inqupdate}">
	<input type="button"  name="update" value="Update My Data" class="button">
	</a>
	
	<c:url value="deleteinq.jsp" var="deletinq">
	
	<c:param name="id" value="${id}"></c:param>
	<c:param name="name" value="${name}"></c:param>
	<c:param name="email" value="${email}"></c:param>
	<c:param name="msg" value="${msg}"></c:param>
	
	</c:url>
	
	
	
	
	<a href = "${deletinq}">
	<input type="button" name="delete" value="Delete My Data" class="button">
	</a>
	
	
	</div>
	
</c:forEach>

</body>
</html>