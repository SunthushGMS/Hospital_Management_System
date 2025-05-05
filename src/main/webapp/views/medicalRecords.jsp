<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Records | Health Lanka</title>
    <link rel="stylesheet" href="MedicalRecords.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/MedicalRecords.css">
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
   
        <div class="patient-info" >
            <h3 class="head2">Patient Information</h3>
            <img src="${pageContext.request.contextPath}/assets/images/newPatient.png" alt="" class="icon-img">
            <p><strong>Name</strong> Ruwan Perera</p>
            <p><strong>Age</strong> 35</p>
            <p><strong>Gender</strong> Male</p>
            <p><strong>Contact</strong> +94 77 123 4567</p>
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
            <button class="btn-search">Search</button>
        </div>
       
        <h3 class="head2">Upload Medical Records</h3>
  


    <c:if test="${not empty param.success}">
        <p class="message" style="color:green;">${param.success}</p>
    </c:if>
    <c:if test="${not empty param.error}">
        <p class="message">${param.error}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/LabReportUpload" method="post" enctype="multipart/form-data">
     
        <input type="hidden" name="patientId" value="${sessionScope.loggedUser.uid}" />

        <div class="form-group">
            <label for="doctorId">Select Doctor</label>
            <select name="doctorId" required>
                <option value="">-- Select Doctor --</option>
                <option value="1">Dr. Naml Udugama</option>
                <option value="2">Dr. Nuwan Thushara</option>
                <option value="3">Dr. Shashi Hewage</option>
                <!-- Add more as needed -->
            </select>
        </div>

        <div class="form-group">
            <label for="name">Report Name</label>
            <input type="text" name="name" placeholder="E.g., Blood Test Report" required>
        </div>

        <div class="form-group">
            <label for="department">Department</label>
            <input type="text" name="department" placeholder="E.g., Hematology" required>
        </div>

        <div class="form-group">
            <label for="document">Upload Report File</label>
            <input type="file" name="document" accept=".pdf,.doc,.docx,.jpg,.png" required>
        </div>

        <div class="form-group">
            <label for="summary">Summary</label>
            <input type="text" name="summary" placeholder="Short summary of the report" required>
        </div>

        <div class="form-group">
            <label for="description">Full Description</label>
            <textarea name="description" placeholder="Detailed description about the lab report..." required></textarea>
        </div>

        <button type="submit" class="submit-btn">Submit Report</button>
    </form>



        
    
        <jsp:include page="/views/partials/footer.jsp"/>
    
   
</body>
</html>
