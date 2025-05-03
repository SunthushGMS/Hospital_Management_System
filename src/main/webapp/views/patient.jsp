<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <section class="sec1">
        <h1 class="head">Patient Portal</h1>
        <img src="${pageContext.request.contextPath}/assets/images/—Pngtree—the doctor examines the patient_5342356.png" alt="" class="img-medic">
    </section>
    <section class="sec2">

        <p class="detail-sec2">
            Streamlining patient billing and appointment management in hospitals and clinics used to be a chaotic ordeal. However, with the introduction of Health Lanka Clinic Management Software, a systematic process has evolved. Notably, this software has minimized paper usage, consolidating essential information in one accessible location. Doctors can effortlessly collaborate with different departments on medical health records. The software’s digital maintenance of prescriptions, bills, and calculations has resulted in significant time savings, enabling doctors to concentrate more on their core activities
        </p>
        <h2 class="intro-sec2">Sri Lankan Leading Clinic Management System</h2>
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
                <h2 class="sec2-head">Medical Records Management</h2>
                <h3 class="points">Stores electronic health records (EHRs) securely for easy access.</h3>
                <h3 class="points">Provides patients with access to their past diagnoses, prescriptions, and test results.
                </h3>
                <h3 class="points">Helps doctors review medical history before consultations.
                </h3>
                <h3 class="points">Reduces paperwork and enhances data accuracy.
                </h3>
                <button class="btn-div" id="btn1"><a href="medicalRecords.html">View Records</a></button>
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
        <h1 class="appoint">Appointments</h1>
        <h2 class="detail-sec2">The Health Lanka Appointment System enables patients to book, manage, and track their medical appointments with ease. Our system allows users to choose their preferred doctor, select a convenient time slot, and receive instant confirmation. With features like automated reminders, rescheduling options, and emergency bookings, we ensure a hassle-free and efficient healthcare experience.</h2>
        <div class="book">
            <form action="" class="book-appoint">
                <h1 class="form-head">Appointment Booking</h1>
                <label for="name" class="label-appoint">Name</label>
                <input type="text" class="input-appoint" name="name" placeholder="SUNTHUSH G M S" required>
                <br>
                <label for="email" class="label-appoint">Email</label>
                <input type="email" class="input-appoint" name="email" placeholder="ABC@gmail.com"required>
                <br>
                <label for="contact" class="label-appoint">Contact</label>
                <input type="tel" class="input-appoint" name="contact" placeholder="07XXXXXXXX" required>
                <br>
                <label for="age" class="label-appoint">Age</label>
                <input type="number" class="input-appoint" name="age" placeholder="20" required>
                <br>
                <label for="gender" class="label-appoint">Gender</label>
                <input type="radio" id="male" name="gender" name="gender" value="Male" required>
                <label for="male">Male</label>

                <input type="radio" id="female" name="gender" name="gender" value="Female" required>
                <label for="female">Female</label>
                <br>
                <br>
                <label for="doctor" class="label-appoint">Select Doctor</label>
                <select name="doctorName" id="doctorName" required>
                    <option value="doc1">Dr Naml Udugama</option>
                    <option value="doc2">Dr Nuwan Thushara</option>
                    <option value="doc3">Dr Shashi Hewage</option>
                    <option value="doc4">Dr Kamal Harshana</option>
                    <option value="doc5">Dr Julia Fernando</option>
                    <option value="doc6">Dr Chamnida Guruge</option>
                    <option value="doc7">Dr Vass Gunawardane</option>
                    <option value="doc8">Dr Harischandra</option>
                </select>
                <br>
                <br>
                <label for="date" class="label-appoint" >Appointment Date</label>
                <input type="date" class="input-appoint" name="date" required>
                <br>
                <label for="reason" class="label-appoint">Reason for visit</label>
                <textarea id="" rows="5" cols="60" name="reason" required></textarea>
                <br>
                <button class="appoint-submit">Submit</button>
            </form>
        </div>
    </section>
    <section class="sec4" id="sec4">
        <h1 class="billing">Billing And Payment</h1>
        <div class="wrap">
            <div class="sub-wrap">
                <h2 class="payment-method">We Accept</h2>
                <img src="${pageContext.request.contextPath}/assets/images/payment.png" alt="" class="payment-img">
            </div>
            <div class="sub-wrap">
                <h2 class="payment-method">Offline Payment</h2>
                <img src="${pageContext.request.contextPath}/assets/images/cash-payment.png" alt="" class="payment-img1">
            </div>
            <div class="sub-wrap">
                <h2 class="payment-method">Bank Transfer</h2>
                <img src="${pageContext.request.contextPath}/assets/images/symbols.png" alt="" class="payment-img1">
            </div>
        </div>
        <button class="view-btn"><a href="paymentHistory.html">View Payment History</a></button>
    </section>
    <section class="sec"></section>
    <section class="payment">
        <h1 class="payment-make">Make Your Payment</h1>
        <form action="" class="payment-form">
            <label for="name">Full Name</label>
            <input type="text" class="input-payment" name="fullname">
            <br>
            <br>
            <label for="id" id="id">Patient ID</label>
            <input type="text" class="input-payment" name="patientID">
            <br>
            <br>
            <label for="phone" id="phone">Phone</label>
            <input type="tel" class="input-payment" name="phone">
            <br>
            <br>
            <label for="email" id="email">Email</label>
            <input type="email" class="input-payment" name="email">
            <br>
            <br>
            <label for="service">Select Service</label>
            <select name="service" id="service" >
                <option value="Vaccination">Vaccination</option>
                <option value="Tests">Diagnostic & Lab Tests</option>
                <option value="Consultation">Consultation</option>
                <option value="HospitalService">Hospital Service</option>
                <option value="Treatments">Medical Procedures & Treatments</option>
                <option value="Medication">Pharmacy & Medication</option>
                <option value="Emergency">Emergency & Ambulance Services</option>
            </select>
            <br>
            <br>
            <label for="price" id="price">Amount</label>
            <input type="number" class="input-payment" name="amount">
            <br>
            <br>
            <button class="pay-btn">Pay Now</button>
        </form>
    </section>
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
