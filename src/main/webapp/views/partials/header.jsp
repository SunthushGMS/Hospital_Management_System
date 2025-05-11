<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
        <nav class="bg-gray-50 border-gray-200 px-4 lg:px-6 py-4">
            <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl">
                <a href="${pageContext.request.contextPath}" class="flex items-center">
                    <img src="${pageContext.request.contextPath}/assets/images/Main-Logo.png" class="mr-3 h-6 sm:h-9" />
                </a>
                <div>
                    <ul class="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0">
                        <li>
                            <a href="${pageContext.request.contextPath}" class="block py-2 pr-4 pl-3 text-white rounded bg-blue-700 lg:bg-transparent lg:text-blue-700 lg:p-0" aria-current="page">Home</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-blue-700 lg:p-0 dark:text-gray-400">Doctors</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/Patient" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-blue-700 lg:p-0 dark:text-gray-400">Appoiments</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/ContactUs" class="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-blue-700 lg:p-0 dark:text-gray-400">Contact</a>
                        </li>
                    </ul>
                </div>
                <c:if test="${not empty uid}">
                	<div class="relative">
	                	<img id="dropdownTrigger" class="w-10 h-10 rounded-full cursor-pointer" src="${pageContext.request.contextPath}/assets/images/profilePics/${profilepic}" alt="Rounded avatar">
						<!-- Dropdown menu -->
						<div id="userDropdown" class="hidden absolute right-0 mt-1 origin-top-right z-10 bg-white divide-y divide-gray-100 rounded-lg shadow-sm w-44 dark:bg-gray-700 dark:divide-gray-600">
						    <div class="px-4 py-3 text-sm text-gray-900 dark:text-white">
						      <div>${fullname}</div>
						    </div>
						    <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="avatarButton">
						      <li>
						        <a href="${pageContext.request.contextPath}/userprofile" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">My Profile</a>
						      </li>
						      <c:if test="${role == 'patient'}">
						      	<li>
						        	<a href="${pageContext.request.contextPath}/PatientDashboard" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Patient Dashboard</a>
						      	</li>
						      	<li>
						        	<a href="${pageContext.request.contextPath}/AppointmentHistory" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">My Appointments</a>
						      	</li>
						      	<li>
						        <a href="${pageContext.request.contextPath}/ShowPrescription" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Prescriptions</a>
						      </li>
						      </c:if>
						      <c:if test="${role == 'doctor'}">
						          <li>
                                	<a href="${pageContext.request.contextPath}/doctorDashboard" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Doctor Dashboard</a>
                              	</li>
                              	 <li>
                                	<a href="${pageContext.request.contextPath}/Appointments" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Appointments</a>
                              	</li>
						      </c:if>
						      <c:if test="${role == 'admin'}">
                              	<li>
                                	<a href="${pageContext.request.contextPath}/AdminDB" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Admin Dashboard</a>
                              	</li>
						      </c:if>
						    </ul>
						    <div class="py-1">
						      <a href="${pageContext.request.contextPath}/Signout" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Sign out</a>
						    </div>
						</div>          	
                	</div>
                </c:if>
                <c:if test="${empty uid}">
                    <div class="flex">
	                    <a href="${pageContext.request.contextPath}/Signin" class="text-gray-800 hover:bg-gray-200 transition ease-in-out duration-500 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 focus:outline-none">Sign In</a>
	                    <a href="${pageContext.request.contextPath}/SignUp" class="text-white bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 focus:outline-none">Get started</a>
                	</div>
                </c:if>
            </div>
        </nav>
        <script src="${pageContext.request.contextPath}/assets/js/header.js"></script>
</header>