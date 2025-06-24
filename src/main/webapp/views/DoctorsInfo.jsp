<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Portal | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/doctorInfo.css">

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
 <section class="doctor-section">
  <div class="container">
    <h2 class="section-title">Our Medical Team</h2>

    <div class="doctor-card">
      <div class="doctor-img">
    <img src="${pageContext.request.contextPath}/assets/images/doctor-02.png" alt="" style="height: 200px;" class="-mt-8 transition-transform duration-500 hover:scale-105">
      </div>
      <div class="doctor-info">
        <h3>Dr. Sara Silva</h3>
        <p class="specialty">Cardiologist</p>
        <p><i class='bx bx-time'></i> Mon - Fri, 9:00 AM - 3:00 PM</p>
        <p><i class='bx bx-envelope'></i> sara@healthlanka.lk</p>
        <p class="qualification"><strong>Qualifications:</strong> MD, Cardiology, Harvard Medical School</p>
        <p class="experience"><strong>Experience:</strong> 15+ years in interventional cardiology and heart disease management. Published 10+ research papers.</p>
        <a href="#" class="book-btn">Book Appointment</a>
      </div>
    </div>

    <div class="doctor-card">
      <div class="doctor-img">
<img src="${pageContext.request.contextPath}/assets/images/doctor-02.png" alt="" style="height: 200px;" class="-mt-8 transition-transform duration-500 hover:scale-105">
      </div>
      <div class="doctor-info">
        <h3>Dr. Nimal Perera</h3>
        <p class="specialty">Neurologist</p>
        <p><i class='bx bx-time'></i> Tue - Sat, 10:00 AM - 4:00 PM</p>
        <p><i class='bx bx-envelope'></i> nimal@healthlanka.lk</p>
        <p class="qualification"><strong>Qualifications:</strong> MBBS, Neurology Specialist, University of Colombo</p>
        <p class="experience"><strong>Experience:</strong> Over 12 years treating neurological disorders including epilepsy and stroke rehabilitation.</p>
        <a href="#" class="book-btn">Book Appointment</a>
      </div>
    </div>

    <div class="doctor-card">
      <div class="doctor-img">
        <img src="${pageContext.request.contextPath}/assets/images/doctor-02.png" alt="" style="height: 200px;" class="-mt-8 transition-transform duration-500 hover:scale-105">
      </div>
      <div class="doctor-info">
        <h3>Dr. Kaveesha Jayawardena</h3>
        <p class="specialty">Pediatrician</p>
        <p><i class='bx bx-time'></i> Mon - Thu, 8:00 AM - 2:00 PM</p>
        <p><i class='bx bx-envelope'></i> kaveesha@healthlanka.lk</p>
        <p class="qualification"><strong>Qualifications:</strong> MD Pediatrics, Johns Hopkins University</p>
        <p class="experience"><strong>Experience:</strong> 10 years of experience caring for infants and children, expert in childhood immunizations and growth disorders.</p>
        <a href="#" class="book-btn">Book Appointment</a>
      </div>
    </div>

  </div>
</section>

  
  
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
