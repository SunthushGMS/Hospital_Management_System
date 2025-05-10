<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prescription | Health Lanka</title>
</head>
<body>

<h1>Prescription Details</h1>

<c:if test="${not empty drugList}">
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
    <p>No drug details available.</p>
</c:if>

<div>
    <h2>Dietary Advice</h2>
    <p>${dietaryAdvice}</p>

    <h2>Doctor's Notes</h2>
    <p>${doctorNotes}</p>
</div>

<button onclick="exportToPDF()">Download PDF</button>

<script>
    async function exportToPDF() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        const headers = ["Drug Name", "Dosage", "Frequency", "Duration", "Instructions"];
        const rows = [];

        document.querySelectorAll("table tbody tr").forEach((tr) => {
            const row = [];
            tr.querySelectorAll("td").forEach((td) => {
                row.push(td.innerText);
            });
            rows.push(row);
        });

        doc.autoTable({
            head: [headers],
            body: rows
        });

        const advice = document.querySelector(".notes-section p:nth-of-type(1)").innerText;
        const notes = document.querySelector(".notes-section p:nth-of-type(2)").innerText;

        doc.text("Dietary Advice:", 10, doc.lastAutoTable.finalY + 20);
        doc.text(advice, 10, doc.lastAutoTable.finalY + 30);

        doc.text("Doctor's Notes:", 10, doc.lastAutoTable.finalY + 50);
        doc.text(notes, 10, doc.lastAutoTable.finalY + 60);

        doc.save("Prescription.pdf");
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>

</body>
</html>
