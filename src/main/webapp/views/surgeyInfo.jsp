<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Surgery Info | Health Lanka</title>
    <link rel="stylesheet" href="surgeryInfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/surgeryInfo.css">
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
<h1 class="head">Surgery Info</h1>
<img src="${pageContext.request.contextPath}/assets/images/surg2.png" alt="" class="icon-img">
<p class="para">This table displays scheduled surgeries along with their respective details, including date, time, and description. Please confirm or reschedule appointments as necessary, or decline if required.</p>

<table class="tb-surg">
    <thead>
        <tr>
            <th>Surgery ID</th>
            <th>Surgery Name</th>
            <th>Surgery Date</th>
            <th>Surgery Time</th>
            <th>Description</th>
            <th>Confirm/Reschedule</th>
            <th>Decline</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>SUR001</td>
            <td>Appendectomy</td>
            <td>2025-04-10</td>
            <td>10:00 AM</td>
            <td>Removal of the appendix due to inflammation.</td>
            <td><button class="confirm">Confirm</button><br>
            <button class="Reschedule">Rechedule</button></td>
            <td><button class="decline">Decline</button></td>
        </tr>
        <tr>
            <td>SUR002</td>
            <td>Hip Replacement</td>
            <td>2025-04-15</td>
            <td>02:00 PM</td>
            <td>Surgical replacement of the hip joint.</td>
            <td><button class="confirm">Confirm</button><br>
                <button class="Reschedule">Rechedule</button></td>
            <td><button class="decline">Decline</button></td>
        </tr>
        <tr>
            <td>SUR003</td>
            <td>Coronary Bypass</td>
            <td>2025-04-18</td>
            <td>08:30 AM</td>
            <td>Improves blood flow to the heart by bypassing blocked arteries.</td>
            <td><button class="confirm">Confirm</button><br>
                <button class="Reschedule">Rechedule</button></td>
            <td><button class="decline">Decline</button></td>
        </tr>
        <tr>
            <td>SUR004</td>
            <td>Cataract Surgery</td>
            <td>2025-04-22</td>
            <td>11:45 AM</td>
            <td>Removal of a cloudy lens and replacement with an artificial lens.</td>
            <td><button class="confirm">Confirm</button><br>
                <button class="Reschedule">Rechedule</button></td>
            <td><button class="decline">Decline</button></td>
        </tr>
        <tr>
            <td>SUR005</td>
            <td>Knee Arthroscopy</td>
            <td>2025-04-25</td>
            <td>09:15 AM</td>
            <td>Minimally invasive knee surgery to repair damaged tissue.</td>
            <td><button class="confirm">Confirm</button><br>
                <button class="Reschedule">Rechedule</button></td>
            <td><button class="decline">Decline</button></td>
        </tr>
    </tbody>
</table>


    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
