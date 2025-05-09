<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.Drug" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prescription | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">

    <!-- jsPDF + autoTable -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
</head>
<body>

<jsp:include page="/views/partials/header.jsp"/>

 <title>View Prescription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            margin-bottom: 30px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #e9ecef;
        }
        .notes-section {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
        }
        .notes-section h2 {
            margin-top: 0;
        }
        .notes-section p {
            margin: 10px 0;
        }
    </style>
</head>
<body>

<%
    ArrayList<Drug> drugList = (ArrayList<Drug>) session.getAttribute("drugList");
    Integer patientId = (Integer) session.getAttribute("patientId");
    String dietaryAdvice = "Drink plenty of water, avoid fatty foods, and follow a high-fiber diet.";
    String doctorNotes = "Patient to rest for 3 days. Monitor response to medication and follow up next week.";
%>

<h1>Prescription Details for Patient ID: <%= patientId %></h1>

<% if (drugList != null && !drugList.isEmpty()) { %>
    <table>
        <thead>
            <tr>
                <th>Drug Name</th>
                <th>Dosage</th>
                <th>Frequency</th>
                <th>Duration</th>
                <th>Instructions</th>
            </tr>
        </thead>
        <tbody>
        <% for (Drug drug : drugList) { %>
            <tr>
                <td><%= drug.getDrugName() %></td>
                <td><%= drug.getDosage() %></td>
                <td><%= drug.getFrequency() %></td>
                <td><%= drug.getDuration() %></td>
                <td><%= drug.getInstruction() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>No drugs have been prescribed yet.</p>
<% } %>

<div class="notes-section">
    <h2>Dietary Advice</h2>
    <p><%= dietaryAdvice %></p>

    <h2>Doctor’s Notes</h2>
    <p><%= doctorNotes %></p>
</div>

</body>
</html>
