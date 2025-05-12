<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Prescription | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/appointHistory.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        h1, h3 {
            text-align: center;
            color: #2c3e50;
        }

        #wrapper {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        #div1 {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            width: 350px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
            color: #34495e;
        }

        form input[type="text"],
        form textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        button {
            background-color: #3498db;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        button:hover {
            background-color: #2980b9;
        }

        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        table th {
            background-color: #3498db;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .advice-wrapper {
    display: flex;
    justify-content: center;
    margin-top: 30px;
}

.advice-form {
    background-color: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    width: 80%;
    max-width: 800px;
}

.advice-fields {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    justify-content: space-between;
}

.advice-fields .field {
    flex: 1;
    min-width: 300px;
}

.advice-form textarea {
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 14px;
    margin-bottom: 10px;
}

.btn-advice {
    margin-top: 15px;
    background-color: #2ecc71;
    color: white;
    padding: 10px 16px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
}

.btn-advice:hover {
    background-color: #27ae60;
}

.drug-wrapper {
    background-color: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    width: 90%;
    max-width: 500px;
    margin: 40px auto;
}
        
    </style>
</head>
<body>

<jsp:include page="/views/partials/header.jsp"/>


 

<h1>Create Prescription</h1>

<!-- ADVICE FORM -->
<div class="advice-wrapper">


	<c:if test="${not empty patientId}">
    <form action="${pageContext.request.contextPath}/PrescriptionController" method="post" class="advice-form">

		<input type="hidden" name="patientId" value="${patientId}">
        <div class="advice-fields">
            <div class="field">
                <label for="dietaryAdvice">Dietary Advice:</label>
                <textarea id="dietaryAdvice" name="dietaryAdvice" rows="4" required></textarea>
            </div>

            <div class="field">
                <label for="doctorsNote">Doctor's Note:</label>
                <textarea id="doctorsNote" name="doctorsNote" rows="4" required></textarea>
            </div>
        </div>

        <button type="submit" class="btn-advice">Add Advice</button>
    </form>
    </c:if>
</div>

<!-- DRUG FORM - displayed below -->
<c:if test="${not empty prescriptionId}">
<div class="drug-wrapper">
<c:set var="patientId" value="${param.patientid}" />


	<form action="${pageContext.request.contextPath}/prescriptionDrugController" method="post" class="advice-form">
    <input type="hidden" name="prescriptionId" value="${prescriptionId}" />
	<input type="hidden" name="patientId" value="${patientId}">
	
    <label for="drug-name">Drug Name:</label>
    <input type="text" id="drug-name" name="drugName" required>

    <label for="dosage">Dosage:</label>
    <input type="text" id="dosage" name="dosage" required>

    <label for="frequency">Frequency:</label>
    <input type="text" id="frequency" name="frequency" required>

    <label for="duration">Duration:</label>
    <input type="text" id="duration" name="duration" required>

    <label for="instruction">Instruction:</label>
    <textarea id="instruction" name="instruction" rows="3"></textarea>

    <button type="submit" name="action" value="addDrug">Add Drug</button>
</form>
</div>
 </c:if>

<c:if test="${not empty drugList}">
    <table>
        <tr>
            <th>Drug Name</th>
            <th>Dosage</th>
            <th>Frequency</th>
            <th>Duration</th>
            <th>Instruction</th>
            <th>Action</th>
        </tr>
        <c:forEach var="drug" items="${drugList}" varStatus="loop">
            <tr>
                <td>${drug.drugName}</td>
                <td>${drug.dosage}</td>
                <td>${drug.frequency}</td>
                <td>${drug.duration}</td>
                <td>${drug.instruction}</td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/prescriptionDrugController">
                        <input type="hidden" name="index" value="${loop.index}" />
                        <input type="hidden" name="prescriptionId" value="${prescriptionId}" />
                        <input type="hidden" name="patientId" value="${patientId}">
                        <button type="submit" name="action" value="deleteDrug">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
     <c:set var="patientId" value="${param.patientid}" />
    <form action="${pageContext.request.contextPath}/prescriptionDrugController" method="post">
    <input type="hidden" name="prescriptionId" value="${prescriptionId}" />
    <input type="hidden" name="patientId" value="${patientId}" />
    <button type="submit" name="action" value="saveAll">Finalize Prescription</button>
</form>

<br><br><br>

    
</c:if>


</body>
</html>
