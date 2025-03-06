<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>Insert title here</title>
</head>
<body>
  <footer>
    <div class="flex justify-center bg-gray-50 pr-10 pl-10 pt-10 pb-10">
      <div class="flex-shrink mr-10">
        <img src="${pageContext.request.contextPath}/assets/images/Main-Logo.png" alt="" class="w-50 h-15">
      </div>
      <div class="flex justify-between">
        <div class="ml-12 mr-12 w-30">
          <ul>
            <li><h4 class="font-bold leading-loose text-yellow-500">RESOURCES</h4></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">Doctors</a></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">Clinics</a></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">Appoiments</a></li>
          </ul>
        </div>
        <div class="ml-12 mr-12 w-30">
          <ul>
            <li><h4 class="font-bold leading-loose text-yellow-500">CONTACT</h4></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">About Us</a></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">Contact Us</a></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">Newsletter</a></li>
          </ul>
        </div>
        <div class="ml-12 mr-12 w-40">
          <ul>
            <li><h4 class="font-bold leading-loose text-yellow-500">LEGAL</h4></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">Terms & Conditions</a></li>
            <li><a href="" class="font-semibold text-gray-400 leading-loose hover:text-blue-700">Privacy Policy</a></li>
            
          </ul>
        </div>
        <div class=" ml-10">
          <h4 class="font-bold leading-loose text-yellow-500 leading-loose">Subscribe</h4>
          <input type="text" placeholder="Enter email" class="w-50 pl-2 font-semibold text-gray-400 border border-solid border-2 border-blue-500 rounded-lg h-8 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent ">
          <button class="ml-5 rounded-lg leading-loose text-sm text-white font-medium pt-1 pb-1 pl-3 pr-3 rounded bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Submit</button>
        </div>
      </div>
    </div>
    <div class="flex justify-center bg-gray-100 pr-10 pl-10 pt-5 pb-5">
      <div>
        <h4 class="text-gray-400">&#169 2025 Health Lanka &#8482 .All Right Reserved</h4>
      </div>
      <div class="ml-30">
        <a href="#" class="fa fa-facebook text-gray-700 ml-5 mr-5 hover:text-blue-700" ></a>
        <a href="#" class="fa fa-instagram text-gray-700 ml-5 mr-5 hover:text-purle-700" ></a>
        <a href="#" class="fa fa-linkedin text-gray-700 ml-5 mr-5 hover:text-blue-700" ></a>
        <a href="#" class="fa fa-twitter text-gray-700 ml-5 mr-5 hover:text-blue-700" ></a>
        <a href="#" class="fa fa-whatsapp text-gray-700 ml-5 mr-5 hover:text-green-700" ></a>
      </div>
    </div>
  </footer>
  
</body>
</html>