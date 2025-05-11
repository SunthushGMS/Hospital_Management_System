<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Prescription  | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>


	<style>
		/* updatePrescription.css */

body {
    font-family: 'Roboto', sans-serif;
    background-color: #f9fafb;
    margin: 0;
    padding: 0;
}

h1 {
    text-align: center;
    margin: 30px 0;
    font-size: 2rem;
    color: #1f2937;
}

form {
    max-width: 800px;
    margin: 0 auto;
    padding: 30px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-top: 20px;
    font-weight: 500;
    color: #374151;
}

input[type="text"],
textarea {
    width: 100%;
    padding: 10px 12px;
    margin-top: 8px;
    border: 1px solid #d1d5db;
    border-radius: 6px;
    font-size: 1rem;
    background-color: #fefefe;
    box-sizing: border-box;
}

textarea {
    resize: vertical;
    min-height: 100px;
}

fieldset {
    border: 1px solid #d1d5db;
    border-radius: 6px;
    padding: 20px;
    margin-bottom: 20px;
    background-color: #f3f4f6;
}

legend {
    padding: 0 10px;
    font-weight: bold;
    color: #1d4ed8;
}

button[type="submit"] {
    display: block;
    margin: 30px auto 0;
    padding: 12px 24px;
    background-color: #10b981;
    color: white;
    font-size: 1rem;
    font-weight: bold;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: #059669;
}
		
	
	</style>

</head>
<body>

<jsp:include page="/views/partials/header.jsp"/>

<h1>Update Prescription</h1>

<form action="${pageContext.request.contextPath}/UpdatePrescription" method="post">
    <input type="hidden" name="action" value="save">
    <input type="hidden" name="prescriptionId" value="${prescription.id}">

    <!-- Inputs for date, advice, notes -->
    <label for="dietary_advice">Dietary Advice:</label>
    <input type="text" id="dietary_advice" name="dietary_advice" value="${prescription.dietary_advice}"><br>

    <label for="doctors_notes">Doctor's Notes:</label>
    <textarea id="doctors_notes" name="doctors_notes">${prescription.doctors_notes}</textarea><br>

    <!-- Loop through drugs -->
    <c:forEach var="drug" items="${drugs}" varStatus="status">
        <fieldset>
            <legend>Drug ${status.index + 1}</legend>
            <input type="hidden" name="drugId" value="${drug.drugId}">
            <label for="drugName${status.index}">Drug Name:</label>
            <input type="text" id="drugName${status.index}" name="drugName" value="${drug.drugName}"><br>

            <label for="dosage${status.index}">Dosage:</label>
            <input type="text" id="dosage${status.index}" name="dosage" value="${drug.dosage}"><br>

            <label for="frequency${status.index}">Frequency:</label>
            <input type="text" id="frequency${status.index}" name="frequency" value="${drug.frequency}"><br>

            <label for="duration${status.index}">Duration:</label>
            <input type="text" id="duration${status.index}" name="duration" value="${drug.duration}"><br>

            <label for="instruction${status.index}">Instruction:</label>
            <input type="text" id="instruction${status.index}" name="instruction" value="${drug.instruction}"><br>
        </fieldset>
        <br>
    </c:forEach>

    <button type="submit" name="action" value="save">Save Changes</button>
</form>

<jsp:include page="/views/partials/footer.jsp"/>

</body>
</html>
