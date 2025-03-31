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
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
           background-image:url(images/loginbg.jpeg);
            background-repeat:no-repeat;
            background-size: cover;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            margin: 60px 100px 0 700px;        
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            
        }

        h1 {
            text-align: center;
            color: #333;
        }

        h4 {
            color: #666;
            margin-bottom: 20px;
        }

        .inputbox {
            margin-bottom: 15px;
        }

        .inputbox input {
            width: 100%;
            padding: 7px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .inputbox input:focus {
            outline: none;
            border-color: #007bff;
        }


        .btn {
            background-color: Black;
            color: White;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: Gray;
        }
        
    
    </style>
</head>
 <jsp:include page="nav.jsp" />
<body>
 
		<form action ="UserLoginServlet" method="post">

			<h1>HELLO!</h1>

			<h4>Log-in to RentalRide    <a href="UserRegistration.jsp">   Create a New Account</a></h4>

			<div class="inputbox">
					<input type="text" id="userName" name="userName" placeholder="Username" required>
			</div>
			<div class="inputbox">
					<input type="password" id="passWord"  name="passWord" placeholder="Password" required>
			
			</div>
			
			
			
				<button name="submit" type="submit" class="btn">Login</button>

		</form>

</body>
</html>