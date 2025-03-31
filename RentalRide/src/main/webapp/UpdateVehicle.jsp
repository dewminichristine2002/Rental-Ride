<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url(Images/pngtree-four-luxury-cars-parked-near-one-another-on-the-side-of-picture-image_2478448.jpg);
        background-repeat:no-repeat;
        background-size:cover;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: white;
    }

    form {
        width: 50%;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: black;
        color: #fff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: gray;
    }
</style>
</head>
 <jsp:include page="nav.jsp" />
<body>

    <h1>Update Details</h1>
    <form action="UpdateVehicleServlet" method="post">
    	
		Vehicle Registration Number: <input type="text" name="regNo" required><br>
				
		Vehicle Model: <input type="text" name="vmodel" required ><br>
		
		
		Features: <input type="text" name="features" required><br>
		
		
		Price Rate(per day): <input type="text" name="priceRate" required ><br><br>
		
		<input type= "submit" name= "submit" value="Update Details">

    </form>
</body>
</html>