<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/doctorDashboard.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>
    <h1 id="heading">Doctor Dashboard</h1>

	       
    <img id="doc-profile-Pic" src="${pageContext.request.contextPath}/assets/images/profilePics/${profilepic}" alt="Doctor profile picture">

        
        <div id="div1">
            <div id="div1sub1">
            <h3>Hello</h3>
            <h3 id="doctordashboardDocName">Dr.${user.username}</h3>
            </div>   
        </div>



    <br>
    <div class="wrapper" >
        <div class="div3">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-raise-hand.png" alt="">
            <h3>Today Appointments</h3>

						
			<c:if test="${not empty todayAppointments}">
			    <table class="table table-striped table-bordered">
			        <thead>
			            <tr>
			                <th>Appointment ID</th>
			                <th>Patient ID</th>
			                <th>Patient Name</th>
			                <th>Time</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="a" items="${todayAppointments}">
			                <tr>
			                    <td>${a.appointmentId}</td>
			                    <td>${a.patientId}</td>
			                    <td>${a.patientName}</td>
			                    <td>${a.time}</td>
			                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
			</c:if>
			
			<c:if test="${empty todayAppointments}">
			 	<div class="p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
  				<span class="font-medium">No appointments found for today!</span> 
				</div>
			</c:if>
           
            <button class="viewAll"><a href="${pageContext.request.contextPath}/Appointments">View All</a></button>
           
        </div>

        <div class="div3">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-apointmentIcon2.png" alt="">
            <h3>New Appointments</h3>
           <table>
			    <thead>
			        <tr>
			            <th>Profile</th>
			            <th>Appointment ID</th>
			            <th>Patient Name</th>
			            <th>Date</th>
			            <th>Time</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach var="a" items="${newAppointments}">
			            <tr>
			                <td>
			                    <img id="newAppTable-img" src="${pageContext.request.contextPath}/assets/images/profile-pic.png" alt="Profile">
			                </td>
			                <td>${a.appointmentId}</td>
			                <td>${a.patientName}</td>
			                <td>${a.date}</td>
			                <td>${a.time}</td>
			            </tr>
			        </c:forEach>
			    </tbody>
			</table>

			<c:if test="${empty newAppointments}">
			    <div class="no-records">No new pending appointments found.</div>
			</c:if>
            <button class="viewAll"><a href="${pageContext.request.contextPath}/Appointments">View All</a></button>
        </div>


       
    </div><br><br>


 
	
	<div class="prescription-section">
	    <div class="prescription-card">
	        <div class="prescription-text">
	            <h3>View All Prescriptions</h3>
	            <p>Your Trusted Records of Care – Accurate, Accessible, Always.</p>
	            <a href="${pageContext.request.contextPath}/ViewPrescription" class="prescription-btn">Click Here</a>
	        </div>
	        <div class="prescription-image">
	            <img src="${pageContext.request.contextPath}/assets/images/pngegg.png" alt="Patient Image">
	        </div>
	    </div>
	</div>
	
	
		
		<div class="tools-section">
	  <h2>Dashboard Tools</h2>
	  <div class="tool-cards">
	    <!-- Current Time Widget -->
	    <div class="tool-card">
	      <h4>Current Time</h4>
	      <p id="current-time"></p>
	    </div>
	
	    <!-- Daily Health Tip -->
	    <div class="tool-card">
	      <h4>Daily Health Tip</h4>
	      <p id="health-tip">
	        Remember to take short breaks to reduce eye strain during long work hours.
	      </p>
	    </div>
	
	    <!-- Quick Links -->
	    <div class="tool-card">
	      <h4>Quick Links</h4>
	      <ul>
	        <li><a href="https://symptoms.webmd.com/" target="_blank">Sympton Checker</a></li>
	        <li><a href="https://www.calculator.net/bmi-calculator.html">BMI Calculator</a></li>
	        <li><a href="https://www.webmd.com/pill-identification/default.htm">Pill Identifier</a></li>
	      </ul>
	    </div>
	  </div>
	</div>
	
	<script>
	// simple clock, updates every second
	function updateTime() {
	  const now = new Date();
	  document.getElementById('current-time')
	          .textContent = now.toLocaleTimeString();
	}
	setInterval(updateTime, 1000);
	updateTime();
	</script>
	
	
	    
    <jsp:include page="/views/partials/footer.jsp"/>  
</body>
</html> 