<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="User.UserClass" %>

<%
    UserClass user = (UserClass) session.getAttribute("UserDetails");
    String userType = "";
    if (user != null) {
        userType = user.getUsertype();
    }

    String vehiclesPage = "CustomerVehicleList.jsp";
    String bookingsPage = "list.jsp";

    if ("admin".equals(userType)) {
        vehiclesPage = "VehicleList.jsp";
        bookingsPage = "CVehiclelist.jsp";
    } else if ("customer".equals(userType)) {
        vehiclesPage = "CustomerVehicleList.jsp";
        bookingsPage = "list.jsp";
    } else if ("vehicleOwner".equals(userType)) {
        vehiclesPage = "VehicleList.jsp";
        bookingsPage = "list.jsp";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.navbar{
            display: inline-flex;
            align-items: center;
            }
            nav {
            display: flex;
            align-items: center;
            justify-content: right;
            padding: 0;
            background-color: white;
            width: 100%;
            height: 78px;
            margin:0px;
            }
            
            a.alltabs{
            width: auto;
            display: flex;
            padding: 28px 35px;
            height: 85px;
            max-height: 100px;
            box-sizing: border-box;
            clear: none;
            color: black;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            letter-spacing: 0.5px; 
            text-align: center;
            vertical-align: middle;
            font-size: 100%;
            font-weight: bolder;   
            }
            a.alltabs:hover {
            
                color: rgb(172, 5, 39);
            }
            a.alltabs:active {
         
            color:gray;
            }

            a.alltabs:link {
            text-decoration: none;
            }
            #profileicon {
            width: 30px;
            height: 35px;
            padding-left: 20px;
            padding-right: 20px;
           }
           #logodiv {
            clear:none;
            padding: auto;
            width: auto;
            margin: 0 500px 0 0;
           
            }
            #logo {
            width: auto;
            height: 75px;
            }
            
</style>

</head>
<body>
<header>
            <nav>
                <div class="navbar" id="logodiv">
                    <a href=""><img id="logo" src="" alt="RentalRide"></a>
    
                </div>
                <div class="navbar"  >
                    <a href="HomeC.jsp" class="alltabs" >Home</a>
                    
                    <a href="<%= vehiclesPage %>" class="alltabs">Our Vehicles</a>
                  	<a href="<%= bookingsPage %>" class="alltabs">Bookings</a>
                   
                    <a href="inquiry.jsp" class="alltabs">Contact Us</a>
            
                </div>
                <div class="navbar">
                    <a href="Profile.jsp"><img id="profileicon" src="images/profile.jpeg" alt="User Profile"></a>
                </div>
    
            </nav>

        </header>

</body>
</html>