<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Portal | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/patient.css">

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
   
    <div class="flex justify-center bg-gradient-to-br from-blue-100 to-blue-400 min-h-screen items-center overflow-hidden">
		<div class="flex justify-between items-center">
			<div class="ml-20 scroll-animate scroll-animate-left">
				<h4 class="text-6xl font-semibold mb-10 leading-normal">Patient Portal <br>  Connecting People. Enhancing Care.</h4>
				<button class="text-white font-semibold pt-3 pb-3 pr-4 pl-4 text-xl bg-gradient-to-br rounded-lg from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer scroll-animate scroll-animate-up delay-100"><a href="#sec3">Book an appointment</a></button>
			</div>
			<div class="scroll-animate scroll-animate-right delay-200"><img src="${pageContext.request.contextPath}/assets/images/pngegg.png" alt="" class="h-250 w-550"></div>
		</div>
	</div>

        <p class="detail-sec1">
           
        </p>
        
        <div class="wrapper">
            <div class="sub-wrap">
                <img src="${pageContext.request.contextPath}/assets/images/appointment.png" alt="" class="icon-sec2">
                <h2 class="sec2-head">Appointment</h2>
                <h3 class="points">Allows patients to book, reschedule, or cancel appointments online.</h3>
                <h3 class="points">Provides real-time availability of doctors and specialists.</h3>
                <h3 class="points">Sends automated reminders via email or SMS to reduce no-shows.</h3>
                <h3 class="points">Enables doctors to manage their schedules efficiently.</h3>
                <button class="btn-div"><a href="#sec3">Book Appointment</a></button>
            </div>
            <div class="sub-wrap">
                <img src="${pageContext.request.contextPath}/assets/images/bill.png" alt="" class="icon-sec2">
                <h2 class="sec2-head"> Billing & Payments</h2>
                <h3 class="points">Offers a transparent and detailed billing process for patients.</h3>
                <h3 class="points">Supports multiple payment options (credit/debit cards, insurance, online banking).</h3>
                <h3 class="points">Generates automated invoices and tracks payment history.</h3>
                <h3 class="points">Ensures insurance claims are processed seamlessly.</h3>
                <button class="btn-div"><a href="#sec4">Make Payment</a></button>
            </div>
            <div class="sub-wrap">
                <img src="${pageContext.request.contextPath}/assets/images/health-report.png" alt="" class="icon-sec2">
                <h2 class="sec2-head">Medical Records </h2>
                <h3 class="points">Stores electronic health records (EHRs) securely for easy access.</h3>
                <h3 class="points">Provides patients with access to their past diagnoses, prescriptions, and test results.
                </h3>
                <h3 class="points">Helps doctors review medical history before consultations.
                </h3>
                <h3 class="points">Reduces paperwork and enhances data accuracy.
                </h3>
                <button class="btn-div" ><a href="medicalRecords.html">View Records</a></button>
            </div>
            <div class="sub-wrap">
                <img src="${pageContext.request.contextPath}/assets/images/encrypted.png" alt="" class="icon-sec2">
                <h2 class="sec2-head">Security & Data Protection</h2>
                <h3 class="points">Uses encryption and secure login mechanisms to protect sensitive data.
                </h3>
                <h3 class="points">Implements role-based access control to restrict unauthorized access.
                </h3>
                <h3 class="points">Ensures HIPAA/GDPR compliance for data privacy and security.
                </h3>
                <h3 class="points">Regular data backups prevent loss in case of system failure.
                </h3>
                <button class="btn-div"><a href="Security.html">View Security Options</a></button>
            </div>

        </div>
    </section>
    <section class="sec3" id="sec3">
       
      
        <div class="book">
        <form action="${pageContext.request.contextPath}/AppointmentBookingController" method="post" class="book-appoint">
    <h1 class="form-head">Appointment Booking</h1><br><br>


    <input type="hidden" name="appointmentId" value="${param.id}" />
    <input type="hidden" name="patientId" value="${sessionScope.patientId}" />

    <label for="doctorId" class="label-appoint">Select Doctor</label>
    <select name="doctorId" id="doctorId" required>
        <option value="1" ${param.doctorId == '1' ? 'selected' : ''}>Dr Naml Udugama</option>
        <option value="2" ${param.doctorId == '2' ? 'selected' : ''}>Dr Nuwan Thushara</option>
        <option value="3" ${param.doctorId == '3' ? 'selected' : ''}>Dr Shashi Hewage</option>
        <option value="4" ${param.doctorId == '4' ? 'selected' : ''}>Dr Kamal Harshana</option>
        <option value="5" ${param.doctorId == '5' ? 'selected' : ''}>Dr Julia Fernando</option>
        <option value="6" ${param.doctorId == '6' ? 'selected' : ''}>Dr Chamnida Guruge</option>
        <option value="7" ${param.doctorId == '7' ? 'selected' : ''}>Dr Vass Gunawardane</option>
        <option value="8" ${param.doctorId == '8' ? 'selected' : ''}>Dr Harischandra</option>
    </select><br><br>

    <label for="date" class="label-appoint">Appointment Date</label>
    <input type="date" class="input-appoint" name="date" value="${param.date}" required><br>

    <label for="time" class="label-appoint">Time</label>
    <input type="time" class="input-appoint" name="time" value="${param.time}" required><br>

    <button class="appoint-submit" type="submit">Submit</button>
