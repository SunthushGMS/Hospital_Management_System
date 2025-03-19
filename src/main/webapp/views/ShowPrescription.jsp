<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prescription Sheet | Health Lanka</title>
    <link rel="stylesheet" href="showPrescription.css">
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
    
    <h1 class="head">prescription Sheet</h1>
    <div class="sheet">
        <img src="img/prescription.png" alt="" class="img-icon">
      <p class="details"><strong>Prescription ID</strong> PR0019</p>
      <p class="details"><strong>Date of issue</strong> March 09, 2025</p>
      <p class="details"><strong>Doctor Name</strong> Dr Thinura</p>
      <p class="details"><strong>Department</strong> General Medicicine</p>
      <div class="div-sign">
        <img src="img/signature.png" alt="" class="img-icon2">
        <h3>2025/03/24</h3>
      </div>
    </div>
    <div class="table-medic">
        <table>
            <thead>
                <th>Drug Name</th>
                <th>Dosage</th>
                <th>Frequency</th>
                <th>Duration</th>
                <th>Instruction</th>
            </thead>
            <tr>
                <td>Paracetamol</td>
                <td>500mg</td>
                <td>3 times a day</td>
                <td>5 days</td>
                <td>After meals</td>
            </tr>
            <tr>
                <td>Amoxicillin</td>
                <td>500mg</td>
                <td>3 times a day</td>
                <td>5 days</td>
                <td>After meals</td>
            </tr>
            <tr>
                <td>Vitamin C</td>
                <td>500mg</td>
                <td>3 times a day</td>
                <td>5 days</td>
                <td>After meals</td>
            </tr>
           
        </table>
        <div class="additional-info">
            <img src="img/advice.png" alt="" class="img-icon1">
            <p><strong>Dietary Advice</strong> Avoid spicy food, stay hydrated, eat more fruits.</p>
            <p><strong>Follow-up Date</strong> 2024-04-02</p>
            <p><strong>Doctor’s Notes</strong> Continue medication for the full duration. Contact the clinic if symptoms persist.</p>
        </div>
    </div>
    <button class="btn-download">Download PDF</button>
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
