<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RentalRide</title>

   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
               background-image:url(images/registerbg.jpeg);
            background-repeat:no-repeat;
            background-size: cover;
        }

        .container {
            max-width: 400px;
            margin: 30px 100px 20px 700px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
         input[type="tel"],
        
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: black;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: grey;
        }
    </style>
</head>
 <jsp:include page="nav.jsp" />
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form action="UserRegistrationServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
             
             <label for="pwd">Password:</label>
             <input type="password" id="pwd" name="pwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
              title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
			
			<label for="psw-repeat">Confirm Password : </label><br>
         <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
			
			
            <label for="userType">User Type:</label>
            <select id="userType" name="userType">
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
                <option value="vehicleOwner">Vehicle Owner</option>
            </select>
            
            <label for="email">Email:</label>
  			<input type="email" id="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required>
           
         
            <label for="contact">Contact Number : </label><br>
        	<input type="tel" name="contact" id="contact" pattern="[0-9]{10}" required>

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
