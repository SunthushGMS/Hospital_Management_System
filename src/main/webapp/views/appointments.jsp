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
	    
	    <c:if test="${empty newAppointments}">
	     <tr>
	            <td colspan="9" style="text-align:center;">
	            <div class="p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
				 <span class="font-medium">No new appointments available!</span> 
				</div>
				</td>
	    </tr>
		</c:if>
	
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
				    <form method="post" action="${pageContext.request.contextPath}/Appointments">
				        <input type="hidden" name="appointmentId" value="${appointment.appointmentId}" />
				        <input type="hidden" name="action" value="accept" />
				        <button type="submit" id="acceptAppointmentBtn">Accept</button>
				    </form>
				    
				    <br><br>
				    
				    <form method="post" action="${pageContext.request.contextPath}/Appointments">
					    <input type="hidden" name="appointmentId" value="${appointment.appointmentId}" />
					    <input type="hidden" name="action" value="reschedule" />
					    <button type="submit" id="RescheduleAppointmentBtn">Reschedule</button>
					</form>

				    
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
	        <th>Status</th>
	        <th>View more</th>
	    </tr>
	    
	    <c:if test="${empty todayAppointments}">
	        <tr>
	            <td colspan="9" style="text-align:center;">
	            <div class="p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
				 <span class="font-medium">No today's appointments available!</span> 
				</div>
				</td>
	        </tr>
	    </c:if>
	
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
	            <form method="post" action="${pageContext.request.contextPath}/Appointments">
				    <input type="hidden" name="appointmentId" value="${appointment.appointmentId}" />
				    <input type="hidden" name="action" value="completed" />
				    <button type="submit" id="acceptAppointmentBtn">Completed</button>
				</form>

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

  	<h2 class="tableHeading">Incomplete Appointments</h2>
	<table border="1">
	    <tr>
	        <th>Appointment ID</th>
	        <th>Patient ID</th>
	        <th>Patient Name</th>
	        <th>Email</th>
	        <th>Phone</th>
	        <th>Date</th>
	        <th>Time</th>
	        <th>View More</th>
	    </tr>
	    
	    <c:if test="${empty incompletedAppointments}">
	     <tr>
	            <td colspan="9" style="text-align:center;">
	            <div class="p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
				 <span class="font-medium">No incompleted appointments available!</span> 
				</div>
				</td>
	    </tr>
		</c:if>
	
	    <c:forEach var="appointment" items="${incompletedAppointments}">
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

  	<h2 class="tableHeading">Completed Appointments</h2>
	<table border="1">
	    <tr>
	        <th>Appointment ID</th>
	        <th>Patient ID</th>
	        <th>Patient Name</th>
	        <th>Email</th>
	        <th>Phone</th>
	        <th>Date</th>
	        <th>Time</th>
	        <th>View More</th>
	    </tr>
	    
		<c:if test="${empty completedAppointments}">
			<tr>
	            <td colspan="9" style="text-align:center;">
	            <div class="p-4 mb-4 text-sm text-blue-800 rounded-lg bg-blue-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
				 <span class="font-medium">No completed appointments available!</span> 
				</div>
				</td>
	    	</tr>
		</c:if>
	
	    <c:forEach var="appointment" items="${completedAppointments}">
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
    
   <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>