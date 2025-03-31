<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<title>Contact Us</title>
<style>
	   body {
	background-image: url(images/img1.jpg);
	background-size: cover;
	background-repeat:no-repeat;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    justify-content: space-around;
    margin-top: 50px;
    
	
}

.contact-form, .view-inquiry-form {
    width: 45%;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: rgba(255, 255, 255, 0.7);
    backdrop-filter: blur(5px);
 
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: bold;
}

input[type="text"],
input[type="email"],
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.btn-submit {
    width: 100%;
    padding: 10px;
    background-color: #000; /* Black color */
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-submit:hover {
    background-color: #808080; /* Gray color */
}



</style>

<jsp:include page="nav.jsp" />
<body>

	<div class="container">
    
           <form method="post" action="inqinsert" class="contact-form">
            <h2>Contact Us</h2>
            
            <div class="form-group">
             
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            
            <div class="form-group">
            
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required >
           
           </div>
           
           <div class="form-group"> 
            
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4" placeholder="Enter your message" required></textarea>
           </div>
            
            <input type="submit" value="Make an Inquiry" class="btn-submit">
            
        </form>
        
        <form method="post" action="inquiryservlet" class="view-inquiry-form">
            <h2>View Inquiry</h2>
            
            <div class="form-group">
            
                <label for="view-name">Name:</label>
                <input type="text" id="view-name" name="name" placeholder="Enter your name" required>
            </div>
            
            <input type="submit" value="View Your Inquiry" class="btn-submit">
        </form>
        
 	</div>
        
        
        
     
    
</body>
</html>