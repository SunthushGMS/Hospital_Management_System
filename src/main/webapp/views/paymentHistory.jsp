<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Portal | Health Lanka</title>
    <link rel="stylesheet" href="paymentHistory.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/paymentHistory.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>
   
    <h3 class="head1">Past Payments</h3>


<c:if test="${not empty payments}">
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Invoice ID</th>
                <th>Full Name</th>
                <th>Patient ID</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Service</th>
                <th>Amount (LKR)</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="a" items="${payments}">
                <tr>
                    <td>${a.id}</td>
                    <td>${a.fullName}</td>
                    <td>${a.patientId}</td>
                    <td>${a.phone}</td>
                    <td>${a.email}</td>
                    <td>${a.service}</td>
                    <td>${a.amount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty payments}">
    <div class="no-records">No payment history found for this patient.</div>
</c:if>



<jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
