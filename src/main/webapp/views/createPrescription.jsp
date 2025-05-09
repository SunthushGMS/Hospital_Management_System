<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Drug" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Prescription | Health Lanka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/createPrescriptions.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    
</head>
<body>

<% 
    int patientId = (int) request.getAttribute("patientId");
    ArrayList<Drug> drugList = (ArrayList<Drug>) session.getAttribute("drugList");
    if (drugList == null) {
        drugList = new ArrayList<>();
    }
%>

<h2>Prescription for Patient ID: <%= patientId %></h2>
    <jsp:include page="/views/partials/header.jsp"/>
    <h1 id="heading">Create Prescription</h1>

    <div id="wrapper">
        <div id="div1">
            <form action="${pageContext.request.contextPath}/PrescriptionController?action=addDrug" method="post">
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
        <!-- 
        <div id="div1">
            <h3>Drugadded successfully. <br> View and update Drug in the table below.</h3>
            <button>Add more Drugs</button>
        </div>
        -->

        <div id="div1">
            <form action="${pageContext.request.contextPath}/PrescriptionController?action=createPrescription" method="post">
    			<input type="hidden" name="patientId" value="<%= patientId %>">
                <label for="dietary-advices">Dietary advices: : </label><br><br>
                <textarea id="dietary-advices" name="dietary-advices" rows="6" required></textarea><br><br>

                <label for="doctors-notes">Doctors notes : </label><br><br>
                <textarea id="doctors-notes" name="doctors-notes" rows="6" required></textarea><br><br>

                
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

	<button type="submit" class="submit-btn" style="padding: 20px; margin-left:25%; width: 50%;">Send Prescription</button>
    </form>
    
	<br><br>

    
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>