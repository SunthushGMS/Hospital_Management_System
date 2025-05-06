<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <label>Name :</label>
            <div id="Pname" class="basic-info-container"></div>
            <label>Age :</label>
            <div id="Page" class="basic-info-container"></div>
            <label>Gender :</label>
            <div id="Pgender" class="basic-info-container"></div>
            <label>Bloop Group :</label>
            <div id="Pbloodgroup" class="basic-info-container"></div>
            <label>Phone :</label>
            <div id="PPhone" class="basic-info-container"></div>
            <label>Email :</label>
            <div id="Pemail" class="basic-info-container"></div>
            <label>Emergency Contact :</label>
            <div id="PemergencyPhone" class="basic-info-container"></div>
        </div>
        <div id="section1Sub"class="div1">
            <label>Allergies :</label>
            <div id="PAllergies" class="more-info-container"></div>
            <label>Chronic Conditions :</label>
            <div id="PChronicConditions" class="more-info-container"></div>
        </div>
        
    </div>

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
            <form id="requestReport-form"action=""method="post">
                <label for="lab-reports-required">Lab Reports Required : </label><br><br>
                <input id="lab-reports-required" rows="6" required><br><br>
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
            <form id="emergency-form" action="" method="post">
                <label for="emergency-problem">Problem : </label><br><br>
                <input id="emergency-problem" rows="6" required><br><br>

                <label for="emergency-severity">Severity : </label><br><br>
                <input id="emergency-severity" rows="6" required><br><br>

                <label for="emergency-des">Description : </label><br><br>
                <textarea id="emergency-des" rows="6" required></textarea><br><br>
                <br><br>
                <button id="emergency-button" type="submit" class="submit-btn">Assign Emergency Patient Status</button>
            </form>
            
        </div>
    </div><br><br><br>

    <a href="createPrescription.html"><button id="Precription-button" type="submit" class="submit-btn">Create Prescription</button></body></html></a>

    <br><br><br>



    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>