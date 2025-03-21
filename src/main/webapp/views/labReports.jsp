<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Records | Health Lanka</title>
   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/labReort.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<body>
    <jsp:include page="/views/partials/header.jsp"/>
    <h1 id="heading">Lab Reports</h1>

    <img id="app-image" src="images/labreports-pic.jpg">


    <h2 class="tableHeading">New Lab Reports</h2>
   <table>
    <tr>
        <th>Report ID</th>
        <th>Patient ID</th>
        <th>Patient Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Date</th>
        <th>Time</th>
        <th>Document</th>
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
        <td>
            <a href="patientProfile-doctorView.html"><img src="images/doctorDashboard--3d-report.png" id="labReport-pic"></a>
            <p>Click here</p>
        </td>
        <td><img id="hamburger-Icon" src="images/hamburger-icon.png" alt=""></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><img src="images/doctorDashboard--3d-report.png" id="labReport-pic"></a>
            <p>Click here</p>
        </td>
        <td><img id="hamburger-Icon" src="images/hamburger-icon.png" alt=""></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><img src="images/doctorDashboard--3d-report.png" id="labReport-pic"></a>
            <p>Click here</p>
        </td>
        <td><img id="hamburger-Icon" src="images/hamburger-icon.png" alt=""></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><img src="images/doctorDashboard--3d-report.png" id="labReport-pic"></a>
            <p>Click here</p>
        </td>
        <td><img id="hamburger-Icon" src="images/hamburger-icon.png" alt=""></td>
    </tr>

    <tr>
        <td>1</td>
        <td>3</td>
        <td>Kavindi Perera</td>
        <td>kavindi.perera92@email.com</td>
        <td>+94 76 123 4567</td>
        <td>13/03/2025</td>
        <td>10.36 AM</td>
        <td>
            <a href="patientProfile-doctorView.html"><img src="images/doctorDashboard--3d-report.png" id="labReport-pic"></a>
            <p>Click here</p>
        </td>
        <td><img id="hamburger-Icon" src="images/hamburger-icon.png" alt=""></td>
    </tr>
   </table>

   <br><br>

</body>
</html>