<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url(Images/pngtree-four-luxury-cars-parked-near-one-another-on-the-side-of-picture-image_2478448.jpg);
        background-repeat: no-repeat;
        background-size:cover;
        margin: 0;
        padding: 5px;
    }

    .container {
        width: 80%;
        margin: 20px auto;
        background-color: white;
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
        background-color: pink;
    }


    
    .button-container{
    	display: flex;
    	justify-content: spsce-between;
    	width 50%;
    	margin 0 auto;
    }
    
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
        }

        .update-button {
            background-color: black ; 
            color: white;
        }

        .delete-button {
            background-color: black; 
            color: white;
        }

        .button:hover {
            opacity: 0.8;
            color:gray;
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
       
       <c:set var= "registrationNo" value="${vehicle.registrationNo}" />
       <c:set var= "model" value= "${vehicle.model})"/>
       <c:set var= "features" value= "${vehicle.features}" />
       <c:set var= "pricerate" value= "${vehicle.pricerate}" /> 
       
       
            <tr>
            	<td>${vehicle.registrationNo}</td>
                <td>${vehicle.model}</td>
                <td>${vehicle.features}</td>
                <td>${vehicle.pricerate}</td>
                <td>${vehicle.owner}</td>
            </tr>
        </c:forEach>  

        </table>
        
      <c:url value= "UpdateVehicle.jsp" var= "vehicleUpdate">
        	<c:param name= "registrationNo" value= "${registrationNo}"/>
        	<c:param name= "model" value= "${model}" />
        	<c:param name= "features" value= "${features}" />
        	<c:param name= "pricerate" value= "${pricerate}" />
        </c:url> 
        
        <br><br>
        <div class = "button-container">
     <a href = "UpdateVehicle.jsp">
    <input type= "button" class= "button update-button" name= "View" value= "Update Vehicle Details">
        </a>
        <a href = "VehicleUpload.jsp">
        <input type = "button" class = "button update-button" name="Upload" value= "Upload a Vehicle">
        </a>
        <a href = "DeleteVehicle.jsp">
        <input type="button" class="button delete-button" name="delete" value="Delete Details">
        </a>
    </div>
</body>
</html>
    