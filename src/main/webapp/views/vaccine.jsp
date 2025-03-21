<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vaccination | Health Lanka</title>
    <link rel="stylesheet" href="vaccine.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vaccine.css">
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
    <h1 class="head">Vaccination</h1>
    <img src="${pageContext.request.contextPath}/assets/images/syringe.png" alt="" class="icon-head">
    
    <table class="tb1">
        <thead>
            <th>Vaccination ID</th>
            
            <th>VAccine Name</th>
            <th>Manufacture</th>
            <th>Date of Vaccinated</th>
            <th>Status</th>
            <th>Download</th>
        </thead>
        <tr>
            <td>VAX001</td>
         
            <td>COVID-19</td>
            <td>Pfizer</td>
            <td>2024-01-15</td>
            <td>Completed</td>
            <td><button class="btn-download">Download</button></td>
        </tr>
        <tr>
            <td>VAX002</td>
    
            <td>Hepatitis B</td>
            <td>Moderna</td>
            <td>2024-02-10</td>
            <td>Completed</td>
            <td><button class="btn-download">Download</button></td>
        </tr>
        <tr>
            <td>VAX003</td>
          
            <td>Polio</td>
            <td>GSK</td>
            <td>2024-03-05</td>
            <td>Pending</td>
            <td><button class="btn-download">Download</button></td>
        </tr>
        <tr>
            <td>VAX004</td>
      
            <td>Influenza</td>
            <td>Sanofi</td>
            <td>2024-01-28</td>
            <td>Completed</td>
            <td><button class="btn-download">Download</button></td>
        </tr>
      
    </table>
    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
