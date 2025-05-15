<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Doctor Details | HealthLanka</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
		
		<jsp:include page="/views/partials/header.jsp"/>
		
		<c:if test="${not empty error}">
	        <div class="p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
				<span class="font-medium">Error! </span>${error}
			</div>
			<c:remove var="error" />
	    </c:if>
		
        <div class="flex justify-center items-center p-10 min-h-screen px-4">
          <div class="flex shadow-xl bg-white rounded-2xl ">
              <div class="p-10">
                <div>
                  <div class="flex justify-center mb-6 ">
                    <img src="${pageContext.request.contextPath}/assets/images/Main-Logo.png" alt="Logo" class="h-10" />
                  </div>
                  <h2 class="text-center text-3xl font-bold text-gray-800 mb-2">Edit Doctor Profile</h2>
                  <p class="text-center text-xl font-semibold text-gray-500 mb-6">Update doctor information below.</p>
                </div>
                <div>
            
                  <form id="editDoctorForm" class="space-y-4" method="post" action="${pageContext.request.contextPath}/UpdateDoctorDetailsController">
                      <input type="hidden" name="uid" value="${doctor.uid}">
                    <div class="flex justify-between ml-4">
                        <div class="flex flex-col mr-10">
                            <label for="" class="text-lg font-semibold mb-2">Full Name</label>
                            <input type="text" name="fullname" value="${doctor.fullname}" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                        <div class="flex flex-col mr-10">
                            <label for="" class="text-lg font-semibold mb-2">Username</label>
                            <input type="text" disabled="disabled" name="username" value="${doctor.username }" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                    </div>
                    
                    <div class="flex justify-between ml-4">
                        <div class="flex flex-col mr-10">
                            <label for="" class="text-lg font-semibold mb-2">Email</label>
                            <input type="text" name="email" value="${doctor.email}" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                        <div class="flex flex-col mr-10">
                            <label for="" class="text-lg font-semibold mb-2">Mobile Number</label>
                            <input id="phonee" type="text" name="phoneno" value="${doctor.phone}" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                    </div>
  
                    <div class="flex justify-between ml-4">
                        <div class="flex flex-col mr-10 ">
                            <label for=""  class="text-lg font-semibold mb-2">Birthday</label>
                            <input type="date" name="dob" value="${doctor.dob }" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                        <div class="flex flex-col mr-10 ">
                            <label for="" class="text-lg font-semibold mb-2">Address</label>
                            <input type="text" name="address" value="${doctor.address}" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                    </div>
                    <div class="flex justify-between ml-4">
                        <div class="flex flex-col mr-10 ">
                            <label for="" class="text-lg font-semibold mb-2">Specialization</label>
                            <input type="text"  name="specialization" value="${doctor.specialization}" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                        <div class="flex flex-col mr-10">
                            <label for="" class="text-lg font-semibold mb-2">Password</label>
                            <input type="password"  name="password" value="${doctor.password}" class="text-base w-60 h-10 p-2 border border-blue-500 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                        </div>
                    </div>
                    <div class="flex justify-center mt-8">
                        <input type="submit" name="submit" value="Save Changes" class="pl-20 pr-20 mt-8 font-semibold text-lg bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center transition duration-300 cursor-pointer" >
                    </div>
                  </form>
                  <div id="errormsg" class="hidden p-4 mt-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-blue-400" role="alert">
					<span class="font-medium">Info alert!</span> Phone Number should be 10 digits.
				  </div>
                </div> 
              </div>
              <div class="rounded-2xl p-10 bg-gradient-to-br from-blue-800 to-blue-500 ">
                <h1 class="text-4xl text-white font-bold mt-5 mb-5">Managing Doctor Information </h1>
                <h3 class="text-lg text-white font-semibold mt-7">Up-to-Date Doctors, Better Patient Care</h3>
                <img src="${pageContext.request.contextPath}/assets/images/edit-doctor-page-image.png" alt="" class="h-96 mt-20">
              </div>
          </div>      
        </div>
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/editDoctorDetails.js"></script>
        <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>