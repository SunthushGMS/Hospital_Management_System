<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Health Lanka</title>
    <link rel="stylesheet" href="contact.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/contact.css">
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

    <section class="sec1">
        <div class="wrapper">
        <div class="head">
            <h1 class="head1">Contact Us</h1>
        </div>
    </div>
    </section>
    <section class="sec2">
        <div class="wrapper1">
        <div class="contact">
            <img src="${pageContext.request.contextPath}/assets/images/customerservice.png" alt="" class="imgContact">
        </div>
        <div class="contact">
           <div class="form">
            <h1 class="head-contact">Send Us Massage</h1>
            <label for="Name">Name</label>
            <input type="text" class="input-contact">
            <br>
            <label for="Email">Email</label>
            <input type="email" class="input-contact">
            <br>
            <label for="Name">Contact</label>
            <input type="tel" class="input-contact">
            <br>
            <label for="Name">Massage</label>
            <input type="text" class="input-contact">
            <br>
            <button class="btn-submit">Send</button>
        </div>
        </div>
    </div>
    </section>
    <section class="sec3">
        <div class="wrapper3">
            <div class="sub-wrap">
                <img src="${pageContext.request.contextPath}/assets/images/24.png" alt="" class="imgSec3">
            </div>
            <div class="sub-wrap">
                <div class="head-emerg">Emergency Hotline</div>
          
                <h1 class="emergencyLine">1967</h1>
            </div>
            <div class="sub-wrap">
                <img src="${pageContext.request.contextPath}/assets/images/ambulance.png" alt="" class="imgSec3">
            </div>
        </div>
    </section>
    <section class="sec4">
        <div class="wrapper4">
            <div class="sub-wrap1">
                <h1 class="head-wrap">Contact</h1>
                <img src="${pageContext.request.contextPath}/assets/images/contactnew.png" alt="" class="imgSec4">
                <h2 class="contact-type">  <i class='bx bxl-gmail' id="icon"></i> healthLanka@gmail.com</h2>
                <h2 class="contact-type">  <i class='bx bx-phone' id="icon"></i> 0767882990</h2>
                <h2 class="contact-type">  <i class='bx bxl-whatsapp' id="icon"></i> 0786657990</h2>
                <h2 class="contact-type">  <i class='bx bxl-instagram' id="icon"></i> Health_Lanka</h2>
                <button class="btn-sec4">Call Now</button>
            </div>
            <div class="sub-wrap1">
                <h1 class="head-wrap">Location</h1>
                <img src="${pageContext.request.contextPath}/assets/images/locationnew.png" alt="" class="imgSec4">
                <h2 class="location">Health Lanka - Colombo <i class='bx bxs-location-plus' id="icon1"></i></h2>
                <h2 class="location">Health Lanka Mega - Kollupitiya <i class='bx bxs-location-plus' id="icon1"></i></h2>
                <h2 class="location">Health Lanka - Matara <i class='bx bxs-location-plus' id="icon1"></i></h2>
                <h2 class="location">Health Lanka - Kandy <i class='bx bxs-location-plus' id="icon1"></i></h2>
                <button class="btn-sec4" id="locate-btn">Locate Us</button>
            </div>
            <div class="sub-wrap1">
                <h1 class="head-wrap">Open Hours</h1>
                <img src="${pageContext.request.contextPath}/assets/images/open.png" alt="" class="imgSec5">
                <h2 class="open">Weekdays <span>24hrs Open</span></h2>
                <h2 class="open">Weekdays <span>24hrs Open</span></h2>
                <button class="btn-sec4" id="book-btn">Book Now</button>
            </div>
        </div>
    </section>
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
