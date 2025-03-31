<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Vehicle Booking Management Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }

        .text-center {
            text-align: center;
        }

        .text-left {
            text-align: left;
        }

        h3 {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            margin: 10px 0;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .edit-btn {
            margin-right: 10px;
        }

        hr {
            border: 0;
            height: 1px;
            background: #ddd;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
  <jsp:include page="nav.jsp" />
<body>


<br>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Vehicles</h3>
        <hr>
        <div class="container text-left">

            <a href="new" class="btn btn-success">Add New Vehicle</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Availability</th>
                <th>Duration</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="vehicle" items="${listVehicle}">

                <tr>
                    <td><c:out value="${vehicle.id}" /></td>
                    <td><c:out value="${vehicle.name}" /></td>
                    <td><c:out value="${vehicle.availability}" /></td>
                    <td><c:out value="${vehicle.duration}" /></td>
                    <td><a href="edit?id=${vehicle.id}"class="btn btn-primary edit-btn">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=${vehicle.id}" class="btn btn-danger delete-btn">Delete</a></td>
                </tr>
            </c:forEach>

            </tbody>

        </table>
    </div>
</div>
</body>
</html>
