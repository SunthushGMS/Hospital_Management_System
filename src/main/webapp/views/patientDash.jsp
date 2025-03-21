<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashbord | Health Lanka</title>
    <link rel="stylesheet" href="patientDash.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/patientDash.css">
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
    <h1 class="head">Patient Dashboard</h1>

    <div class="wrapper">
       <div class="div1">
        <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="" class="img-icon">
       </div>
       <div class="div1" id="div1sub">
        <p><strong>Name</strong> Chanuka De silva </p>
        <p><strong>Age</strong> 32 years</p>
        <p><strong>TP</strong> 0786568954</p>
        <p><strong>PatientID</strong> ID10786</p>
       </div>
    </div>

    <section class="sec1">
        <div class="div2">
            <div class="sub-div1">
                <h2 class="head1">Emergency</h2>
                <img src="${pageContext.request.contextPath}/assets/images/first-aid-kit.png" alt="" class="img-div">
                <h2 class="detail">No Emergency</h2>
            </div>
            <div class="sub-div1">
                <h2 class="head1">Appointment History</h2>
                <img src="${pageContext.request.contextPath}/assets/images/appointment.png" alt="" class="img-div">
                <button class="btn-view"><a href="" >View</a></button>
            </div>
            <div class="sub-div1">
                <h2 class="head1">Surgeries</h2>
                <img src="${pageContext.request.contextPath}/assets/images/surg2.png" alt="" class="img-div">
                <button class="btn-view"><a href="">View</a></button>
            </div>
            
        </div>

    </section>

    <div class="div3">
        <div class="sub-div2">
            <h2 class="head1">Requested Lab Reports</h2>
                <img src="${pageContext.request.contextPath}/assets/images/report.png" alt="" class="img-div">
                <div class="report">
                    <p><strong>Report 1</strong> Blood Report</p>
                <p><strong>Report 2</strong> Urine Report</p>
                <p><strong>Report 3</strong> Cholesterol Report</p>
                </div>
                
                <button class="btn-view"><a href="" >Upload Now</a></button>
        </div>
        <div class="sub-div2">
            <h2 class="head1">Payments</h2>
            <img src="${pageContext.request.contextPath}/assets/images/cash-payment.png" alt="" class="img-div">
                
                <button class="btn-view"><a href="" >View Payment History</a></button>
        </div>
        
        
    </div>


    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
