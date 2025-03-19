<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Records | Health Lanka</title>
    <link rel="stylesheet" href="MedicalRecords.css">
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
    <h2 class="head1">Medical Records Management</h2>
    <div class="container">
        <div class="patient-info" >
            <h3 class="head2">Patient Information</h3>
            <img src="img/newPatient.png" alt="" class="icon-img">
            <p><strong>Name</strong> Ruwan Perera</p>
            <p><strong>Age</strong> 35</p>
            <p><strong>Gender</strong> Male</p>
            <p><strong>Contact</strong> +94 77 123 4567</p>
            <p><strong>Emergency Contact</strong> +94 77 987 6543</p>
        </div>
        <div class="patient-info" >
            <h3 class="head2">Medical History</h3>
            <img src="img/folder.png" alt="" class="icon-img">
            <p><strong>Past Diagnoses</strong> Hypertension, Diabetes</p>
            <p><strong>Surgeries</strong> Knee Surgery (2022)</p>
            <p><strong>Allergies</strong> Penicillin</p>
            <p><strong>Chronic Conditions</strong> High Blood Pressure</p>
        </div>
        <div class="patient-info" >
            <h3 class="head2">Immunization Records </h3>
            <img src="img/folder.png" alt="" class="icon-img">
            <h2 class="head3">Vaccination Info</h2>
            <button class="nav-vaccinate">View</button>

        </div>
    </div>
     
        <h3 class="head2">Lab Reports & Test Results</h3>
        <table>
            <thead>
                <tr>
                    <th>Test Name</th>
                    <th>Date</th>
                    <th>Doctor</th>
                    <th>Result</th>
                    <th>Download PDF</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Blood Test</td>
                    <td>March 10, 2025</td>
                    <td>Dr Harischandra</td>
                    <td>Normal</td>
                    <td><button class="btn-download">Download</button></td>
                </tr>
                <tr>
                    <td>X-Ray</td>
                    <td>March 15, 2025</td>
                    <td>Dr Kamal</td>
                    <td>Minor Fracture</td>
                    <td><button class="btn-download">Download</button></td>
                </tr>
            </tbody>
        </table>
        <div class="search">
            <h3 class="sub-head">Search & Filter</h3>
            <input type="text" id="search" placeholder="Search records by date, doctor, or test type...">
        </div>
       
        <h3 class="head2">Upload Medical Records</h3>
        <form>
            <input type="file" id="uploadFile" class="input-form">
            <button class="btn-upload">Upload</button>
        </form>

        
    
        <jsp:include page="/views/partials/footer.jsp"/>
    
   
</body>
</html>
