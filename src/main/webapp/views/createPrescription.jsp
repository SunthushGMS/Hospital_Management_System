<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/createPrescriptions.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>

    <h1 id="heading">Create Prescription</h1>

    <div id="wrapper">
        <div id="div1">
            <form id="createPrescription-form"action=""method="post">
                <label for="drug-name">Drug Name : </label><br><br>
                <input type="text" id="drug-name" required><br><br>

                <label for="dosage">Dosage: </label><br><br>
                <input type="text" id="dosage" required><br><br>

                <label for="frequancy">Frequancy : </label><br><br>
                <input type="text" id="frequancy" required><br><br>

                <label for="instruction">Instruction  : </label><br><br>
                <input type="text" id="instruction" required><br><br>

                <label for="duration">Duration  : </label><br><br>
                <input type="text" id="duration" required><br><br>

                <button type="submit" class="submit-btn">Add Drug</button>
            </form>
        </div>
        <!-- 
        <div id="div1">
            <h3>Drugadded successfully. <br> View and update Drug in the table below.</h3>
            <button>Add more Drugs</button>
        </div>
        -->

        <div id="div1">
            <form id="createPrescription-form"action=""method="post">
                <label for="dietary-advices">Dietary advices: : </label><br><br>
                <textarea id="dietary-advices" rows="6" required></textarea><br><br>

                <label for="doctors-notes">Doctors notes : </label><br><br>
                <textarea id="doctors-notes" rows="6" required></textarea><br><br>

                <button type="submit" class="submit-btn">Send Prescription</button>
            </form>
        </div>
    </div>

    <h2 id="subHeading">Items In Prescription</h2>

    <table>
        <tr>
            <th>Drug Name</th>
            <th>Dosage</th>
            <th>Frequancy</th>
            <th>Duration</th>
            <th>Instruction</th>
        </tr>
        
        <tr>
            <td>Paracitamole</td>
            <td>500mg</td>
            <td>3 times a day</td>
            <td>5 days</td>
            <td>After meals</td>
        </tr>

        <tr>
            <td>Paracitamole</td>
            <td>500mg</td>
            <td>3 times a day</td>
            <td>5 days</td>
            <td>After meals</td>
        </tr>

        <tr>
            <td>Paracitamole</td>
            <td>500mg</td>
            <td>3 times a day</td>
            <td>5 days</td>
            <td>After meals</td>
        </tr>

        <tr>
            <td>Paracitamole</td>
            <td>500mg</td>
            <td>3 times a day</td>
            <td>5 days</td>
            <td>After meals</td>
        </tr>

        <tr>
            <td>Paracitamole</td>
            <td>500mg</td>
            <td>3 times a day</td>
            <td>5 days</td>
            <td>After meals</td>
        </tr>

    </table>

    <br><br>




    

</body>
</html>