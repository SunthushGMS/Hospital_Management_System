<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <body class="bg-grey-100">
    
    	 <jsp:include page="/views/partials/header.jsp"/>
    	 
        <div>
            <div class="flex justify-center">
                <div>
                    <div class="lg:flex justify-between">
                        <div class="flex justify-between pt-8 pb-8 pl-4 pr-4 border-none border-4 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl lg:w-100 md:w-100 ">
                            <div >
                                <h3 class="lg:text-5xl text-yellow-500 font-semibold md:text-6xl">3380</h3>
                                <h4 class="lg:leading-loose font-semibold text-grey-700 md:text-2xl">Appointments</h4>
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/images/appointment-icon.png" class="w-20" alt="">
                            </div>
                        </div>
    
                        <div class="flex justify-between pt-8 pb-8 pl-4 pr-4 border-none border-4 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl lg:w-100 md:w-100">
                            <div >
                                <h3 class="lg:text-5xl text-yellow-500 font-semibold md:text-6xl">1489</h3>
                                <h4 class="lg:leading-loose font-semibold text-grey-700 md:text-2xl">Doctors</h4>
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/images/doctor-icon.png" class="w-20" alt="">
                            </div>
                        </div>
    
                        <div class="flex justify-between pt-8 pb-8 pl-4 pr-4 border-none border-4 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl lg:w-100 md:w-100">
                            <div >
                                <h3 class="lg:text-5xl text-yellow-500 font-semibold md:text-6xl">200</h3>
                                <h4 class="lg:leading-loose font-semibold text-grey-700 md:text-2xl">Patients</h4>
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
                    	
                        <table class="table-auto w-full text-center font-semibold text-grey-400 ">
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
                                <td><button class="bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer pl-4 pr-4 pt-1 pb-1 rounded text-white mr-4">Edit</button>
                                	<button class="bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer pl-4 pr-4 pt-1 pb-1 rounded text-white">Delete</button></td>
                                
                            </tr>
                            <tr class="odd:bg-white even:bg-slate-100">
                                <td class="pt-3 pb-3">002</td>
                                <td>Moditha Marasinghe</td>
                                <td>Heart</td>
                                <td><button class="bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer pl-4 pr-4 pt-1 pb-1 rounded text-white mr-4">Edit</button>
                                <button class="bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer pl-4 pr-4 pt-1 pb-1 rounded text-white">Delete</button></td>
                                
                            </tr>
                            <tr class="odd:bg-white even:bg-slate-100">
                                <td class="pt-3 pb-3">003</td>
                                <td>Moditha Marasinghe</td>
                                <td>Heart</td>
                                <td><button class="bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer pl-4 pr-4 pt-1 pb-1 rounded text-white mr-4">Edit</button>
                                	<button class="bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer pl-4 pr-4 pt-1 pb-1 rounded text-white">Delete</button></td>
                                
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="/views/partials/footer.jsp"/>
    </body>
</html>