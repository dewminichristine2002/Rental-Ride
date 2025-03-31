<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Vehicle Bookings</title>
    
      <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
           
            align-items: center;
            height: 100vh;
        }
        .container {
              margin:60px 50px 20px 50px;
            width: 100%;
            max-width: 800px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .text-center {
            text-align: center;
        }
        .mb-4 {
            margin-bottom: 1.5rem;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #dddddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        #book {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            margin:60px 50px 20px 50px;
        }
        #book:hover {
            background-color: #0056b3;
        }
    </style>
    
   
</head>
    <jsp:include page="nav.jsp" />
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">List of Vehicle Bookings</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-header">
        <tr>
            <th>Name</th>
            <th>Availability</th>
            <th>Duration</th>
        </tr>
        </thead>
        <tbody>
        <!-- Iterate over the list of vehicles and display their details -->
        <c:forEach var="vehicle" items="${listVehicle}" varStatus="loop">
            <tr class="table-row">
                <td>${vehicle.name}</td>
                <td>${vehicle.availability}</td>
                <td>${vehicle.duration}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

                    <a href="form.jsp" id="book">Book Vehicle</a>
</body>
</html>
