<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | HealthLanka</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/signUp.css">
</head>
<body class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <div class="form-container max-w-6xl w-full mx-auto p-8 sm:p-10">
        <div class="text-center mb-8">
            <a href="${pageContext.request.contextPath}">
                <img src="${pageContext.request.contextPath}/assets/images/Main-Logo.png" alt="logo" class="w-52 inline-block mb-2" />
            </a>
            <h2 class="text-3xl font-bold text-gray-800 mb-2">Join Our Community</h2>
            <p class="text-gray-600 max-w-md mx-auto">Create your account and start your journey with us today.</p>
        </div>

        <div class="flex flex-col md:flex-row gap-10">
            <!-- Left side - Form -->
            <div class="flex-1">
                <form id="regform" method="POST" oninput="comparepwd()" class="space-y-4">
                    <div class="grid sm:grid-cols-2 gap-x-8 gap-y-5">
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Full Name</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-user"></i></span>
                                <input name="name" type="text" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" placeholder="kasun perera" required />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Username</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-at"></i></span>
                                <input name="uname" type="text" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" placeholder="kasun123" required />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Email Address</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-envelope"></i></span>
                                <input name="email" type="email" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" placeholder="kasun@gmail.com" required />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Mobile Number</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-phone-alt"></i></span>
                                <input name="number" type="tel" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" placeholder="077 443 1234" required />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Date of Birth</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-calendar-alt"></i></span>
                                <input name="dob" type="date" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" required />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Address</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-home"></i></span>
                                <input name="address" type="text" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" placeholder="12 Main St, City, Country" required />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Password</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-lock"></i></span>
                                <input id="password" name="password" type="password" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" placeholder="••••••••" required />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Confirm Password</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-lock"></i></span>
                                <input id="cpassword" name="cpassword" type="password" class="input-field bg-white w-full text-gray-800 px-4 py-3 rounded-lg focus:outline-none" placeholder="••••••••" required />
                            </div>
                        </div>
                    </div>

                    <div class="mt-2">
                        <label class="inline-flex items-center">
                            <input type="checkbox" class="form-checkbox h-4 w-4 text-blue-600" required>
                            <span class="ml-2 text-sm text-gray-700">I agree to the <a href="#" class="text-blue-600 hover:underline">Terms of Service</a> and <a href="#" class="text-blue-600 hover:underline">Privacy Policy</a></span>
                        </label>
                    </div>
                    
                    <div id="pwdnotmatcherr" class="hidden p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400" role="alert">
					  <span class="font-medium">Alert!</span> The passwords you entered don't match. Please try again.
					</div>

                    <div class="mt-6">
                        <button id="submitbtn" type="submit" class="btn-primary w-full py-3 px-6 text-sm font-semibold rounded-lg text-white shadow-md bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">
                            Create Account
                        </button>
                    </div>
                </form>

                <div class="divider">
                    <span class="px-2 text-gray-500 text-sm">or sign up with</span>
                </div>

                <div class="grid grid-cols-3 gap-3 mt-4">
                    <button class="flex justify-center items-center py-3 px-4 border border-gray-300 rounded-lg shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                        <i class="fab fa-google text-red-500 mr-2"></i> Google
                    </button>
                    <button class="flex justify-center items-center py-3 px-4 border border-gray-300 rounded-lg shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                        <i class="fab fa-facebook-f text-blue-600 mr-2"></i> Facebook
                    </button>
                    <button class="flex justify-center items-center py-3 px-4 border border-gray-300 rounded-lg shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                        <i class="fab fa-apple text-gray-800 mr-2"></i> Apple
                    </button>
                </div>
            </div>

            <!-- Right side - Image and info -->
            <div class="flex-1 hidden md:block">
                <div class="h-full flex flex-col justify-center items-center bg-gradient-to-br from-blue-500 to-indigo-600 rounded-xl p-8 text-white">
                    <img src="${pageContext.request.contextPath}/assets/images/signup.png" alt="Sign up" class="w-64 mb-6" />
                    <h3 class="text-2xl font-bold mb-4">Welcome to Our Platform</h3>
                    <p class="text-center mb-6">Join thousands of users who trust our service for their daily needs.</p>
                    <div class="grid grid-cols-2 gap-4 w-full">
                        <div class="stats-card p-4 rounded-lg text-center">
                            <div class="text-xl font-bold mb-1">10k+</div>
                            <div class="text-sm">Active Users</div>
                        </div>
                        <div class="stats-card p-4 rounded-lg text-center">
                            <div class="text-xl font-bold mb-1">4.8/5</div>
                            <div class="text-sm">User Rating</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-8 text-center">
            <p class="text-sm text-gray-600">
                Already have an account?
                <a href="${pageContext.request.contextPath}/Signin" class="font-medium text-blue-600 hover:text-blue-500 focus:outline-none focus:underline transition ease-in-out duration-150">
                    Sign in
                </a>
            </p>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/signUp.js"></script>
</body>
</html>
