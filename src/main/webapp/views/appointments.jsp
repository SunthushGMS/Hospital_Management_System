<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointments.css">
   
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>
    <h1 id="heading">Appointments</h1>

    <img id="app-image" src="${pageContext.request.contextPath}/assets/images/doctorDashboard_apointmentIcon2.png">


 
	<h2 class="tableHeading">New Appointments</h2>
	<table border="1">
	    <tr>
	        <th>Appointment ID</th>
	        <th>Patient ID</th>
	        <th>Patient Name</th>
	        <th>Email</th>
	        <th>Phone</th>
	        <th>Date</th>
	        <th>Time</th>
	        <th>Status</th>
	        <th>View More</th>
	    </tr>
	
	    <c:forEach var="appointment" items="${newAppointments}">
	        <tr>
	            <td>${appointment.appointmentId}</td>
	            <td>${appointment.patientId}</td>
	            <td>${appointment.patientName}</td>
	            <td>${appointment.email}</td>
	            <td>${appointment.phone}</td>
	            <td>${appointment.date}</td>
	            <td>${appointment.time}</td>
	            <td>
	                <button id="acceptAppointmentBtn">Accept</button><br><br>
	                <button id="RescheduleAppointmentBtn">Reschedule</button>
	            </td>
	            <td>
	            <a href="${pageContext.request.contextPath}/PatientProfile_DoctorView?patientId=${appointment.patientId}">
				    <img src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" id="hamburger-Icon" alt="View" width="20" height="20">
				</a>


	            </td>
	        </tr>
	    </c:forEach>
	</table>
	


   <br><br><br><br><br>

	<h2 class="tableHeading">Your appointments scheduled for the day</h2>
	<table border="1">
	    <tr>
	        <th>Appointment ID</th>
	        <th>Patient ID</th>
	        <th>Patient Name</th>
	        <th>Email</th>
	        <th>Phone</th>
	        <th>Date</th>
	        <th>Time</th>
	        <th>View more</th>
	    </tr>
	
	    <c:forEach var="appointment" items="${todayAppointments}">
	        <tr>
	            <td>${appointment.appointmentId}</td>
	            <td>${appointment.patientId}</td>
	            <td>${appointment.patientName}</td>
	            <td>${appointment.email}</td>
	            <td>${appointment.phone}</td>
	            <td>${appointment.date}</td>
	            <td>${appointment.time}</td>
	            <td>
	            	
	               <a href="${pageContext.request.contextPath}/PatientProfile_DoctorView?patientId=${appointment.patientId}">
					    <img src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" id="hamburger-Icon" alt="View" width="20" height="20">
					</a>

		</td>
	        </tr>
	    </c:forEach>
	</table>



   <br><br><br><br><br>

   <h2 class="tableHeading">Cancelled Appointments</h2>
   <table>
    <tr>
        <th>Appointment ID</th>
        <th>Patient ID</th>
        <th>Patient Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Date</th>
        <th>Time</th>
        <th>View more</th>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>
   </table>
    
   <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>