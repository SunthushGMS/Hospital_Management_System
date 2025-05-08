<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment History | Health Lanka</title>
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

    <main class="container">
        <h1 class="main-title">Patient Dashboard</h1>

        <!-- Profile Section -->
        <section class="profile">
        
            <div class="profile-info">
                <p><strong>Name</strong>  Chanuka De Silva</p>
                <p><strong>Age</strong>  32 years</p>
                <p><strong>TP</strong>  0786568954</p>
                <p><strong>Patient ID</strong>  ID10786</p>
            </div>
        </section>

        <!-- Info Cards Section -->
        <section class="cards">
            <div class="card">
                <img src="${pageContext.request.contextPath}/assets/images/first-aid-kit.png" alt="Emergency">
                <h2>Emergency</h2>
                <p class="status">No Emergency</p>
            </div>

            <div class="card">
                <img src="${pageContext.request.contextPath}/assets/images/appointment.png" alt="Appointments">
                <h2>Appointment History</h2>
                <a href="#" class="btn">View</a>
            </div>

            <div class="card">
                <img src="${pageContext.request.contextPath}/assets/images/surg2.png" alt="Surgeries">
                <h2>Surgeries</h2>
                <a href="#" class="btn">View</a>
            </div>
        </section>

        <!-- Lab Reports and Payments -->
        <section class="bottom-section">
            <div class="lab-reports">
                <h2>Requested Lab Reports</h2>
                <ul>
                    <li><a href="#">Blood Test Report</a></li>
                    <li><a href="#">X-Ray Report</a></li>
                    <li><a href="#">MRI Scan Report</a></li>
                    <li><a href="#">ECG Report</a></li>
                    <li><a href="#">Liver Function Test</a></li>
                    <li><a href="#">Kidney Function Test</a></li>
                    <li><a href="#">Cholesterol Test</a></li>
                    <li><a href="#">Diabetes Test Report</a></li>
                    <li><a href="#">Urine Analysis</a></li>
                </ul>
                <a href="#" class="btn upload">Upload Now</a>
            </div>

         
        </section>
    </main>

    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
