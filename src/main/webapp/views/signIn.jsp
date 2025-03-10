<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | HealthLanka</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
    <script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9fafb;
        }
        .login-container {
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
        }
        .input-group {
            position: relative;
        }
        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
        }
        .input-field {
            padding-left: 2.75rem !important;
            transition: all 0.3s ease;
            border: 1px solid #e5e7eb;
            height: 50px;
            font-size: 0.95rem;
        }
        .input-field:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }
        .btn-primary {
            transition: transform 0.2s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
        }
        .social-btn {
            transition: all 0.3s ease;
        }
        .social-btn:hover {
            transform: translateY(-3px);
            filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
        }
        .left-panel {
            background: linear-gradient(135deg, #3b82f6 0%, #1e40af 100%);
            border-radius: 16px;
            position: relative;
            overflow: hidden;
        }
        .left-panel::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 60%);
            z-index: 0;
        }
        .left-panel-content {
            position: relative;
            z-index: 1;
        }
        .heart-pulse {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }
        .feature-icon {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
    <div class="login-container max-w-6xl w-full mx-auto">
        <div class="grid md:grid-cols-2 items-stretch">
            <!-- Left Panel -->
            <div class="left-panel p-8 text-white hidden md:block">
                <div class="left-panel-content h-full flex flex-col">
                    <div class="mb-8 pt-8">
                        <h2 class="text-2xl font-bold mb-2">Welcome Back!</h2>
                        <p class="text-white text-opacity-90">Access your HealthLanka dashboard to manage patient care and hospital operations.</p>
                    </div>
                    
                    <div class="flex-grow flex flex-col justify-center items-center">
                        <div class="heart-pulse mb-6">
                            <img src="${pageContext.request.contextPath}/assets/images/heart.png" class="w-32 h-32 object-contain" alt="Healthcare" />
                        </div>
                        
                        <div class="w-full max-w-sm">
                            <h3 class="font-semibold mb-4">Why HealthLanka?</h3>
                            
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-shield-alt text-sm"></i>
                                </div>
                                <span>Secure & HIPAA Compliant</span>
                            </div>
                            
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-chart-line text-sm"></i>
                                </div>
                                <span>Real-time Analytics</span>
                            </div>
                            
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <i class="fas fa-users text-sm"></i>
                                </div>
                                <span>Patient-centered Care</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-auto pt-6 text-sm text-white text-opacity-80">
                        <p>© 2025 HealthLanka. All rights reserved.</p>
                    </div>
                </div>
            </div>
            
            <!-- Right Panel - Login Form -->
            <div class="p-8 md:p-10">
                <div class="max-w-md mx-auto">
                    <div class="text-center md:text-left mb-8">
                        <img src="${pageContext.request.contextPath}/assets/images/Main-Logo.png" alt="HealthLanka" class="h-12 mb-6 md:hidden mx-auto" />
                        <h1 class="text-gray-800 text-3xl font-bold">Sign In</h1>
                        <p class="text-gray-600 mt-2">Access your account to continue</p>
                    </div>
                    
                    <form action="${pageContext.request.contextPath}/LoginFormController" method="POST" class="space-y-6">
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Username or Email</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-user"></i></span>
                                <input name="username" type="text" autocomplete="username" required class="input-field bg-white w-full px-4 py-3 rounded-lg focus:outline-none" placeholder="Enter your username" />
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="text-sm font-medium text-gray-700 mb-1 block">Password</label>
                            <div class="relative">
                                <span class="input-icon"><i class="fas fa-lock"></i></span>
                                <input id="password" name="password" type="password" autocomplete="current-password" required class="input-field bg-white w-full px-4 py-3 rounded-lg focus:outline-none" placeholder="Enter your password" />
                            </div>
                        </div>
                        
                        <div class="flex items-center justify-between">
                            <div class="flex items-center">
                                <input id="show-pwd" type="checkbox" class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded" />
                                <label for="show-pwd" class="ml-2 block text-sm text-gray-700">
                                    Show Password
                                </label>
                            </div>
                            <div class="text-sm">
                                <a href="#" class="font-medium text-blue-600 hover:text-blue-500">
                                    Forgot password?
                                </a>
                            </div>
                        </div>
                        
                        <div>
                            <button type="submit" class="btn-primary w-full py-3 px-6 text-sm font-semibold rounded-lg text-white shadow-md bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">
                                Sign In
                            </button>
                        </div>
                    </form>
                    
                    <div class="mt-8 flex items-center gap-4">
                        <hr class="flex-grow border-gray-300" />
                        <span class="text-sm text-gray-500">or continue with</span>
                        <hr class="flex-grow border-gray-300" />
                    </div>
                    
                    <div class="mt-6 grid grid-cols-3 gap-3">
                        <button type="button" class="social-btn flex justify-center items-center py-2 px-4 border border-gray-300 rounded-lg shadow-sm bg-white">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" viewBox="0 0 512 512">
                                <path fill="#fbbd00" d="M120 256c0-25.367 6.989-49.13 19.131-69.477v-86.308H52.823C18.568 144.703 0 198.922 0 256s18.568 111.297 52.823 155.785h86.308v-86.308C126.989 305.13 120 281.367 120 256z" data-original="#fbbd00" />
                                <path fill="#0f9d58" d="m256 392-60 60 60 60c57.079 0 111.297-18.568 155.785-52.823v-86.216h-86.216C305.044 385.147 281.181 392 256 392z" data-original="#0f9d58" />
                                <path fill="#31aa52" d="m139.131 325.477-86.308 86.308a260.085 260.085 0 0 0 22.158 25.235C123.333 485.371 187.62 512 256 512V392c-49.624 0-93.117-26.72-116.869-66.523z" data-original="#31aa52" />
                                <path fill="#3c79e6" d="M512 256a258.24 258.24 0 0 0-4.192-46.377l-2.251-12.299H256v120h121.452a135.385 135.385 0 0 1-51.884 55.638l86.216 86.216a260.085 260.085 0 0 0 25.235-22.158C485.371 388.667 512 324.38 512 256z" data-original="#3c79e6" />
                                <path fill="#cf2d48" d="m352.167 159.833 10.606 10.606 84.853-84.852-10.606-10.606C388.668 26.629 324.381 0 256 0l-60 60 60 60c36.326 0 70.479 14.146 96.167 39.833z" data-original="#cf2d48" />
                                <path fill="#eb4132" d="M256 120V0C187.62 0 123.333 26.629 74.98 74.98a259.849 259.849 0 0 0-22.158 25.235l86.308 86.308C162.883 146.72 206.376 120 256 120z" data-original="#eb4132" />
                            </svg>
                        </button>
                        <button type="button" class="social-btn flex justify-center items-center py-2 px-4 border border-gray-300 rounded-lg shadow-sm bg-white">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" viewBox="0 0 512 512">
                                <path fill="#1877f2" d="M512 256c0 127.78-93.62 233.69-216 252.89V330h59.65L367 256h-71v-48.02c0-20.25 9.92-39.98 41.72-39.98H370v-63s-29.3-5-57.31-5c-58.47 0-96.69 35.44-96.69 99.6V256h-65v74h65v178.89C93.62 489.69 0 383.78 0 256 0 114.62 114.62 0 256 0s256 114.62 256 256z" data-original="#1877f2" />
                                <path fill="#fff" d="M355.65 330 367 256h-71v-48.021c0-20.245 9.918-39.979 41.719-39.979H370v-63s-29.296-5-57.305-5C254.219 100 216 135.44 216 199.6V256h-65v74h65v178.889c13.034 2.045 26.392 3.111 40 3.111s26.966-1.066 40-3.111V330z" data-original="#ffffff" />
                            </svg>
                        </button>
                        <button type="button" class="social-btn flex justify-center items-center py-2 px-4 border border-gray-300 rounded-lg shadow-sm bg-white">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" viewBox="0 0 22.773 22.773">
                                <path d="M15.769 0h.162c.13 1.606-.483 2.806-1.228 3.675-.731.863-1.732 1.7-3.351 1.573-.108-1.583.506-2.694 1.25-3.561C13.292.879 14.557.16 15.769 0zm4.901 16.716v.045c-.455 1.378-1.104 2.559-1.896 3.655-.723.995-1.609 2.334-3.191 2.334-1.367 0-2.275-.879-3.676-.903-1.482-.024-2.297.735-3.652.926h-.462c-.995-.144-1.798-.932-2.383-1.642-1.725-2.098-3.058-4.808-3.306-8.276v-1.019c.105-2.482 1.311-4.5 2.914-5.478.846-.52 2.009-.963 3.304-.765.555.086 1.122.276 1.619.464.471.181 1.06.502 1.618.485.378-.011.754-.208 1.135-.347 1.116-.403 2.21-.865 3.652-.648 1.733.262 2.963 1.032 3.723 2.22-1.466.933-2.625 2.339-2.427 4.74.176 2.181 1.444 3.457 3.028 4.209z" data-original="#000000"></path>
                            </svg>
                        </button>
                    </div>
                    
                    <div class="mt-8 text-center">
                        <p class="text-sm text-gray-600">
                            Don't have an account?
                            <a href="${pageContext.request.contextPath}/SignUp" class="font-medium text-blue-600 hover:text-blue-500 focus:outline-none focus:underline transition ease-in-out duration-150">
                                Create an account
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/signIn.js"></script>
</body>
</html>
