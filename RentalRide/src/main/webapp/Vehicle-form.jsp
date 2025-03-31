<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Management Application</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Bootstrap Datepicker CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.min.css">
</head>
<body>

    <header>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
            <div>
                <a href="https://www.xadmin.net" class="navbar-brand">Vehicle Management Application</a>
            </div>
            <ul class="navbar-nav">
                <li><a href="${pageContext.request.contextPath}/list" class="nav-link">Vehicles</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <!-- Main content container -->
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <!-- Vehicle form -->
                <c:if test="${vehicle != null}">
                    <form id="vehicleForm" action="${pageContext.request.contextPath}/update" method="post">
                </c:if>
                <c:if test="${vehicle == null}">
                    <form id="vehicleForm" action="${pageContext.request.contextPath}/insert" method="post">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${vehicle != null}">
                            Edit Vehicle
                        </c:if>
                        <c:if test="${vehicle == null}">
                            Add New Vehicle
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${vehicle != null}">
                    <input type="hidden" name="id" value="<c:out value='${vehicle.id}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Vehicle Name</label>
                    <%-- Check if vehicle name is not null before displaying --%>
                    <c:choose>
                        <c:when test="${not empty vehicle.name}">
                            <input type="text" value="<c:out value='${vehicle.name}' />" class="form-control" name="name" required="required">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="form-control" name="name" required="required">
                        </c:otherwise>
                    </c:choose>
                </fieldset>

                <fieldset class="form-group">
                    <label>Vehicle Availability</label>
                    <!-- Select dropdown for availability -->
                    <select class="form-control" name="availability">
                        <option value="Available" ${vehicle.availability == 'Available' ? 'selected' : ''}>Available</option>
                        <option value="Not Available" ${vehicle.availability == 'Not Available' ? 'selected' : ''}>Not Available</option>
                    </select>
                </fieldset>

                <fieldset class="form-group">
                    <label>Vehicle Duration</label>
                    <!-- Input field with datepicker and placeholder -->
                    <input type="text" class="form-control" id="duration" name="duration" placeholder="Select start and end date from the calender" required="required">
                </fieldset>

                <!-- Error message display -->
                <div id="errorMessage" class="text-danger"></div>

                <!-- Save button -->
                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Bootstrap Datepicker JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
    <!-- Datepicker initialization script -->
    <script>
        $(document).ready(function(){
            // Initialize the datepicker
            $('#duration').datepicker({
                format: 'M d',
                autoclose: true,
                clearBtn: true,
                todayHighlight: true,
                startDate: '+0d',
                toggleActive: true,
                multidate: true,
                multidateSeparator: " - "
            });

            // Pre-populate the datepicker with the existing duration data
            <c:if test="${vehicle != null && not empty vehicle.duration}">
                var existingDurations = "<c:out value='${vehicle.duration}' />".split(" - ");
                $('#duration').datepicker('setDates', existingDurations);
            </c:if>

            // Form validation
            $('#vehicleForm').on('submit', function(event) {
                var selectedDates = $('#duration').datepicker('getDates');
                if (selectedDates.length !== 2) {
                    event.preventDefault(); // Prevent form submission
                    $('#errorMessage').text('Please enter exactly two valid dates.');
                } else {
                    $('#errorMessage').text(''); // Clear any previous error messages
                }
            });
        });
    </script>
</body>
</html>
