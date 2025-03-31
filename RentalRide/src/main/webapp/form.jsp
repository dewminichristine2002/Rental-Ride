<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Vehicle</title>
  
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
         margin:60px 300px 20px 300px;
            width: 100%;
            max-width: 600px;
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
        .text-primary {
            color: #007bff;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        .form-group label {
            display: block;
            margin-bottom: .5rem;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: .5rem;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .text-danger {
            color: #dc3545;
        }
        .btn {
            display: inline-block;
            font-weight: 400;
            color: #fff;
            text-align: center;
            vertical-align: middle;
            user-select: none;
            background-color: #007bff;
            border: 1px solid #007bff;
            padding: .5rem 1rem;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-block {
            display: block;
            width: 100%;
        }
    </style>
   
   
</head>
    <jsp:include page="nav.jsp" />
<body>


<div class="container mt-4">
    <h2 class="text-center mb-4 text-primary">Book a Vehicle</h2>
    <form id="bookingForm" onsubmit="return validateForm()" action="booking" method="post">
        <div class="form-group">
            <label for="vehicleName">Vehicle Name:</label>
            <input type="text" class="form-control" id="vehicleName" name="vehicleName" required>
        </div>
        <div class="form-group">
            <label for="rentalDuration">Rental Duration:</label>
            <input type="text" class="form-control" id="rentalDuration" name="rentalDuration" placeholder="Select start and end date from the calendar" required>
        </div>
        <div class="form-group">
            <label for="customerName">Please Enter your full name:</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div id="errorMessage" class="text-danger"></div>
        <button type="submit" class="btn btn-primary btn-block">Book Vehicle</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
<script>
    $(document).ready(function() {
        $('#rentalDuration').datepicker({
            format: 'M d',
            autoclose: true,
            clearBtn: true,
            todayHighlight: true,
            startDate: '+0d',
            toggleActive: true,
            multidate: true,
            multidateSeparator: " - "
        });

        $('#bookingForm').on('submit', function(event) {
            var rentalDuration = $('#rentalDuration').datepicker('getDates');
            if (rentalDuration.length !== 2) {
                event.preventDefault(); // Prevent form submission
                $('#errorMessage').text('Please enter exactly two valid dates.');
            } else {
                $('#errorMessage').text(''); // Clear any previous
                // Clear any previous error messages
            }
        });
    });

    function validateForm() {
        var vehicleName = document.getElementById("vehicleName").value.trim();
        var rentalDuration = document.getElementById("rentalDuration").value.trim();
        var customerName = document.getElementById("customerName").value.trim();

        if (vehicleName === "") {
            alert("Please enter the vehicle name.");
            return false;
        }

        if (rentalDuration === "") {
            alert("Please enter the rental duration.");
            return false;
        }

        if (customerName === "") {
            alert("Please enter your full name.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>

