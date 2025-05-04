<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
        <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    	
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    	<link rel="preconnect" href="https://fonts.googleapis.com">
    	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-grey-900 ">
    
    	 <jsp:include page="/views/partials/header.jsp"/>
    	<!--First Section-->
        <div>
            <div class="flex justify-center">
                <div>
                    <div class="lg:flex justify-between">
                        <div class="flex justify-between pt-8 pb-8 pl-4 pr-4 border-gray-100 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl lg:w-100 md:w-100 cursor-pointer border-l-4 border-yellow-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-yellow-100 to-yellow-50">
                            <div>
                                <h3 class="text-4xl lg:text-5xl text-yellow-500 font-semibold md:text-5xl">3380</h3>
                                <h4 class="mt-2 font-semibold text-gray-700 md:text-xl">Appointments</h4>
                                <p class="text-sm text-green-600 mt-2"><i class="fas fa-arrow-up mr-1"></i> 12% increase</p>
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/images/appointment-icon.png" class="w-20" alt="">
                            </div>
                        </div>
    
                        <div class="flex justify-between pt-8 pb-8 pl-4 pr-4 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl lg:w-100 md:w-100 border-l-4 border-blue-500 cursor-pointer transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-blue-100 to-blue-50">
                            <div >
                                <h3 class="text-4xl lg:text-5xl text-blue-500 font-semibold md:text-5xl">1489</h3>
                                <h4 class="mt-2 font-semibold text-gray-700 md:text-xl">Doctors</h4>
                                <p class="text-sm text-green-600 mt-2"><i class="fas fa-arrow-up mr-1"></i> 8% increase</p>
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/images/doctor-icon.png" class="w-20" alt="">
                            </div>
                        </div>
    
                        <div class="flex justify-between pt-8 pb-8 pl-4 pr-4 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl lg:w-100 md:w-100 cursor-pointer border-l-4 border-green-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-green-100 to-green-50">
                            <div>
                                <h3 class="text-4xl lg:text-5xl text-green-500 font-semibold md:text-5xl">200</h3>
                                <h4 class="mt-2 font-semibold text-gray-700 md:text-xl">Patients</h4>
                                <p class="text-sm text-green-600 mt-2"><i class="fas fa-arrow-up mr-1"></i> 15% increase</p>
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/images/patient-icon.png" class="w-20" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Second Phase-->
            <div class="flex justify-center">
                <div class="md:flex-shrink lg:flex justify-center mt-20 mb-20">
                    <div class="lg:flex w-90 h-90 shadow-2xl md:hidden"></div>
                    <div class="w-240 h-90 shadow-2xl ml-10 rounded-lg">
                    	
                        <div class="p-4 bg-gray-50 border-b border-gray-200 flex justify-between items-center">
                            <h2 class="text-xl font-bold text-gray-800">Doctor Management</h2>
                            <button class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center transition duration-300 cursor-pointer" onclick="openAddNewDoctorForm()">
                                <i class="fas fa-plus mr-2"></i> Add Doctor
                            </button>
                        </div>

                        <!--Add New Doctor PopUp Form-->
                        <div id="addNewDoctorForm" class="fixed inset-0 bg-opacity-80 backdrop-blur-sm  hidden items-center justify-center z-50">

                            <div class="rounded-lg bg-gray-700 shadow-lg p-6 relative">
                                <div class="flex items-center justify-between">
                                    <h2 class="text-white text-2xl font-bold mb-4">Add New Doctor</h2>
                                    <button onclick="closeAddNewDoctorForm()" class="p-2 rounded-md mb-4 text-gray-200 hover:text-gray-700 hover:bg-gray-200">✕</button>
                                </div>

                                <hr class="text-blue-600 mb-8">
                                <!-- Form -->
                                <form id="addDoctorForm" class="space-y-4" action="${pageContext.request.contextPath}/AddDoctoForm" method="post">
                                    <div class="flex justify-between">
                                        <div class="flex flex-col mr-10">
                                            <label for="" class="text-lg text-white font-semibold mb-2">Full Name</label>
                                            <input type="text" placeholder="Kasun Perera" name="fullName" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                        <div class="flex flex-col mr-10">
                                            <label for="" class="text-lg text-white font-semibold mb-2">Username</label>
                                            <input type="text" placeholder="kasun123" name="userName" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                    </div>
                                    
                                    <div class="flex justify-between">
                                        <div class="flex flex-col mr-10">
                                            <label for="" class="text-lg text-white font-semibold mb-2">Email</label>
                                            <input type="text" name="email" placeholder="kasun123@gmail.com" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                        <div class="flex flex-col mr-10">
                                            <label for="" class="text-lg text-white font-semibold mb-2">Mobile Number</label>
                                            <input type="text" name="phoneNumber" placeholder="076 789 2645" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                    </div>

                                    <div class="flex justify-between">
                                        <div class="flex flex-col mr-10 ">
                                            <label for="" class="text-lg text-white font-semibold mb-2">Birthday</label>
                                            <input type="date" name="date" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                        <div class="flex flex-col mr-10 ">
                                            <label for="" class="text-gray-200 text-lg text-white font-semibold mb-2">Address</label>
                                            <input type="text" name="address" placeholder="12 Flower St,City" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                    </div>
                                    <div class="flex justify-between">
                                        <div class="flex flex-col mr-10 ">
                                            <label for="" class="text-lg text-white font-semibold mb-2">Specialization</label>
                                            <input type="text" placeholder="Heart" name="specialization" class="text-base  bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                        <div class="flex flex-col mr-10">
                                            <label for="" class="text-lg text-white font-semibold mb-2">Password</label>
                                            <input type="password" name="password" placeholder="*******" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                        </div>
                                    </div>
                                    <div class="flex justify-center mt-8">
                                        <button class="px-4 py-2 text-white rounded-lg mr-5 bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer" onclick="closeAddNewDoctorForm()">Cancel</button>

                                        <input type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center transition duration-300 cursor-pointer">
                                    </div>
                                </form>
                            </div>
                        </div>

                       
                        <div class="h-72 overflow-auto">
                            <table class="table-auto w-full text-center font-semibold text-grey-400 overflow-auto">
                                <tr class="bg-gradient-to-br from-blue-500 to-blue-600 text-white">
                                    <th class="pt-1 pb-1">Doctor ID</th>
                                    <th>Name</th>
                                    <th>Specialization</th>
                                    <th><button>Action</button></th>  
                                </tr>
                                <tr class="odd:bg-white even:bg-slate-100">
                                    <td class="pt-3 pb-3">001</td>
                                    <td>Moditha Marasinghe</td>
                                    <td>Heart</td>
                                    <td class="px-6 py-4 text-center">
                                        <button class="action-btn bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white mr-2" onclick="openEditDoctorDetailsForm()">
                                            <i class="fas fa-edit mr-1"></i> Edit
                                        </button>
                                        
                                        <!--Edit Doctor Details PopUp Form-->
                                        <div id="editDoctorDetails" class="fixed inset-0 bg-opacity-80 backdrop-blur-sm hidden items-center justify-center z-50">
                                            
                                            <div class="rounded-lg bg-gray-700 shadow-lg p-6 relative">
                                                <div class="flex items-center justify-between">
                                                    <h2 class="text-white text-2xl font-bold mb-4">Edit Doctor Details</h2>
                                                    <button onclick="closeEditDoctorDetailForm()" class="p-2 rounded-md mb-4 text-gray-200 hover:text-gray-700 hover:bg-gray-200">✕</button>
                                                </div>

                                                <hr class="text-blue-600 mb-8">
                                                <!-- Form -->
                                                <form id="editDoctorForm" class="space-y-4">
                                                    <div class="flex justify-between">
                                                        <div class="flex flex-col mr-10">
                                                            <label for="" class="text-lg text-white font-semibold mb-2">Full Name</label>
                                                            <input type="text" placeholder="Kasun Perera" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                        <div class="flex flex-col mr-10">
                                                            <label for="" class="text-lg text-white font-semibold mb-2">Username</label>
                                                            <input type="text" placeholder="kasun123" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="flex justify-between">
                                                        <div class="flex flex-col mr-10">
                                                            <label for="" class="text-lg text-white font-semibold mb-2">Email</label>
                                                            <input type="text" placeholder="kasun123@gmail.com" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                        <div class="flex flex-col mr-10">
                                                            <label for="" class="text-lg text-white font-semibold mb-2">Mobile Number</label>
                                                            <input type="text" placeholder="076 789 2645" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                    </div>

                                                    <div class="flex justify-between">
                                                        <div class="flex flex-col mr-10 ">
                                                            <label for="" class="text-lg text-white font-semibold mb-2">Birthday</label>
                                                            <input type="date" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                        <div class="flex flex-col mr-10 ">
                                                            <label for="" class="text-gray-200 text-lg text-white font-semibold mb-2">Address</label>
                                                            <input type="text" placeholder="12 Flower St,City" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                    </div>
                                                    <div class="flex justify-between">
                                                        <div class="flex flex-col mr-10 ">
                                                            <label for="" class="text-lg text-white font-semibold mb-2">Specialization</label>
                                                            <input type="text" placeholder="Heart" class="text-base  bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                        <div class="flex flex-col mr-10">
                                                            <label for="" class="text-lg text-white font-semibold mb-2">Password</label>
                                                            <input type="password" placeholder="*******" class="text-base bg-gray-600 text-gray-200 w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent">
                                                        </div>
                                                    </div>
                                                    <div class="flex justify-center mt-8">
                                                        <button class="px-4 py-2 text-white rounded-lg mr-5 bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer" onclick="closeEditDoctorDetailForm()">Cancel</button>

                                                        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center transition duration-300 cursor-pointer" >Save Changes</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                            <i class="fas fa-trash-alt mr-1"></i> Delete
                                        </button>
                                    </td>
                                </tr>
                                
                            </table>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
        <!--Third Phase-->
        <div class="flex justify-center">
            <div class="lg:flex justify-center items-start md:flex-shrink">
                <div>
                    <!--Appointment Table-->
                    <div class="w-200 h-90 shadow-2xl mr-10 rounded-lg h-72 overflow-auto">
                        <div class="p-4 bg-gray-50 border-b border-gray-200 ">
                            <h2 class="text-xl font-bold text-gray-800">Appointment Management</h2>
                        </div>
                        <div>
                            <table class="table-auto w-full text-center font-semibold text-grey-400">
                                <tr class="bg-gradient-to-br from-yellow-500 to-yellow-600 text-white">
                                    <th class="pt-1 pb-1">Appointment ID</th>
                                    <th>Patient Name</th>
                                    <th>Doctor Name</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
        
                                <tr class="odd:bg-white even:bg-slate-100">
                                    <td class="pt-3 pb-3">001</td>
                                    <td>Hasindu Chanuka</td>
                                    <td>Dr.Moditha</td>
                                    <td>2025/04/25</td>
                                    <td><button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button></td>
                                </tr>
        
                                <tr class="odd:bg-white even:bg-slate-100">
                                    <td class="pt-3 pb-3">002</td>
                                    <td>Hasindu Chanuka</td>
                                    <td>Dr.Moditha</td>
                                    <td>2025/04/25</td>
                                    <td><button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button></td>
                                </tr>
                                <tr class="odd:bg-white even:bg-slate-100">
                                    <td class="pt-3 pb-3">003</td>
                                    <td>Hasindu Chanuka</td>
                                    <td>Dr.Moditha</td>
                                    <td>2025/04/25</td>
                                    <td><button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button></td>
                                </tr>
                                <tr class="odd:bg-white even:bg-slate-100">
                                    <td class="pt-3 pb-3">004</td>
                                    <td>Hasindu Chanuka</td>
                                    <td>Dr.Moditha</td>
                                    <td>2025/04/25</td>
                                    <td><button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button></td>
                                </tr>
                                <tr class="odd:bg-white even:bg-slate-100">
                                    <td class="pt-3 pb-3">005</td>
                                    <td>Hasindu Chanuka</td>
                                    <td>Dr.Moditha</td>
                                    <td>2025/04/25</td>
                                    <td><button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
    
                    <!--Inquiry Table-->
                    <div class="w-200 h-90 shadow-2xl mr-10 mt-10 mb-10 rounded-lg h-72 overflow-auto">
                        <div class="p-4 bg-gray-50 border-b border-gray-200">
                            <h2 class="text-xl font-bold text-gray-800">Inquiry Management</h2>
                        </div>
                        <div>
                            <table class="table-auto w-full text-center font-semibold text-grey-400">
                                <tr class="bg-gradient-to-br from-red-300 to-red-400 text-white">
                                    <th class="pt-1 pb-1">Inquiry ID</th>
                                    <th>User Name</th>
                                    <th>Message</th>
                                    <th>Action</th>
                                </tr>
        
                                <tr class="odd:bg-white even:bg-slate-100">
                                    <td class="pt-3 pb-3">001</td>
                                    <td>Hasindu Chanuka</td>
                                    <td>Sample Message</td>
                                    <td class="px-6 py-4 text-center">
                                        <button class="action-btn bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white mr-2" onclick="openReplyToInquiries()">
                                            <i class="fas fa-edit mr-1"></i> Reply
                                        </button>

                                        <div id="replyToInquiries" class="fixed inset-0 bg-opacity-80 backdrop-blur-sm hidden items-center justify-center z-50">
                                            
                                            <div class="rounded-lg bg-gray-700 shadow-lg p-6 relative">
                                                <div class="flex items-center justify-between">
                                                    <h2 class="text-white text-2xl font-bold mb-4">Send Reply</h2>
                                                    <button onclick="closeReplyToInquiries()" class="p-2 rounded-md mb-4 text-gray-200 hover:text-gray-700 hover:bg-gray-200">✕</button>
                                                </div>

                                                <hr class="text-blue-600 mb-8">
                                                <!-- Form -->
                                                <form id="replyForm" class="space-y-4">
                                                    <div class="flex justify-between">
                                                        <div class="flex justify-center mr-10">
                                                            <textarea name="" id="" rows="8" class="text-base  bg-gray-600 text-gray-200 p-2 rounded-lg min-w-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="example@gmail.com"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="flex justify-center mt-8">
                                                        <button class="px-4 py-2 text-white rounded-lg mr-5 bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer" onclick="closeReplyToInquiries()">Cancel</button>

                                                        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center transition duration-300 cursor-pointer" >Relply</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                            <i class="fas fa-trash-alt mr-1"></i> Delete
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
    
    
                <!--Patient Table-->
                <div class="w-120 h-190 shadow-2xl ml-10 mb-10 rounded-lg h-72 overflow-auto border-solid">
                    <div class="p-4 bg-gray-50 border-b border-gray-200">
                        <h2 class="text-xl font-bold text-gray-800">Patient Management</h2>
                    </div>
                    <div>
                        <table class="table-auto w-full text-center font-semibold text-grey-400 ">
                            <tr class="bg-gradient-to-br from-green-500 to-green-600 text-white text-center ">
                                <th class="pt-1 pb-1">Inquiry ID</th>
                                <th>User Name</th>
                                <th>Action</th>
                            </tr>
    
                            <tr class="odd:bg-white even:bg-slate-100">
                                <td class="pt-3 pb-3">001</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold">MM</div>
                                        <span class="ml-3 font-medium">Moditha Marasinghe</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button>
                                </td>
                            </tr>

                            <tr class="odd:bg-white even:bg-slate-100">
                                <td class="pt-3 pb-3">002</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold">MM</div>
                                        <span class="ml-3 font-medium">Moditha Marasinghe</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button>
                                </td>
                            </tr>

                            <tr class="odd:bg-white even:bg-slate-100">
                                <td class="pt-3 pb-3">003</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold">MM</div>
                                        <span class="ml-3 font-medium">Moditha Marasinghe</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button>
                                </td>
                            </tr>

                            <tr class="odd:bg-white even:bg-slate-100">
                                <td class="pt-3 pb-3">004</td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold">MM</div>
                                        <span class="ml-3 font-medium">Moditha Marasinghe</span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <button class="action-btn bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white">
                                        <i class="fas fa-trash-alt mr-1"></i> Delete
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/views/partials/footer.jsp"/>
        <script src="${pageContext.request.contextPath}/assets/js/adminDB.js"></script>
    </body>
</html>