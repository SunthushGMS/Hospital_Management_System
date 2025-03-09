<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Sign Up</title>
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>
<body>
	<div class="max-w-4xl max-sm:max-w-lg mx-auto p-6">
      <div class="text-center mb-8 mt-7 sm:mb-10">
        <a href="${pageContext.request.contextPath}"><img
          src="${pageContext.request.contextPath}/assets/images/Main-Logo.png" alt="logo" class='w-48 inline-block' />
        </a>
        <h2 class="mt-6 text-center text-3xl leading-9 font-extrabold text-gray-900">
            Create a new account
        </h2>
        <p class="mt-2 text-center text-sm leading-5 text-gray-500 max-w">
            Or
            <a href="${pageContext.request.contextPath}/Signin"
                class="font-medium text-blue-600 hover:text-blue-500 focus:outline-none focus:underline transition ease-in-out duration-150">
                login to your account
            </a>
        </p>
      </div>

      <form method="POST">
        <div class="grid sm:grid-cols-2 gap-6">
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Full Name</label>
            <input name="name" type="text" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" placeholder="Enter name" />
          </div>
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Username</label>
            <input name="uname" type="text" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" placeholder="Enter username" />
          </div>
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Email Id</label>
            <input name="email" type="text" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" placeholder="Enter email" />
          </div>
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Mobile No.</label>
            <input name="number" type="number" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" placeholder="Enter mobile number" />
          </div>
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Address</label>
            <input name="address" type="text" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" placeholder="Enter address" />
          </div>
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Date of Birth</label>
            <input name="dob" type="date" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" />
          </div>
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Password</label>
            <input name="password" type="password" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" placeholder="Enter password" />
          </div>
          <div>
            <label class="text-sm font-medium text-gray-700 mb-2 block">Confirm Password</label>
            <input name="cpassword" type="password" class="bg-gray-100 w-full text-gray-800 text-sm px-4 py-3 rounded-md focus:bg-transparent outline-blue-600 transition-all" placeholder="Enter confirm password" />
          </div>
        </div>

        <div class="mt-8">
          <button type="submit" class="mx-auto block py-3 px-6 tracking-wider text-sm font-semibold rounded text-white bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer focus:outline-none">
            Sign up
          </button>
        </div>
      </form>
    </div>
</body>
</html>