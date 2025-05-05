<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment History | Health Lanka</title>
    <link rel="stylesheet" href="appointHistory.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>
   <h1 class="history-head">Appointment History</h1>
   <img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="" class="clock-icon">
   <div class="detail-history">
    <p class="history-para">The Appointment History section in Health Lanka allows patients to view and manage their past medical visits. It provides details such as doctor's name, department, date, time, and appointment status (Completed, Cancelled). Patients can easily track their medical records, access prescriptions, and review past consultations, ensuring a seamless healthcare experience.</p>
   </div>
   
   <section class="sec1">
    <div class="table-view">
      	<c:if test="${not empty appointments}">
		    <table>
		        <thead>
		            <tr>
		                <th>ID</th>
		                <th>Doctor ID</th>
		                <th>Patient ID</th>
		                <th>Date</th>
		                <th>Time</th>
		                <th>Status</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="a" items="${appointments}">
		                <tr>
		                    <td>${a.id}</td>
		                    <td>${a.doctorId}</td>
		                    <td>${a.patientId}</td>
		                    <td>${a.appointmentDate}</td>
		                    <td>${a.time}</td>
		                    <td>${a.status}</td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</c:if>

		<c:if test="${empty appointments}">
		    <div class="no-records">No appointment history found for this patient.</div>
		</c:if>
      	
        <button class="btn-down">Download PDF</button>
    </div>
   </section>
   <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
