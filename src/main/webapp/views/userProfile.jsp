<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="/views/partials/header.jsp"/>

    <div class="container mx-auto px-4 py-8 max-w-screen-xl">

        <div class="bg-white overflow-hidden rounded-lg shadow-custom">
            <div class="md:flex">
                <!-- Profile Picture Section -->
                <div class="md:w-1/3 p-8 flex flex-col items-center justify-center bg-blue-50">
                    <img class="w-40 h-40 rounded-full border-4 border-white shadow-lg mb-4" src="${pageContext.request.contextPath}/assets/images/testimg.jpeg" alt="User profile picture">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-2">Moditha Marsingha</h2>
                    <p class="text-gray-600 mb-4">Username: DOC12345</p>
                    <button class="text-white px-4 py-2 rounded-full flex items-center bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">
                        <i class="fas fa-camera mr-2"></i> Change Picture
                    </button>
                </div>

                <!-- Personal Information Section -->
                <div class="md:w-2/3 p-8">
                    <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-user"></i>  Personal Information</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <p class="text-gray-900 font-semibold">Email</p>
                            <p class="text-gray-500 font-medium">marasingha@example.com</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Phone</p>
                            <p class="text-gray-500 font-medium">0716899444</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Date of Birth</p>
                            <p class="text-gray-500 font-medium">January 15, 2003</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Address</p>
                            <p class="text-gray-500 font-medium">123 Main St, Pittugala, Malabe</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Bio</p>
                            <p class="text-gray-500 font-medium">Highly respected cardiologist with over 15 years of experience in treating cardiovascular diseases.</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Languages</p>
                            <p class="text-gray-500 font-medium">English, Sinhala, Tamil</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Doctor Information -->
        <!-- <div class="mt-8 bg-white rounded-lg shadow-custom overflow-hidden">
            <div class="border-b">
                <p class="px-4 py-2 w-full text-center text-blue-600 bg-blue-50 border-b-2 border-blue-600">Public Details</p>
            </div>
            <div class="p-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-user-md" aria-hidden="true"></i> Doctor Information</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <p class="text-gray-900 font-semibold">Specialization:</p>
                            <p class="text-gray-500 font-medium">Cardiology</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">License Number:</p>
                            <p class="text-gray-500 font-medium">MED98765</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Years of Experience:</p>
                            <p class="text-gray-500 font-medium">15</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Public Bio:</p>
                            <p class="text-gray-500 font-medium">Highly respected cardiologist with over 15 years of experience in treating cardiovascular diseases.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div> -->

        <!-- Patient Information -->
        <div class="mt-8 bg-white rounded-lg shadow-custom overflow-hidden">
            <div class="border-b">
                <p class="px-4 py-2 w-full text-center text-blue-600 bg-blue-50 border-b-2 border-blue-600">Medical Details</p>
            </div>
            <div class="p-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-heartbeat"></i> Patient Information</h3>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div>
                            <p class="text-gray-900 font-semibold">Blood Type:</p>
                            <p class="text-gray-500 font-medium">A+</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Gender</p>
                            <p class="text-gray-500 font-medium">Male</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Allergies:</p>
                            <p class="text-gray-500 font-medium">Penicillin, Peanuts</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Medical History:</p>
                            <p class="text-gray-500 font-medium">Hypertension, Type 2 Diabetes</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Genetic Predispositions:</p>
                            <p class="text-gray-500 font-medium">Family history of cardiovascular disease</p>
                        </div>
                        <div>
                            <p class="text-gray-900 font-semibold">Special Notes:</p>
                            <p class="text-gray-500 font-medium">None</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Admin Information -->
         <!-- <div class="mt-8 bg-white rounded-lg shadow-custom overflow-hidden">
            <div class="border-b">
                <p class="px-4 py-2 w-full text-center text-blue-600 bg-blue-50 border-b-2 border-blue-600">Admin</p>
            </div>
            <div class="p-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-lock"></i> Admin Information</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <p class="text-gray-600">Role:</p>
                            <p class="text-gray-800 font-medium">System Admin</p>
                        </div>
                        <div>
                            <p class="text-gray-600">Access Level:</p>
                            <p class="text-gray-800 font-medium">Full</p>
                        </div>
                        <div>
                            <p class="text-gray-600">Date Joined:</p>
                            <p class="text-gray-800 font-medium">January 15, 2010</p>
                        </div>
                        <div>
                            <p class="text-gray-600">Public Bio:</p>
                            <p class="text-gray-800 font-medium">Highly respected cardiologist with over 15 years of experience in treating cardiovascular diseases.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div> -->

        <div class="bg-white rounded-lg shadow-custom p-6 mt-8">
            <h2 class="text-xl font-semibold text-gray-800 mb-4"><i class="fa fa-key" aria-hidden="true"></i> Change Password</h2>
            <form>
                <div class="space-y-4">
                    <div>
                        <label for="old-password" class="block text-sm font-medium text-gray-700 mb-1">Old Password</label>
                        <input type="password" id="old-password" name="old-password" 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            required>
                    </div>
                    <div>
                        <label for="new-password" class="block text-sm font-medium text-gray-700 mb-1">New Password</label>
                        <input type="password" id="new-password" name="new-password" 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            required>
                    </div>
                    <div>
                        <label for="confirm-password" class="block text-sm font-medium text-gray-700 mb-1">Confirm New Password</label>
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
            <button class="text-white px-6 py-2 rounded-lg bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer flex items-center mr-4">
                <i class="fas fa-edit mr-2"></i> Edit Profile
            </button>
            <button class="text-white px-6 py-2 rounded-lg bg-gradient-to-br from-red-600 to-red-700 hover:from-red-700 hover:to-red-600 transition ease-in-out duration-500 cursor-pointer flex items-center">
                <i class="fas fa-trash-alt mr-2"></i> Delete Account
            </button>
        </div>
    </div>

    <jsp:include page="/views/partials/footer.jsp"/>
</body>
</html>
