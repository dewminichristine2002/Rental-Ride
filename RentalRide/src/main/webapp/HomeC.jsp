<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>RentalRide</title>
<head>
        <style>
            body{
           padding: 0%;

            }
            .contentH{
      		background-image:url(images/bghome.jpeg);
            background-repeat:no-repeat;
            background-size: cover;
            width: 100%;
            height: 620px;
            margin: 0%;
            display: inline-block;

            }
         
            .intro {
            
            text-align: center;
            margin: 100px 700px 200px 30px;
            width: 500px;
            height: auto;
            font-family: Arial, sans-serif; /* Use Arial font */
           }

            h1 {
            text-align: left;
            font-size: 50px;
            color: white;
            margin-bottom: 0;
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif ;
            }

            .slogan {
            text-align: left;   
            font-size: 20px;
            color: whitesmoke;
            margin:3px auto 45px auto;
            }

            .des {
            text-align: left;
            font-size: 18px;
            line-height: 1.6;
            color: rgb(253, 249, 249);
            font-weight: 200;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            
            margin-bottom: 20px;
            }
           
            
            #login{
                margin: 0 60px 0  5px;
                font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
                padding: 5px 10px;
                background-color: rgb(10, 10, 10);
                color: white;
                clear: none;
                text-decoration: none;
                font-weight: bolder;
                        
            }
            #login:hover {
            background-color: rgb(90, 88, 88);
            color: black;
            }

     
   

        </style>
       
            
    </head>
    <body>
    <header>
    <jsp:include page="nav.jsp" />
    </header>
        
            <div class="contentH">
           
                <div class="intro">
                    <h1>RentalRide</h1>
                    <p class ="slogan">"Travel with ease, Rent with us."</p>
                    <p class ="des">Welcome to RentalRide, your ultimate destination for <br>seamless vehicle rental experiences.<br> Whether you're a vehicle owner looking to showcase your wheels or a savvy traveler in search of the perfect ride, RentalRide has you covered.</p>
                   
                    <a href="UserLogin.jsp" id="login">Sign In/Sign Up</a>
                      
                </div>
                <div>

                </div>
            </div>  

        <footer>

        </footer>

    </body>
 </html>
