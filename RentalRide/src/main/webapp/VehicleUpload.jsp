<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Vehicle</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    background : url(Images/pngtree-four-luxury-cars-parked-near-one-another-on-the-side-of-picture-image_2478448.jpg);
    background-repeat:no-repeat;
    background-size: cover;
}

h1 {
    color: white;
}

form {
    width: 50%;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

input[type="text"],
input[type="file"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="submit"] {
    width: 100%;
    background-color: black;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
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
<h1 align="center"> Vehicle Details</h1>
<div>
	<form action="VehicleUploadServlet" method="post"> 
		
		Vehicle Registration Number: <input type="text" name="regNo" required="required="><br>
				
		Vehicle Model: <input type="text" name="vmodel" required= "required="><br>
		
		
		Features: <input type="text" name="features" required= "required="><br>
		
		
		Price Rate(per day): <input type="text" name="priceRate" required= "required=" ><br>
		
		
		Name of the Owner: <input type="text" name="oName" required= "required="><br>
		
			
		
	<input type="submit" name="submit" value="Upload Details">
	</form>
</div>	


 <script>
        function validateForm() {
            // Get the value of the registration number field
            var regNo = document.getElementById("regNo").value;

            // Regular expression to validate the registration number (example: ABC1234)
            var regExp = /^[A-Za-z]{4} [0-9]{3}$/;

            // Check if the registration number matches the regular expression
            if (!regExp.test(regNo)) {
                alert("Please enter a valid vehicle registration number");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</body>
</html>