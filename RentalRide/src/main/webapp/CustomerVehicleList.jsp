<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Vehicle List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 5px;
    }

    .container {
        width: 80%;
        margin: 20px auto;
        background-color: skyblue;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #333;
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th, td {
        border: 4px solid gray;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        text-align: center;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    
    buttoncontainer{
    	align: center;
    }
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .update-button {
            background-color: blue ; 
            color: white;
        }

        .delete-button {
            background-color: red; 
            color: white;
        }

        .button:hover {
            opacity: 0.8;
            color:green;
        }

        .button-gap {
            margin-right: 875px; 
        }
</style>
</head>
 <jsp:include page="nav.jsp" />
<body>
    <div class="container">
        <h2>Vehicle Information</h2>
        <table>

            <tr>
            	<th>Vehicle Registration Number</th>
                <th>Vehicle Model</th>
                <th>Vehicle Features</th>
                <th>Vehicle Price Rate</th>
                <th>Vehicle Owner</th>
            </tr>
       <c:forEach var="vehicle" items="${vehicleList}" varStatus="loop">
            <tr>
            	<td>${vehicle.registrationNo}</td>
                <td>${vehicle.model}</td>
                <td>${vehicle.features}</td>
                <td>${vehicle.pricerate}</td>
                <td>${vehicle.owner}</td>
            </tr>
        </c:forEach>  

        </table>
        <br><br>
       <!--   <buttoncontainer>
        <input type="button" class="button update-button" name="update" value="Update Vehicle Details">
    	<span class="button-gap"></span>
        <input type="button" class="button delete-button" name="delete" value="Delete Details">
        </buttoncontainer>  -->
    </div>
</body>
</html>