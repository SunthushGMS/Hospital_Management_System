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
<div class="container">
    <h2 class="head">Invoice & Receipt</h2>

    <div class="invoice-details">
        <h3 class="invoice-head">Invoice #INV-20250312</h3>
        <p><strong>Patient Name</strong> John Doe</p>
        <p><strong>Doctor</strong> Dr. Sarah Lee (Dermatology)</p>
        <p><strong>Appointment Date & Time</strong> March 12, 2025 - 10:30 AM</p>
        <p><strong>Services</strong> Consultation, Skin Test</p>
        <p><strong>Total Amount </strong> $150</p>
        <p><strong>Payment Method</strong> Credit Card</p>
        
      
        <button class="btn-download">Download Invoice (PDF)</button>
        <button class="btn-email">Email Receipt</button>
    </div>

   
    <h3 class="head1">Past Payments</h3>
    <table>
        <thead>
            <tr>
                <th>Invoice ID</th>
                <th>Date</th>
                <th>Doctor</th>
                <th>Amount</th>
                <th>Payment Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>#INV-20250311</td>
                <td>March 10, 2025</td>
                <td>Dr Shashie</td>
                <td>$120</td>
                <td>Paid</td>
                <td><button class="btn-download">Download</button></td>
            </tr>
            <tr>
                <td>#INV-20250310</td>
                <td>March 5, 2025</td>
                <td>Dr Thinura</td>
                <td>$90</td>
                <td>Paid</td>
                <td><button class="btn-download">Download</button></td>
            </tr>
            <tr>
                <td>#INV-20250380</td>
                <td>March 16, 2025</td>
                <td>Dr Chris bumstead</td>
                <td>$65</td>
                <td>Paid</td>
                <td><button class="btn-download">Download</button></td>
            </tr>
            <tr>
                <td>#INV-20250350</td>
                <td>March 25, 2025</td>
                <td>Dr Harischandra</td>
                <td>$70</td>
                <td>Paid</td>
                <td><button class="btn-download">Download</button></td>
            </tr>
            <tr>
                <td>#INV-20759310</td>
                <td>March 15, 2025</td>
                <td>Dr Kamal</td>
                <td>$190</td>
                <td>Paid</td>
                <td><button class="btn-download">Download</button></td>
            </tr>
        </tbody>
    </table>

</div>
<jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