</form>


<c:if test="${not empty param.success}">
    <p style="color: green;">${param.success}</p>
</c:if>

<c:if test="${not empty param.error}">
    <p style="color: red;">${param.error}</p>
</c:if>



            
        </div>
    </section>
    <section class="sec4" id="sec4">
        <h1 class="billing">Billing And Payment</h1>
        <div class="wrap">
            <div class="sub-wrap">
                <h2 class="payment-method">We Accept</h2>
                <img src="${pageContext.request.contextPath}/assets/images/atm-card.png" alt="" class="payment-img">
            </div>
            <div class="sub-wrap">
                <h2 class="payment-method">Offline Payment</h2>
                <img src="${pageContext.request.contextPath}/assets/images/cash-payment.png" alt="" class="payment-img">
            </div>
            <div class="sub-wrap">
                <h2 class="payment-method">Bank Transfer</h2>
                <img src="${pageContext.request.contextPath}/assets/images/symbols.png" alt="" class="payment-img">
            </div>
        </div>
        <button class="view-btn"><a href="${pageContext.request.contextPath}/PaymentHistory">View Payment History</a></button>
    </section>
    <section class="sec"></section>
    <section class="payment">
        <h1 class="payment-make">Make Your Payment</h1>
        
       <form action="${pageContext.request.contextPath}/PaymentMaking" method="post" class="payment-form">
    <label for="name">Full Name</label>
    <input type="text" class="input-payment" name="fullname" required>
    <br><br>

    <label for="id">Patient ID</label>
    <input type="text" class="input-payment" name="patientID" required>
    <br><br>

    <label for="phone">Phone</label>
    <input type="tel" class="input-payment" name="phone" required>
    <br><br>

    <label for="email">Email</label>
    <input type="email" class="input-payment" name="email" required>
    <br><br>

    <label for="service">Select Service</label>
    <select name="service" id="service" required>
        <option value="Vaccination">Vaccination</option>
        <option value="Tests">Diagnostic & Lab Tests</option>
        <option value="Consultation">Consultation</option>
        <option value="HospitalService">Hospital Service</option>
        <option value="Treatments">Medical Procedures & Treatments</option>
        <option value="Medication">Pharmacy & Medication</option>
        <option value="Emergency">Emergency & Ambulance Services</option>
    </select>
    <br><br>

    <label for="price">Amount</label>
    <input type="number" class="input-payment" name="amount" required>
    <br><br>

    <button class="pay-btn" type="submit">Pay Now</button>

</form>


    </section>
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
