<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Vehicle Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url(Images/pngtree-four-luxury-cars-parked-near-one-another-on-the-side-of-picture-image_2478448.jpg);
        background-size:cover;
        margin: 0;
        padding: 0;
    }

    h1 {
        color: white;
        text-align: center;
    }

    form {
        width: 50%;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid black;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        background-color: black;
        color: white;
        padding: 14px 20px;
        margin-top: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: gray;
    }
</style>
</head>
 <jsp:include page="nav.jsp" />
<body>
<h1>Delete Vehicle</h1>
    <form action="DeleteVehicleServlet" method="post">
        <label for="regNo">Enter Vehicle Registration Number:</label>
        <input type="text" id="regNo" name="regNo" required>
        <input type="submit" value="Delete">
    </form>

</body>
</html>