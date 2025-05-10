<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Prescription, com.model.Drug, java.util.List" %>
<%
    Prescription prescription = (Prescription) request.getAttribute("prescription");
    List<Drug> drugList = (List<Drug>) request.getAttribute("drugList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prescription Sheet | Health Lanka</title>
    <link rel="stylesheet" href="showPrescription.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/showPrescription.css">
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

    <h1 class="head">Prescription Sheet</h1>

    <% if (prescription != null) { %>
        <div class="sheet">
            <img src="${pageContext.request.contextPath}/assets/images/prescription.png" class="img-icon">
            <p class="details"><strong>Prescription ID:</strong> PR00<%=prescription.getId()%></p>
            <p class="details"><strong>Date of Issue:</strong> <%=prescription.getDate_of_issue()%></p>
            <p class="details"><strong>Doctor ID:</strong> Dr <%=prescription.getDoctor_id()%></p>
            

            <div class="div-sign">
                <img src="${pageContext.request.contextPath}/assets/images/signature.png" class="img-icon2">
                <h3><%=prescription.getDate_of_issue()%></h3>
            </div>
        </div>
<p><strong>Patient ID:</strong> PT00<%=prescription.getPatient_id()%></p>

        <div class="table-medic">
            <table>
                <thead>
                    <tr>
                        <th>Drug Name</th>
                        <th>Dosage</th>
                        <th>Frequency</th>
                        <th>Duration</th>
                        <th>Instruction</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (drugList != null && !drugList.isEmpty()) {
                        for (Drug drug : drugList) { %>
                        <tr>
                            <td><%=drug.getDrugName()%></td>
                            <td><%=drug.getDosage()%></td>
                            <td><%=drug.getFrequency()%></td>
                            <td><%=drug.getDuration()%></td>
                            <td><%=drug.getInstruction()%></td>
                        </tr>
                    <% } 
                    } else { %>
                        <tr>
                            <td colspan="5">No drugs found for this prescription.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <div class="additional-info">
                <img src="${pageContext.request.contextPath}/assets/images/advice.png" class="img-icon1">
                <p><strong>Dietary Advice:</strong> <%=prescription.getDietary_advice()%></p>
              
                <p><strong>Doctor’s Notes:</strong> <%=prescription.getDoctors_notes()%></p>
            </div>
        </div>

        <button class="btn-download">Download PDF</button>
    <% } else { %>
        <div class="error-msg">
            <p>⚠️ Prescription not found or could not be loaded.</p>
        </div>
    <% } %>

    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
