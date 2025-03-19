<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/about.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>
    
    <jsp:include page="/views/partials/header.jsp"/>
    <section class="why">
        <h1 class="head2">Why Health Lanka ?</h1>
        <div class="wrapper">
        <div class="sec1">
            <h2 class="subhead1"> Efficient Patient Management</h2>
            <p class="para1">
                Easily store and access patient records, history, and reports
            </p>
            <img src="${pageContext.request.contextPath}/assets/images/patient.png" alt="" class="imgSec">
        </div>
        <div class="sec1">
            <h2 class="subhead1"> Appointment Scheduling</h2>
            <p class="para1">
                Hassle-free online appointment booking and scheduling.
            </p>
            <img src="${pageContext.request.contextPath}/assets/images/appoint.png" alt="" class="imgSec" id="imgSec2">
        </div>
        <div class="sec1">
            <h2 class="subhead1">Doctor & Staff Coordination</h2>
            <p class="para1">
                Connects doctors, nurses, and administrative staff for smooth operations.
            </p>
            <img src="${pageContext.request.contextPath}/assets/images/doctors.png" alt="" class="imgSec">
        </div>
        <div class="sec1">
            <h2 class="subhead1"> Inventory & Pharmacy Management</h2>
            <p class="para1">
                HIPAA-compliant secure patient data management.
            </p>
            <img src="${pageContext.request.contextPath}/assets/images/invent.png" alt="" class="imgSec" id="imgSec2">
        </div>
        <div class="sec1">
            <h2 class="subhead1"> Reports & Analytics</h2>
            <p class="para1">
                Generates insights for hospital performance and patient care trends.
            </p>
            <img src="${pageContext.request.contextPath}/assets/images/report.png" alt="" class="imgSec" id="imgSec3">
        </div>
    </div>
    </section>
    <section class="sec2">
        <h1 class="head2">HIPAA Cloud Hosted, Trusted, Provider Focused Platform</h1>
        <div class="wrapper2">
        <div class="secStat">
            <h1 class="sec2-Head">2000 +</h1>
            <h2 class="sec2-Subhead">
                Doctors and growing!
            </h2>
        </div>
        <div class="secStat">
            <h1 class="sec2-Head">300 +</h1>
            <h2 class="sec2-Subhead">
                Global Clients from Asia, Africa, Middle East
            </h2>
        </div>
        <div class="secStat">
            <h1 class="sec2-Head">5M +</h1>
            <h2 class="sec2-Subhead">
                Appointment,Clinics And Records Handled Annually
            </h2>
        </div>
    </div>
    </section>
    <section class="sec3">
        <h1 class="head2">Our Facilities</h1>
        <div class="sec3-sub">
            <div class="sec3-img">
                <img src="${pageContext.request.contextPath}/assets/images/software.png" alt="" class="imgSec">
            </div>
            <div class="sec3-sol">
                <h1 class="subhead1">Hospital Application Software</h1>
                <p class="para2">Our Hospital Management Software streamlines patient care, administration, billing, and records management, ensuring efficient hospital operations. </p>
                <button class="click-Here">Click here</button>
            </div>
        </div>
        <div class="sec3-sub">
            <div class="sec3-sol" id="left-sub">
                <h1 class="subhead1">Medical Management Software</h1>
                <p class="para2">Our Medical Management Software optimizes patient records, appointments, billing, and inventory, enhancing workflow for healthcare providers. </p>
                <button class="click-Here">Click here</button>
            </div>
            <div>
                <img src="${pageContext.request.contextPath}/assets/images/medic.png" alt=""  id="right-img">
            </div>
        </div>
        <div class="sec3-sub">
            <div>
                <img src="${pageContext.request.contextPath}/assets/images/clinic.png" alt="" class="imgSec" id="left-img">
            </div>
            <div class="sec3-sol">
                <h1 class="subhead1">Our Clinic Management Software</h1>
                <p class="para2">Our Clinic Management Software simplifies appointments, patient records, billing, and administration, ensuring smooth operations and better patient care. </p>
                <button class="click-Here">Click here</button>
            </div>
        </div>
    </section>
    <section class="sec4">
        <h1 class="head2">Latest Events</h1>
        <div class="events-wrapper">
            <div class="events">
                <div class="event-sub">
                    <h2 class="event-heading">Annual Donation Program</h2>
                    <img src="${pageContext.request.contextPath}/assets/images/donation.jpg" alt="donation" class="sec4-img">
                    <p class="event-para"><span>Charity Donation Event  April 20, 2025</span><br><br>
                        Join us on April 20, 2025, for our Charity Donation Event, dedicated to supporting those in need. Together, we can make a difference by providing essential resources and spreading hope. Your generosity changes lives.</p>
                    <button class="btn-learn">Learn more</button>
                </div>
                <div class="event-sub">
                    <h2 class="event-heading">Free Medical Camp</h2>
                    <img src="${pageContext.request.contextPath}/assets/images/medicamp.jpg" alt="donation" class="sec4-img">
                    <p class="event-para"><span> Lanka Medical Camp June 21, 2025</span><br><br> We are organizing a Free Medical Camp to provide essential healthcare services to underserved communities. This event includes free health check-ups, doctor consultations, basic treatments, and medicine distribution to ensure everyone gets access to quality medical care.</p>
                    <button id="btn-learn1">Learn more</button>
                </div>
                <div class="event-sub">
                    <h2 class="event-heading">Blood Donation Drive</h2>
                    <img src="${pageContext.request.contextPath}/assets/images/blooddonation.jpg" alt="donation" class="sec4-img">
                    <p class="event-para"><span>Support Lanka Blood Donation May 19, 2025</span><br><br>Join us in our Blood Donation Drive to save lives. This event encourages volunteers to donate blood, helping hospitals and clinics maintain an adequate blood supply for emergency treatments, surgeries, and critical care patients.</p>
                    <button class="btn-learn">Learn more</button>
                </div>
            
            </div>
        </div>
    </section>
    
    <section class="sec5">
        <h1 class="head2">Reviews And Feedbacks</h1>
        <div class="review-sec">
            <div class="review-set">
                <img src="${pageContext.request.contextPath}/assets/images/priya2.jpg" alt="" class="rev-img">
                <h2 class="rev-name">Dr Priya Fernando</h2>
                <div class="star">
                <i class='bx bxs-star'></i>
                <i class='bx bxs-star'></i>
                <i class='bx bxs-star'></i>
                <i class='bx bxs-star'></i>
                </div>
                <p class="rev-detail">“The Hospital Management System has been a game-changer for us. The user-friendly interface and seamless integration have significantly improved our workflow. From patient management to billing, everything is well-organized and efficient. It has helped us deliver better patient care and manage hospital operations more effectively. Highly recommended for any healthcare facility!”</p>
            </div>
            <div class="review-set">
                <img src="${pageContext.request.contextPath}/assets/images/nuwan.jpg" alt="" class="rev-img">
                <h2 class="rev-name">Dr Nuwan Perera</h2>
                <div class="star">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    </div>
                <p class="rev-detail">“The efficiency of this Hospital Management System is impressive. It has drastically reduced administrative errors and improved our patient scheduling and billing processes. The customer support is outstanding, always ready to assist whenever needed. I’m very pleased with the results.”</p>
            </div>
            <div class="review-set">
                <img src="${pageContext.request.contextPath}/assets/images/shashi.jpg" alt="" class="rev-img">
                <h2 class="rev-name">Dr Shashi Wikramasinghe</h2>
                <div class="star">
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    </div>
                <p class="rev-detail">“Managing patient data used to be a challenge, but this system has simplified everything. I can now access medical records quickly, which has improved both the quality of care and our operational efficiency. It’s an essential tool for modern healthcare.”</p>
            </div>
        </div>
    </section>
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
