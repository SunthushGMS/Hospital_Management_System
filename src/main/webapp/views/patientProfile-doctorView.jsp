<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Profile | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/patientProfile-doctorView.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>
    <br><br><br>
    <img id="patient-profile-Pic" src="${pageContext.request.contextPath}/assets/images/profile-pic.png" alt="">

    <h3 id="subHeading">Patient Profile</h3>

    <div id="section1" class="wrapper">
        <div id="section1Sub" class="div1">
            <label>Patient ID :</label>
            <div id="pid" class="basic-info-container">${patient.uid}</div>

            <label>Name :</label>
            <div id="Pname" class="basic-info-container">${patient.fullname}</div>

            
            <label>Gender :</label>
            <div id="Pgender" class="basic-info-container">${patient.gender}</div>

            <label>Blood Type :</label>
            <div id="PbloodType" class="basic-info-container">${patient.bloodGroup}</div>

            <label>Phone :</label>
            <div id="PPhone" class="basic-info-container">${patient.phone}</div>

            <label>Email :</label>
            <div id="Pemail" class="basic-info-container">${patient.email}</div>
        </div>

        <div id="section1Sub" class="div1">
            <label>Allergies :</label>
            <div id="PAllergies" class="more-info-container" STYLE="height:85px;">${patient.allergies}</div>

            <label>Medical History :</label>
            <div id="PmedicalHistory" class="more-info-container" STYLE="height:85px;">${patient.medicalHistory}</div>

            <label>Current Medication :</label>
            <div id="PCurrentMedication" class="more-info-container" STYLE="height:85px;">${patient.currentMedication}</div>

        </div>
    </div>
</body>



    <br><br><br>

    <h2 class="tableHeading">New Appointments</h2>
   <table>
    <tr>
        <th>Vaccination ID</th>
        <th>Vaccination Name</th>
        <th>Date of vaccination</th>
        <th>Manufacturer</th>
        <th>Status</th>
        <th>PDF</th>
    </tr>

    <tr>
        <td>1</td>
        <td>Corona Vaccination</td>
        <td>13/03/2025</td>
        <td>Fizer</td>
        <td>pending</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/labP-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Corona Vaccination</td>
        <td>13/03/2025</td>
        <td>Fizer</td>
        <td>pending</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/labP-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Corona Vaccination</td>
        <td>13/03/2025</td>
        <td>Fizer</td>
        <td>pending</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/labP-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Corona Vaccination</td>
        <td>13/03/2025</td>
        <td>Fizer</td>
        <td>pending</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/labP-icon.png" alt=""></a></td>
    </tr>
    
   </table>

   <br><br><br><br><br>






    <div class="wrapper"></div>

    <div class="wrapper">
        <div class="div1">
            <img src="${pageContext.request.contextPath}/assets/images/labP-icon.png">
            <h3 id="subHeading">Make a request for lab reports</h3>
            <form id="requestReport-form" action="${pageContext.request.contextPath}/SurgeryController" method="post">
                <label for="name">Lab Reports Required : </label><br><br>
                <input id="lab-reports-required" name="name" required><br><br>
                <button type="submit" class="submit-btn">Send Message</button>
            </form>
            <br><br><br>
            <p>Please enter name of lab report required and press send request button again if you require more than one report</p>
            <br><br><br>
            <a href="labReports.html"><button>Click here to view exiting lab reports</button></a>
            

        </div>


        <div class="div1">
            <img src="${pageContext.request.contextPath}/assets/images/surgeryP-icon.png">
            <h3 id="subHeading">Make a recommendation for surgery</h3>
            
            
         <form id="surgery-form" action="${pageContext.request.contextPath}/SurgeryController" method="post">
		   	<input type="hidden" name="patientId" value="${patientId}" />
		   	
		    <label for="name">Surgery name : </label><br><br>
		    <input type="text" id="surgery-name" name="name" required><br><br>
		
		    <label for="date">Date : </label><br><br>
		    <input type="date" id="surgery-date" name="date" required><br><br>
		
		    <label for="time">Time : </label><br><br>
		    <input type="time" id="surgery-time" name="time" required><br><br>
		
		    <button type="submit" class="submit-btn">Send Surgery Appointment</button>
		</form>


            
            
        </div>


        <div class="div1">
            <img src="${pageContext.request.contextPath}/assets/images/emegencyP-icon.png">
            <h3 id="subHeading">Assign emergency Patient Status</h3>
            <form id="emergency-form"  action="<%=request.getContextPath()%>/EmergencyPatientController" method="post">
                <label for="problem">Problem : </label><br><br>
                <input id="emergency-problem" name="problem" required><br><br>

                <label for="severity">Severity:</label>
				<select name="severity" id="severity" required>
    				<option value="">-- Select Severity --</option>
    				<option value="LOW">Low</option>
    				<option value="MEDIUM">Medium</option>
				    <option value="HIGH">High</option>
				    <option value="CRITICAL">Critical</option>
				</select><br><br>

                <label for="description">Description : </label><br><br>
                <textarea id="emergency-des" name="description" required></textarea><br><br>
                <br><br>
                <button id="emergency-button" type="submit" class="submit-btn">Assign Emergency Patient Status</button>
            </form>
            
        </div>
    </div><br><br><br>

   
	

	 <a href="${pageContext.request.contextPath}/PrescriptionController?patientId=${patient.uid}">
    	<button id="Precription-button" type="submit" class="submit-btn">Create Prescription</button>
	</a>
	
	


    <br><br><br>



    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>