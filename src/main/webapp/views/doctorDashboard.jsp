<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/doctorDashboard.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>
    <h1 id="heading">Doctor Dashboard</h1>


    <img id="doc-profile-Pic" src="${pageContext.request.contextPath}/assets/images/doctorProfile-picNew.jpg" alt="">

        
        <div id="div1">
            <div id="div1sub1">
            <h3>Hello</h3>
            <h3 id="doctordashboardDocName">Dr Sharuka</h3>
            <p>Your schedule for today</p>
            <div id="div1-1">
                <div class="div1-1sub">
                    <br><hr id="myHr"><br>
                    <div class="div1-1-1"><img src="${pageContext.request.contextPath}/assets/images/appointments-pic.jpg" alt=""></div>
                    <div class="div1-1-2">
                        <h3 id="totalAppointmentsToday">17</h3>
                        <p>Appointments</p>
                    </div>
                </div>
                <div class="div1-1sub">
                    <br><hr id="myHr"><br>
                    <div class="div1-1-1"><img src="${pageContext.request.contextPath}/assets/images/surgery-pic.jpg" alt=""></div>
                    <div class="div1-1-2">
                        <h3 id="totalSurgeriesToday">17</h3>
                        <p>Surgeries</p>
                    </div>
                </div>
            </div>
            </div>   
        </div>



    <br>
    <div class="wrapper" >
        <div class="div3">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-raise-hand.png" alt="">
            <h3>Upcoming Appointments</h3>
            <p>Today</p>

            <table>
                <tr>
                    <th>Appointment ID</th>
                    <th>Patient ID</th>
                    <th>Patient Name</th>
                    <th>Time</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>
            </table>
            <a href="appointments.html"><button class="viewAll">View All</button></a>
           
        </div>

        <div class="div3">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-sugery -medical.png" alt="">
            <h3>Upcoming Surgeries</h3>
            <p>This Week</p>
            <table>
                <tr>
                    <th>Appointment ID</th>
                    <th>Patient ID</th>
                    <th>Patient Name</th>
                    <th>Time</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>


                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>10.36 AM</td>
                </tr>

            </table>
            <a href="surgeries.html"><button class="viewAll">View All</button></a>
        </div>


       
    </div><br><br>


    <div  class="wrapper" id="emergencyDiv">
        <div id="emergency-subDiv1">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/emergency -pic.jpg" alt="">
            <h3>Emergency Patients</h3>
            <div id="emergencyPatientDiv">
                <p>You have <span  id="EmergencyPatientCount">  6 </span> new patients</p>
            </div><br>
        </div>
        <div id="emergency-subDiv2">
            <table id="emergencyTable">
                <tr>
                    <th>Emergency ID</th>
                    <th>Patient name</th>
                    <th> Phone</th>
                    <th>Medical Problem</th>
                    <th>severity</th>
                    <th>Description</th>
                    <th>More</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>Anjalee Udara</td>
                    <td>0777383741</td>
                    <td>Neurovascor Repair Surgery</td>
                    <td>60%</td>
                    <td>A high-risk procedure for intervention to prevent stroke or fatal complications.</td>
                    <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a>;</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>Anjalee Udara</td>
                    <td>0777383741</td>
                    <td>Neurovascor Repair Surgery</td>
                    <td>60%</td>
                    <td>A high-risk procedure for intervention to prevent stroke or fatal complications.</td>
                    <td><a href="patientProfile-doctorView.html"><img id="hamburger-Icon" src="${pageContext.request.contextPath}/assets/images/hamburger-icon.png" alt=""></a></td>
                </tr>
            </table>
        </div>
      </div> <br><br>

 

    <div class="wrapper">
        <div class="div4">
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard-apointmentIcon2.png" alt="">
            <h3>New Appointments</h3>
            <table>
                <tr>
                    <th>Profile</th>
                    <th>Appointment ID</th>
                    <th>Patient Name</th>
                    <th>date</th>
                    <th>Time</th>
                </tr>
        
                <tr>
                    <td><img  id="newAppTable-img" src="${pageContext.request.contextPath}/assets/images/profile-pic.png" alt=""></td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>13/03/2025</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td><img  id="newAppTable-img" src="${pageContext.request.contextPath}/assets/images/profile-pic.png" alt=""></td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>13/03/2025</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td><img  id="newAppTable-img" src="${pageContext.request.contextPath}/assets/images/profile-pic.png" alt=""></td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>13/03/2025</td>
                    <td>10.36 AM</td>
                </tr>

                <tr>
                    <td><img  id="newAppTable-img" src="${pageContext.request.contextPath}/assets/images/profile-pic.png" alt=""></td>
                    <td>3</td>
                    <td>Kavindi Perera</td>
                    <td>13/03/2025</td>
                    <td>10.36 AM</td>
                </tr>
            </table>
            <a href="appointments.html"><button class="viewAll">View All</button></a>
        </div>




        <div class="div4"><br>
            <img id="emergency-pic" src="${pageContext.request.contextPath}/assets/images/doctorDashboard--3d-report.png" alt="">
            <h3>Latest Lab Reports</h3>
            <table>
                <tr>
                    <th>Patient Name</th>
                    <th>Report Name</th>
                    <th>Summary</th>
                    <th>View Report</th>
                </tr>
    
                <tr>
                    <td>Kavindi Perera</td>
                    <td>Nerovascor Repair Lab</td>
                    <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
                    <td><img id="labreportsPics" src="${pageContext.request.contextPath}/assets/images/labreports-pic.jpg" alt=""></td>
                </tr>

                <tr>
                    <td>Kavindi Perera</td>
                    <td>Nerovascor Repair Lab</td>
                    <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
                    <td><img id="labreportsPics" src="${pageContext.request.contextPath}/assets/images/labreports-pic.jpg" alt=""></td>
                </tr>

                <tr>
                    <td>Kavindi Perera</td>
                    <td>Nerovascor Repair Lab</td>
                    <td>A high-risk procedure for severe neurovascular damage, requiring urgent intervention to prevent stroke or fatal complications.</td>
                    <td><img id="labreportsPics" src="${pageContext.request.contextPath}/assets/images/labreports-pic.jpg" alt=""></td>
                </tr>
            </table><br>
            <a href="labReports.html"><button class="viewAll">View All</button></a>
        </div>
    </div>
    <br>
    <div class="wrapper">
        <div id="div5"></div>

        <div id="div6"></div>
    </div>
    
    <br>
    
    <jsp:include page="/views/partials/footer.jsp"/>  
</body>
</html>