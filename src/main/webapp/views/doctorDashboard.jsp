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


    <img id="doc-profile-Pic" src="${pageContext.request.contextPath}/assets/images/doctorProfile-picNew.jpg" alt="">

        
        <div id="div1">
            <div id="div1sub1">
            <h3>Hello</h3>
            <h3 id="doctordashboardDocName">Dr Sharuka</h3>
            <p>Your schedule for today</p>
            <div id="div1-1">
                <div class="div1-1sub">
                    <br><hr id="myHr"><br>
                    <div class="div1-1-1"><img src="${pageContext.request.contextPath}/assets/images/appointments-pic.jpg" alt=""></div>
                    <div class="div1-1-2">
					
                        <p>Appointments</p>
                    </div>
                </div>
                <div class="div1-1sub">
                    <br><hr id="myHr"><br>
                    <div class="div1-1-1"><img src="${pageContext.request.contextPath}/assets/images/surgery-pic.jpg" alt=""></div>
                    <div class="div1-1-2">
                        <h3 id="totalSurgeriesToday">17</h3>
                        <p>Surgeries</p>
                    </div>
                </div>
            </div>
            </div>   
        </div>



    <br>
    <div class="wrapper" >
        <div class="div3">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-raise-hand.png" alt="">
            <h3>Upcoming Appointments</h3>
            <p>Today</p>

						
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
			    <div class="no-records">No appointments found for today.</div>
			</c:if>
           
            <button class="viewAll"><a href="${pageContext.request.contextPath}/Appointments">View All</a></button>
           
        </div>

        <div class="div3">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-sugery -medical.png" alt="">
            <h3>Upcoming Surgeries</h3>
            <p>This Week</p>
			<c:if test="${not empty weeklySurgeries}">
			    <table class="table table-striped table-bordered">
			        <thead>
			            <tr>
			                <th>Surgery ID</th>
			                <th>Patient ID</th>
			                <th>Patient Name</th>
			                <th>Surgery Name</th>
			                <th>Time</th>
			                <th>Completion Status</th>
			                <th>Acceptance Status</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="surgery" items="${weeklySurgeries}">
			                <tr>
			                    <td>${surgery.surgeryId}</td>
			                    <td>${surgery.patientId}</td>
			                    <td>${surgery.patientName}</td>
			                    <td>${surgery.surgeryName}</td>
			                    <td>${surgery.time}</td>
			                    <td>${surgery.completionStatus}</td>
			                    <td>${surgery.acceptanceStatus}</td>
			                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
			</c:if>
			
			<c:if test="${empty weeklySurgeries}">
			    <div class="no-records">No scheduled surgeries for this week.</div>
			</c:if>

            <a href="surgeries.html"><button class="viewAll">View All</button></a>
        </div>


       
    </div><br><br>


    <div  class="wrapper" id="emergencyDiv">
        <div id="emergency-subDiv1">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/emergency -pic.jpg" alt="">
            <h3>Emergency Patients</h3>
            <div id="emergencyPatientDiv">
                <p>You have <span  id="EmergencyPatientCount">  6 </span> new patients</p>
            </div><br>
        </div>
        <div id="emergency-subDiv2">
            <table id="emergencyTable">
                <tr>
                    <th>Emergency ID</th>
                    <th>Patient name</th>
                    <th> Phone</th>
                    <th>Medical Problem</th>
                    <th>severity</th>
                    <th>Description</th>
                    <th>More</th>
                </tr>

			    <c:forEach var="emergency" items="${emergencyPatients}">
			    <tr>
			        <td>${emergency.surgeryId}</td>
			        <td>${emergency.patientName}</td>
			        <td>${emergency.phone}</td>
			        <td>${emergency.problem}</td>
			        <td>${emergency.severity}</td>
			        <td>${emergency.description}</td>
			    </tr>
			</c:forEach>
            </table>
        </div>
      </div> <br><br>

 

    <div class="wrapper">
        <div class="div4">
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
            <a href="appointments.html"><button class="viewAll">View All</button></a>
        </div>




        <div class="div4">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard--3d-report.png" alt="">
            <h3>Latest Lab Reports</h3>
            <table>
                <tr>
                    <th>Patient Name</th>
                    <th>Report Name</th>
                    <th>Summary</th>
                    <th>View Report</th>
                </tr>
    
                <tr>
                    <td>Kavindi Perera</td>
                    <td>Nerovascor Repair Lab</td>
                    <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
                    <td><img id="labreportsPics" src="${pageContext.request.contextPath}/assets/images/labreports-pic.jpg" alt=""></td>
                </tr>

                <tr>
                    <td>Kavindi Perera</td>
                    <td>Nerovascor Repair Lab</td>
                    <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
                    <td><img id="labreportsPics" src="${pageContext.request.contextPath}/assets/images/labreports-pic.jpg" alt=""></td>
                </tr>

                <tr>
                    <td>Kavindi Perera</td>
                    <td>Nerovascor Repair Lab</td>
                    <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
                    <td><img id="labreportsPics" src="${pageContext.request.contextPath}/assets/images/labreports-pic.jpg" alt=""></td>
                </tr>
            </table><br>
            <a href="labReports.html"><button class="viewAll">View All</button></a>
        </div>
    </div>
    <br>
    <div class="wrapper">
        <div id="div5"></div>

        <div id="div6"></div>
    </div>
    
    <br>
    
    <jsp:include page="/views/partials/footer.jsp"/>  
</body>
</html> 