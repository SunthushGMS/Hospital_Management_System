<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Security Portal | Health Lanka</title>
    <link rel="stylesheet" href="security.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/security.css">
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
   <h1 class="head">Security And Data Protection <i class='bx bxs-lock' id="icon-lock"></i></h1>

<div class="container">
    <h2 class="head1">Security Settings</h2>
    
    <div class="wrapper">
    <div class="security-option1">
      <h3 class="opt1"><a href="2fa"><img src="${pageContext.request.contextPath}/assets/images/2fa_11220705.png" alt="" class="icon-img">Enable Two Factor Auethentication </a></h3>
    </div>
    <div class="security-option1">
      <h3 class="opt1"><a href="pass"><img src="${pageContext.request.contextPath}/assets/images/pin-code.png" alt="" class="icon-img">Add a Passkey </a></h3>
    </div>
</div>
   
    <div class="security-option">
        <h3 class="head2"> Change Password <i class='bx bxs-key' id="icon-lock"></i></h3>
        <input type="password" placeholder="Current Password">
        <br>
        <input type="password" placeholder="New Password">
        <br>
        <input type="password" placeholder="Confirm New Password">
        <br>
        <button class="btn-save">Update Password</button>
    </div>

    <div class="security-option">
        <label for="session-timeout">Set Auto Logout Time (minutes)</label>
        <input type="number" id="session-timeout" min="1" max="60" value="15">
        <button class="btn-save">Save</button>
    </div>

    
    <div class="security-option">
        <h3 class="head2">Login Activity<img src="${pageContext.request.contextPath}/assets/images/activity.png" alt="" class="icon-img"></h3>
        <p>Last Login <strong>March 10, 2025:  10:45 AM</strong></p>
        <p>IP Address <strong>192.168.1.100</strong></p>
        <p>Device <strong>Chrome on Windows</strong></p>
        <button class="btn-view">View More</button>
    </div>

    <div class="security-option">
        <h3 class="head2"> Manage Account Data <i class='bx bxs-user-account' id="icon-lock"></i></h3>
        <button class="btn-recov">Add a recovery email</button>
        <button class="btn-download">Download My Data</button>
        <button class="btn-delete">Delete Account</button>
    </div>
</div>
<jsp:include page="/views/partials/footer.jsp"/>

</body>
</html>
