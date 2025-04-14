<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>My Profile | HealthLanka</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>

<body>
    <jsp:include page="/views/partials/header.jsp" />

    <div class="container mx-auto px-4 py-8 max-w-screen-xl">

        <div class="bg-white overflow-hidden rounded-lg shadow-custom">
            <div class="md:flex">
                <!-- Profile Picture Section -->
                <div class="md:w-1/3 p-8 flex flex-col items-center justify-center bg-blue-50">
                    <img class="w-40 h-40 rounded-full border-4 border-white shadow-lg mb-4"
                        src="${pageContext.request.contextPath}/assets/images/profilePics/${profilepic}"
                        alt="User profile picture">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-2">${user.fullname}</h2>
                    <p class="text-gray-600 mb-4">Username: ${user.username}</p>
                    <button id="openProfileModal"
                        class="text-white px-4 py-2 rounded-full flex items-center bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">
                        <i class="fas fa-camera mr-2"></i> Change Picture
                    </button>
                </div>

                <!-- Personal Information Section -->
                <div class="md:w-2/3 p-8">
                    <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-user"></i> Personal
                        Information</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <p class="text-gray-900 font-semibold">Email</p>
                            <p class="text-gray-500 font-medium">${user.email}</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Phone</p>
                            <p class="text-gray-500 font-medium">${user.phone}</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Date of Birth</p>
                            <p class="text-gray-500 font-medium">${user.dob}</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Address</p>
                            <p class="text-gray-500 font-medium">${user.address}</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Bio</p>
                            <p class="text-gray-500 font-medium">${user.bio}</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Languages</p>
                            <p class="text-gray-500 font-medium">${user.language}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Doctor Information -->
        <c:if test="${role == 'doctor'}">
        	<div class="mt-8 bg-white rounded-lg shadow-custom overflow-hidden">
		        <div class="border-b">
		            <p class="px-4 py-2 w-full text-center text-blue-600 bg-blue-50 border-b-2 border-blue-600">Public Details</p>
		        </div>
		        <div class="p-6">
		            <div>
		                <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-user-md" aria-hidden="true"></i> Doctor Information</h3>
		                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
		                    <div>
		                        <p class="text-gray-900 font-semibold">Specialization:</p>
		                        <p class="text-gray-500 font-medium">${user.specialization}</p>
		                    </div>
		                    <div>
		                        <p class="text-gray-900 font-semibold">License Number:</p>
		                        <p class="text-gray-500 font-medium">${user.license}</p>
		                    </div>
		                    <div>
		                        <p class="text-gray-900 font-semibold">Years of Experience:</p>
		                        <p class="text-gray-500 font-medium">${user.experience}</p>
		                    </div>
		                    <div>
		                        <p class="text-gray-900 font-semibold">Public Bio:</p>
		                        <p class="text-gray-500 font-medium">${user.publicbio}</p>
		                    </div>
		                </div>
		            </div>
		
		        </div>
    		</div>
        </c:if>
        
        <!-- Patient Information -->
        <c:if test="${role == 'patient'}">
        	<div class="mt-8 bg-white rounded-lg shadow-custom overflow-hidden">
	            <div class="border-b">
	                <p class="px-4 py-2 w-full text-center text-blue-600 bg-blue-50 border-b-2 border-blue-600">Medical
	                    Details</p>
	            </div>
	            <div class="p-6">
	                <div>
	                    <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-heartbeat"></i> Patient
	                        Information</h3>
	                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
	                        <div>
	                            <p class="text-gray-900 font-semibold">Blood Type:</p>
	                            <p class="text-gray-500 font-medium">${user.bloodGroup}</p>
	                        </div>
	                        <div>
	                            <p class="text-gray-900 font-semibold">Gender</p>
	                            <p class="text-gray-500 font-medium">${user.gender}</p>
	                        </div>
	                        <div>
	                            <p class="text-gray-900 font-semibold">Allergies:</p>
	                            <p class="text-gray-500 font-medium">${user.allergies}</p>
	                        </div>
	                        <div>
	                            <p class="text-gray-900 font-semibold">Medical History:</p>
	                            <p class="text-gray-500 font-medium">${user.medicalHistory}</p>
	                        </div>
	                        <div>
	                            <p class="text-gray-900 font-semibold">Genetic Predispositions:</p>
	                            <p class="text-gray-500 font-medium">${user.currentMedication}</p>
	                        </div>
	                        <div>
	                            <p class="text-gray-900 font-semibold">Special Notes:</p>
	                            <p class="text-gray-500 font-medium">${user.notes}</p>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
        	</div>
        </c:if>

        <!-- Admin Information -->
        <c:if test="${role == 'admin'}">
        	<div class="mt-8 bg-white rounded-lg shadow-custom overflow-hidden">
		        <div class="border-b">
		            <p class="px-4 py-2 w-full text-center text-blue-600 bg-blue-50 border-b-2 border-blue-600">Admin</p>
		        </div>
		        <div class="p-6">
		            <div>
		                <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-lock"></i> Admin Information</h3>
		                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
		                    <div>
		                        <p class="text-gray-600">Role:</p>
		                        <p class="text-gray-800 font-medium">${user.role}</p>
		                    </div>
		                    <div>
		                        <p class="text-gray-600">Access Level:</p>
		                        <p class="text-gray-800 font-medium">${user.accesslevel}</p>
		                    </div>
		                    <div>
		                        <p class="text-gray-600">Date Joined:</p>
		                        <p class="text-gray-800 font-medium">${user.datejoined}</p>
		                    </div>
		                    <div>
		                        <p class="text-gray-600">Public Bio:</p>
		                        <p class="text-gray-800 font-medium">${user.publicbio}</p>
		                    </div>
		                </div>
		            </div>
		        </div>
    		</div>
        </c:if>

        <div class="bg-white rounded-lg shadow-custom p-6 mt-8">
            <h2 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-key" aria-hidden="true"></i> Change
                Password</h2>
            <form method="POST" id="changePasswordForm" action="#">
                <div class="space-y-4">
                    <div>
                        <label for="old-password" class="block text-sm font-medium text-gray-700 mb-1">Old
                            Password</label>
                        <input type="password" id="old-password" name="old-password"
                            class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            required>
                    </div>
                    <div>
                        <label for="new-password" class="block text-sm font-medium text-gray-700 mb-1">New
                            Password</label>
                        <input type="password" id="new-password" name="new-password"
                            class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            required>
                    </div>
                    <div>
                        <label for="confirm-password" class="block text-sm font-medium text-gray-700 mb-1">Confirm
                            New Password</label>
                        <input type="password" id="confirm-password" name="confirm-password"
                            class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            required>
                    </div>
                </div>
                <div class="mt-6">
                    <button type="submit"
                        class="w-full text-white px-4 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">
                        Change Password
                    </button>
                </div>
            </form>
        </div>


        <!-- Action Buttons -->
        <div class="mt-8 flex justify-end">
            <button id="edituser"
                class="text-white px-6 py-2 rounded-lg bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer flex items-center mr-4">
                <i class="fas fa-edit mr-2"></i> Edit Profile
            </button>
            <button
                class="text-white px-6 py-2 rounded-lg bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer flex items-center">
                <i class="fas fa-trash-alt mr-2"></i> Delete Account
            </button>
        </div>
    </div>

    <!-- PopupWindows -->
    <div class="relative">
        <!-- Modal Backdrop with Blur -->
        <div id="outerbox" class="fixed inset-0 z-40 hidden">
            <div class="absolute inset-0 bg-opacity-80 backdrop-blur-sm"></div>

            <!-- Modal Content Profile PicChange -->
            <div id="propiccontainer" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4">
                <div class="bg-white dark:bg-gray-800 rounded-lg shadow-lg max-w-md w-full">
                    <!-- Modal Header -->
                    <div class="flex items-center justify-between p-4 border-b dark:border-gray-700">
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                            Change Profile Picture
                        </h3>
                        <button id="closeProfileModal"
                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                    clip-rule="evenodd"></path>
                            </svg>
                        </button>
                    </div>

                    <div class="p-6">
                        <form method="POST" id="profilePictureForm" class="space-y-6">
                            <div class="flex flex-col items-center">
                                <div class="profile-pic relative mb-4">
                                    <div
                                        class="w-32 h-32 rounded-full overflow-hidden bg-gray-200 dark:bg-gray-700">
                                        <img id="preview"
                                            src="${pageContext.request.contextPath}/assets/images/profilePics/${profilepic}"
                                            alt="Profile preview" class="w-full h-full object-cover">
                                    </div>
                                </div>

                                <div class="flex flex-col items-center w-full">
                                    <label for="profile-upload"
                                        class="flex flex-col items-center justify-center w-full h-32 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer bg-gray-50 dark:hover:bg-gray-600 dark:bg-gray-700 hover:bg-gray-100 dark:border-gray-600 dark:hover:border-gray-500">
                                        <div class="flex flex-col items-center justify-center pt-5 pb-6">
                                            <svg class="w-8 h-8 mb-4 text-gray-500 dark:text-gray-400"
                                                aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                                                viewBox="0 0 20 16">
                                                <path stroke="currentColor" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2"
                                                    d="M13 13h3a3 3 0 0 0 0-6h-.025A5.56 5.56 0 0 0 16 6.5 5.5 5.5 0 0 0 5.207 5.021C5.137 5.017 5.071 5 5 5a4 4 0 0 0 0 8h2.167M10 15V6m0 0L8 8m2-2 2 2" />
                                            </svg>
                                            <p class="mb-2 text-sm text-gray-500 dark:text-gray-400"><span
                                                    class="font-semibold">Click to upload</span> or drag and drop
                                            </p>
                                            <p class="text-xs text-gray-500 dark:text-gray-400">SVG, PNG, JPG or GIF
                                                (MAX. 2MB)</p>
                                        </div>
                                        <input id="profile-upload" type="file" class="hidden" accept="image/*"
                                            onchange="previewImage(event)" />
                                    </label>
                                </div>
                            </div>

                            <!-- Modal Footer -->
                            <div class="flex justify-end space-x-2">
                                <button type="button" id="cancelProfileUpload"
                                    class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300">
                                    Cancel
                                </button>
                                <button type="submit"
                                    class="px-4 py-2 text-sm font-medium text-white rounded-lg focus:outline-none focus:ring-blue-300 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">
                                    Save Changes
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit User PopUp Window -->
            <div id="userdetails"
                class="hidden fixed inset-0 z-50 flex items-center justify-center p-4 overflow-y-auto">
                <div class="bg-white dark:bg-gray-800 rounded-lg shadow-lg max-w-3xl w-full my-8">
                    <div class="flex items-center justify-between p-4 border-b dark:border-gray-700">
                        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                            Edit User Details
                        </h3>
                        <button id="closeEditBox"
                            class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                    clip-rule="evenodd"></path>
                            </svg>
                        </button>
                    </div>

                    <div class="p-6 overflow-y-auto max-h-[70vh]">
                        <form id="userDetailsForm" method="POST" class="space-y-6" action="${pageContext.request.contextPath}/UpdateUserController">
                            <!-- Basic Information Section -->
                            <div class="border-b border-gray-200 pb-6">
                                <h4 class="text-lg font-medium text-gray-900 dark:text-white mb-4">Basic
                                    Information</h4>

                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <!-- Email -->
                                    <div>
                                        <label for="email"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
                                        <input type="email" id="email"
                                        	name="email"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
                                            value="${user.email}" required>
                                    </div>

                                    <!-- Phone -->
                                    <div>
                                        <label for="phone"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone</label>
                                        <input type="tel" id="phone"
                                            name="phone"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
                                            value="${user.phone}" required>
                                    </div>

                                    <!-- Date of Birth -->
                                    <div>
                                        <label for="dob"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Date
                                            of Birth</label>
                                        <input type="date" id="dob"
                                            name="dob"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
                                            value="${user.dob}" required>
                                    </div>

                                    <!-- Language -->
                                    <div>
                                        <label for="language"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Language</label>
                                        <select id="language"
                                            name="language"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
                                            <option value="English" ${user.language == 'English' ? 'selected' : ''}>English</option>
                                            <option value="Sinhala" ${user.language == 'Sinhala' ? 'selected' : ''}>Sinhala</option>
                                            <option value="Tamil" ${user.language == 'Tamil' ? 'selected' : ''}>Tamil</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Address -->
                                <div class="mt-4">
                                    <label for="address"
                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
                                    <textarea id="address" rows="3"
                                        name="address"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.address}</textarea>
                                </div>

                                <!-- Bio -->
                                <div class="mt-4">
                                    <label for="bio"
                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Bio</label>
                                    <textarea id="bio" rows="4"
                                        name="bio"
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.bio}</textarea>
                                </div>
                            </div>

                            <!-- User Specific Information Section -->
                            <!-- Patient Details -->
                            <c:if test="${role == 'patient'}">
                            	<div>
	                                <h4 class="text-lg font-medium text-gray-900 dark:text-white mb-4">Medical
	                                    Information</h4>
	
		                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
	                                    <!-- Blood Type -->
	                                    <div>
	                                        <label for="bloodType"
	                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Blood
	                                            Type</label>
	                                        <select id="bloodType"
	                                        	name="bloodType"
	                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
	                                            <option value="A+" ${user.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
	                                            <option value="A-" ${user.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
	                                            <option value="B+" ${user.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
	                                            <option value="B-" ${user.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
	                                            <option value="AB+" ${user.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
	                                            <option value="AB-" ${user.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
	                                            <option value="O+" ${user.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
	                                            <option value="O-" ${user.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
	                                        </select>
	                                    </div>
	                                    <!-- Gender -->
	                                    <div>
	                                        <label for="gender"
	                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Gender</label>
	                                        <select id="gender"
	                                        	name="gender"
	                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
	                                            <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
	                                            <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
	                                            <option value="none" ${user.gender == 'other' ? 'selected' : ''}>None</option>
	                                        </select>
	                                    </div>
	                                </div>

	                                <!-- Allergies -->
	                                <div class="mb-4">
	                                    <label for="allergies"
	                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Allergies</label>
	                                    <textarea id="allergies" rows="2"
	                                        name="allergies"
	                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.allergies}</textarea>
	                                </div>
	
	                                <!-- Medical History -->
	                                <div class="mb-4">
	                                    <label for="medicalHistory"
	                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Medical
	                                        History</label>
	                                    <textarea id="medicalHistory" rows="2"
	                                        name="medicalHistory"
	                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.medicalHistory}</textarea>
	                                </div>

	                                <!-- Genetic Predispositions -->
	                                <div class="mb-4">
	                                    <label for="geneticPredispositions"
	                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Genetic
	                                        Predispositions</label>
	                                    <textarea id="geneticPredispositions" rows="2"
	                                        name="geneticPredispositions"
	                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.currentMedication}</textarea>
	                                </div>

	                                <!-- Special Notes -->
	                                <div>
	                                    <label for="specialNotes"
	                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Special
	                                        Notes</label>
	                                    <textarea id="specialNotes" rows="2"
	                                        name="specialNotes"
	                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.notes}</textarea>
	                                </div>
                            	</div>
                            </c:if>

                            <!-- Doctor Details -->
                            <c:if test="${role == 'doctor'}">
                            	<div>
	                                <h4 class="text-lg font-medium text-gray-900 dark:text-white mb-4">Doctor Information</h4>
	
	                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
	                                    <div>
	                                        <label for="specialization"
	                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Specialization</label>
	                                        <input id="specialization" type="text"
	                                            name="specialization"
	                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
	                                            value="${user.specialization}">
	                                    </div>
	                                    <div>
	                                        <label for="LicenseNumber"
	                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">License Number</label>
	                                        <input id="licenseNumber"
	                                            name="licenseNumber"
	                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
	                                            value="${user.license}">
	                                    </div>
	                                </div>
	
	                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
	                                    <div>
	                                        <label for="yearsOfExperience"
	                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Years of Experience</label>
	                                        <input id="pecialization" type="number"
	                                            name="yearsOfExperience"
	                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
	                                            value="${user.experience}">
	                                    </div>
	                                </div>
	                                
	                                <div>
	                                    <label for="publicbio"
	                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Public Bio</label>
	                                    <textarea id="publicbio" rows="2"
	                                        name="publicbio"
	                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.publicbio}</textarea>
	                                </div>
                            	</div>
                            </c:if>


                            <!-- Admin Details -->
                            <c:if test="${role == 'admin'}">
                            	<div>
	                                <h4 class="text-lg font-medium text-gray-900 dark:text-white mb-4">Admin Information</h4>
	
	                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
	                                    <div>
	                                        <label for="Role"
	                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Role</label>
	                                        <select id="role"
	                                            name="role"
	                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
	                                            <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Administrator</option>
	                                            <option value="System Admin" ${user.role == 'Primary Administrator' ? 'selected' : ''}>Primary Administrator</option>
	                                            <option value="Editor" ${user.role == 'Editor' ? 'selected' : ''}>Editor</option>
	                                        </select>
	                                    </div>
	                                    <div>
	                                        <label for="AccessLevel"
	                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Access Level</label>
	                                        <select id="accessLevel"
	                                        	name="accessLevel"
	                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">
	                                            <option value="Super" ${user.accesslevel == 'Admin' ? 'selected' : ''}>Super</option>
	                                            <option value="Restricted" ${user.accesslevel == 'Admin' ? 'selected' : ''}>Restricted</option>
	                                        </select>
	                                    </div>
	                                </div>
	
	                                <div>
	                                    <label for="publicbio"
	                                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Public Bio</label>
	                                    <textarea id="publicbio" rows="2"
	                                        name="publicbio"
	                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white">${user.publicbio}</textarea>
	                                </div>
                            	</div>
                            </c:if>

                            <!-- Modal Footer -->
                            <div class="flex justify-end space-x-2 pt-4">
                                <button type="button" id="cancelEdit"
                                    class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300">
                                    Cancel
                                </button>
                                <button type="submit"
                                    class="px-4 py-2 text-sm font-medium text-white rounded-lg bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer focus:ring-4 focus:outline-none focus:ring-blue-300">
                                    Save Changes
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <jsp:include page="/views/partials/footer.jsp" />
    <script src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
</body>

</html>