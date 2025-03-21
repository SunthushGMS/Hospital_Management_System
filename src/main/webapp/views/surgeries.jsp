<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surgeries | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/surgeries.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>
    <h1 id="heading">Surgeries</h1>

    <img id="app-image" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-sugery -medical.png">


    <h2 class="tableHeading">Surgeries  recommended  by you</h2>
   <table>
    <tr>
        <th>Patient ID</th>
        <th>Patient Name</th>
        <th>Contact Info</th>
        <th>Surgery ID</th>
        <th>Surgery Name</th>
        <th>description</th>
        <th>Date</th>
        <th>Time</th>
        <th>View more</th>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>
   </table>


   <br><br><br><br><br>

   <h2 class="tableHeading">Accepted Surgeries</h2>
   <table>
    <tr>
        <th>Patient ID</th>
        <th>Surgery ID</th>
        <th>Surgery Name</th>
        <th>description</th>
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


   <br><br><br><br><br>

   <h2 class="tableHeading">Surgeries with reschedule request</h2>
   <table>
    <tr>
        <th>Patient ID</th>
        <th>Patient Name</th>
        <th>Contact Info</th>
        <th>Surgery ID</th>
        <th>Surgery Name</th>
        <th>description</th>
        <th>Date</th>
        <th>Time</th>
        <th>Status</th>
        <th>View more</th>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><button id="acceptAppointmentBtn">Send New Surgery Appointment</button></a><br><br>
        </td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><button id="acceptAppointmentBtn">Send New Surgery Appointment</button></a><br><br>
        </td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><button id="acceptAppointmentBtn">Send New Surgery Appointment</button></a><br><br>
        </td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><button id="acceptAppointmentBtn">Send New Surgery Appointment</button></a><br><br>
        </td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>Kavindi Perera</td>
        <td>+94 76 123 4567</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><button id="acceptAppointmentBtn">Send New Surgery Appointment</button></a>
            <br><br>
        </td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>
   </table>


   <br><br><br><br><br>

   <h2 class="tableHeading">Rejected Surgeries</h2>
   <table>
    <tr>
        <th>Patient ID</th>
        <th>Surgery ID</th>
        <th>Surgery Name</th>
        <th>Date</th>
        <th>Time</th>
        <th>View more</th>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Cardiovascular Glutemen surgery</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
    </tr>
   </table>



   



    
   <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>