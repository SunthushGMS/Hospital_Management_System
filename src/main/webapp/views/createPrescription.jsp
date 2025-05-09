<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Drug" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Prescription | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/createPrescriptions.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
</head>
<body>

<%
    int patientId = (int) request.getAttribute("patientId");
    ArrayList<Drug> drugList = (ArrayList<Drug>) session.getAttribute("drugList");
    if (drugList == null) {
        drugList = new ArrayList<>();
    }
%>

<jsp:include page="/views/partials/header.jsp"/>
<h1 id="heading">Create Prescription for Patient ID: <%= patientId %></h1>

<div id="wrapper">

    <!-- Add Drug Form -->
    <div id="div1">
        <form action="${pageContext.request.contextPath}/PrescriptionController" method="post">
            <input type="hidden" name="action" value="addDrug">
            <input type="hidden" name="patientId" value="<%= patientId %>">

            <label for="drug-name">Drug Name:</label><br>
            <input type="text" id="drug-name" name="drug-name" required><br><br>

            <label for="dosage">Dosage:</label><br>
            <input type="text" id="dosage" name="dosage" required><br><br>

            <label for="frequancy">Frequency:</label><br>
            <input type="text" id="frequancy" name="frequancy" required><br><br>

            <label for="duration">Duration:</label><br>
            <input type="text" id="duration" name="duration" required><br><br>

            <label for="instruction">Instructions:</label><br>
            <input type="text" id="instruction" name="instruction" required><br><br>

            <button type="submit">Add Drug</button>
        </form>
    </div>

    <!-- Final Prescription Form -->
    <div id="div1">
        <form action="${pageContext.request.contextPath}/PrescriptionController" method="post">
            <input type="hidden" name="action" value="finalizePrescription">
            <input type="hidden" name="patientId" value="<%= patientId %>">

            <label for="dietaryAdvice">Dietary Advice:</label><br>
            <textarea name="dietaryAdvice" rows="4" cols="50" required></textarea><br><br>

            <label for="doctorsNote">Doctor's Note:</label><br>
            <textarea name="doctorsNote" rows="4" cols="50" required></textarea><br><br>

            <button type="submit" class="submit-btn" style="padding: 20px; margin-left:25%; width: 50%;">Send Prescription</button>
        </form>
    </div>
</div>

<br><br>
<h3>Current Drugs in Prescription</h3>
<table border="1">
    <tr>
        <th>Drug ID</th>
        <th>Drug Name</th>
        <th>Dosage</th>
        <th>Frequency</th>
        <th>Duration</th>
        <th>Instruction</th>
    </tr>
    <% for (Drug drug : drugList) { %>
    <tr>
        <td><%= drug.getDrugId() %></td>
        <td><%= drug.getDrugName() %></td>
        <td><%= drug.getDosage() %></td>
        <td><%= drug.getFrequency() %></td>
        <td><%= drug.getDuration() %></td>
        <td><%= drug.getInstruction() %></td>
    </tr>
    <% } %>
</table>

<br><br>
<jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
