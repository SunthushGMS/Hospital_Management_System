<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prescription Details | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
</head>
<body>

<jsp:include page="/views/partials/header.jsp"/>

<h1 class="history-head">Prescription Details</h1>

<section class="sec1">
    <div class="table-view">

        <c:if test="${not empty prescription}">
            <div class="prescription-info">
                <p><strong>Prescription ID:</strong> RX00${prescription.id}</p>
                <p><strong>Date Issued:</strong> ${prescription.date_of_issue}</p>
                <p><strong>Doctor ID:</strong> DR00${prescription.doctor_id}</p>
                <p><strong>Patient ID:</strong> PT00${prescription.patient_id}</p>
            </div>

            <h2 class="mt-4 mb-2 font-semibold">Prescribed Drugs</h2>

            <c:if test="${not empty drugList}">
                <table>
                        <tr>
                            <th>Drug Name</th>
                            <th>Dosage</th>
                            <th>Frequency</th>
                            <th>Duration</th>
                            <th>Instructions</th>
                        </tr>
                        <c:forEach var="drug" items="${drugList}">
                            <tr>
                                <td>${drug.drugName}</td>
                                <td>${drug.dosage}</td>
                                <td>${drug.frequency}</td>
                                <td>${drug.duration}</td>
                                <td>${drug.instruction}</td>
                            </tr>
                        </c:forEach>
                </table>
            </c:if>

            <c:if test="${empty drugList}">
                <p>No drugs added to this prescription.</p>
            </c:if>

            <div class="mt-4">
                <p><strong>Dietary Advice:</strong> ${prescription.dietary_advice}</p>
                <p><strong>Doctor's Notes:</strong> ${prescription.doctors_notes}</p>
            </div>

            <button onclick="exportPrescriptionToPDF()" class="btn-down mt-4"><i class='bx bx-download'></i> Download PDF</button>
        </c:if>

        <c:if test="${empty prescription}">
            <p>No prescription found for the given ID.</p>
        </c:if>

    </div>
</section>

<script>
    async function exportPrescriptionToPDF() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        doc.setFontSize(16);
        doc.text("Prescription Details", 14, 15);

        const meta = [
            ["Prescription ID", "RX00${prescription.id}"],
            ["Date Issued", "${prescription.date_of_issue}"],
            ["Doctor ID", "DR00${prescription.doctor_id}"],
            ["Patient ID", "PT00${prescription.patient_id}"],
        ];

        doc.autoTable({
            head: [["Field", "Value"]],
            body: meta,
            startY: 25
        });

        const drugTableY = doc.lastAutoTable.finalY + 10;
        const drugHeaders = ["Drug Name", "Dosage", "Frequency", "Duration", "Instructions"];
        const drugRows = [
            <c:forEach var="drug" items="${drugList}">
                ["${drug.drugName}", "${drug.dosage}", "${drug.frequency}", "${drug.duration}", "${drug.instruction}"],
            </c:forEach>
        ];

        doc.autoTable({
            head: [drugHeaders],
            body: drugRows,
            startY: drugTableY
        });

        const notesY = doc.lastAutoTable.finalY + 10;
        doc.text(`Dietary Advice: ${prescription.dietary_advice}`, 14, notesY);
        doc.text(`Doctor's Notes: ${prescription.doctors_notes}`, 14, notesY + 10);

        doc.save("Prescription_RX00${prescription.id}.pdf");
    }
</script>

<jsp:include page="/views/partials/footer.jsp"/>

</body>
</html>
