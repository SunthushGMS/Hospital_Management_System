<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prescription History Of This Patient | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
    
    <style>
    body {
    font-family: 'Roboto', sans-serif;
    background-color: #f9fafb;
    margin: 0;
    padding: 0;
    color: #1f2937;
}

.history-head {
    text-align: center;
    font-size: 2.5rem;
    font-weight: bold;
    margin-top: 2rem;
    color: #1f2937;
}

.sec1 {
    padding: 2rem 5%;
}

.table-view {
    display: flex;
    flex-direction: column;
    gap: 2rem;
}

.prescription-block {
    background-color: #ffffff;
    border-left: 6px solid #22c55e;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    padding: 1.5rem;
    border-radius: 0.5rem;
    transition: transform 0.3s ease;
}

.prescription-block:hover {
    transform: translateY(-5px);
}

.prescription-block h2 {
    color: #16a34a;
}

.drug-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
}

.drug-table th, .drug-table td {
    border: 1px solid #e5e7eb;
    padding: 0.75rem;
    text-align: left;
    font-size: 0.95rem;
}

.drug-table th {
    background-color: #f3f4f6;
    font-weight: bold;
    color: #374151;
}

.drug-table td {
    background-color: #ffffff;
    color: #4b5563;
}

form {
    margin-top: 1rem;
    display: inline-block;
}

button {
    background-color: #3b82f6;
    color: #ffffff;
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 0.375rem;
    cursor: pointer;
    font-weight: 500;
    margin-right: 1rem;
    transition: background-color 0.2s ease-in-out;
}

button:hover {
    background-color: #2563eb;
}

    </style>
</head>
<body>

<jsp:include page="/views/partials/header.jsp"/>

<h1 class="history-head">Prescription History Of This Patient</h1>

<section class="sec1">
    <div class="table-view">

        <c:if test="${not empty prescriptions}">
            <c:forEach var="prescription" items="${prescriptions}">
                <div class="prescription-block mb-6 border p-4 rounded-lg bg-white shadow-sm">

                    <h2 class="font-bold text-lg mb-2">Prescription ID: ${prescription.id}</h2>
                    <p><strong>Date of Issue:</strong> ${prescription.date_of_issue}</p>

                    <h3 class="mt-4 font-semibold">Prescribed Drugs</h3>

                    <c:set var="drugList" value="${drugMap[prescription.id]}" />

                    <c:if test="${not empty drugList}">
                        <table class="drug-table mt-2">
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
                                <c:forEach var="drug" items="${drugList}">
                                    <tr>
                                        <td>${drug.drugName}</td>
                                        <td>${drug.dosage}</td>
                                        <td>${drug.frequency}</td>
                                        <td>${drug.duration}</td>
                                        <td>${drug.instruction}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>

                    <c:if test="${empty drugList}">
                        <p>No drugs added to this prescription.</p>
                    </c:if>

                    <div class="mt-4">
                        <p><strong>Dietary Advice:</strong> ${prescription.dietary_advice}</p>
                        <p><strong>Doctor's Notes:</strong> ${prescription.doctors_notes}</p>
                    </div>
					<form action="${pageContext.request.contextPath}/updatePrescriptionController" method="post">
					    <input type="hidden" name="prescriptionId" value="${prescription.id}" />
					    <button type="submit" name="action" value="update">Update this prescription</button>
					</form>
					<form action="${pageContext.request.contextPath}/updatePrescriptionController" method="post">
					    <input type="hidden" name="prescriptionId" value="${prescription.id}" />
					    <button type="submit" name="action" value="delete">Delete this prescription</button>
					</form>


                </div>
            </c:forEach>
        </c:if>

        <c:if test="${empty prescriptions}">
            <p>No prescriptions found for this doctor.</p>
        </c:if>

    </div>
</section>

<jsp:include page="/views/partials/footer.jsp"/>

</body>
</html>
