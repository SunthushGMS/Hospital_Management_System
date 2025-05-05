<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment History | Health Lanka</title>
    <link rel="stylesheet" href="appointHistory.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
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
   <h1 class="history-head">Appointment History</h1>
   <img src="${pageContext.request.contextPath}/assets/images/clock.png" alt="" class="clock-icon">
   <div class="detail-history">
    <p class="history-para">The Appointment History section in Health Lanka allows patients to view and manage their past medical visits. It provides details such as doctor's name, department, date, time, and appointment status (Completed, Cancelled). Patients can easily track their medical records, access prescriptions, and review past consultations, ensuring a seamless healthcare experience.</p>
   </div>
   
   <section class="sec1">
    <div class="table-view">
        <table>
            <tr>
            <th>Appointment ID</th>
            <th>Doctors Name</th>
            
            <th>Date</th>
              <th>Time</th>
            <th>Status</th>
            <th>Action</th>
            <th>Feedback & Rating</th>
            </tr>
            <tr>
                <td>AP001</td>
                <td>Dr Thinura</td>
              
                <td>March 15, 2025 </td>
                <td>10.00 A M </td>
                <td>Completed</td>
                <td><button class="btn btn-view">View Details</button></td>
                <td class="star"><i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                </td>
            </tr>
            <tr>
                <td>AP002</td>
                <td>Dr shashie</td>
               
                <td>March 20, 2025</td>
                 <td>10.00 A M </td>
                <td>Cancelled</td>
                <td>
                    <button class="btn btn-reschedule">Reschedule</button>
                </td>
                <td class="star"><i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i></td>
            </tr>
            <tr>
                <td>AP003</td>
                <td>Dr Michael Smith</td>
                
                <td>March 25, 2025 </td>
                 <td>10.00 A M </td>
                <td>Upcoming</td>
                <td>
                    <button class="btn btn-cancel">Cancel</button>
                </td>
                <td class="star"><i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i>
                    <i class='bx bxs-star'></i></td>
                    </tr>
                    <tr>
                        <td>AP004</td>
                        <td>Dr Chris Bumstead</td>
                    
                        <td>March 08, 2025</td>
                         <td>10.00 A M </td>
                        <td>Upcoming</td>
                        <td>
                            <button class="btn btn-cancel">Cancel</button>
                        </td>
                        <td class="star"><i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i></td>
                            </tr>
                            <tr>
                                <td>AP005</td>
                                <td>Dr Nuwan Thushara</td>
                               
                                <td>March 10, 2025</td>
                                 <td>10.00 A M </td>
                                <td>Cancelled</td>
                                <td>
                                    <button class="btn btn-reschedule">Reschedule</button>
                                </td>
                                <td class="star"><i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i></td>
                            </tr>
                            <tr>
                                <td>AP006</td>
                                <td>Dr Harischandra</td>
                              
                                <td>March 25, 2025</td>
                                 <td>10.00 A M </td>
                                <td>Completed</td>
                                <td><button class="btn btn-view">View Details</button></td>
                                <td class="star"><i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                </td>
                            </tr>
                            
        </table>
        <button class="btn-down">Download PDF</button>

    </div>
   </section>
   <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
