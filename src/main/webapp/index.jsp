<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HealthLanka</title>
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/Fav-Icon.png">
	<script src="${pageContext.request.contextPath}/assets/vendor/tailwind.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/homePage.css">
</head>
<body>

	<jsp:include page="/views/partials/header.jsp"/>
	
	<!--Landing Page Start-->
    <div class="flex items-center justify-center bg-gradient-to-br from-blue-200 to-blue-500 " style="height: 600px;">
      <div class="scroll-animate scroll-animate-left">
        <h3 class="text-xl font-semibold text-blue-800">Welcome to Health Lanka</h3>
        <h1 class="text-5xl text-gray-800 font-bold leading-normal ">Empowering Lives <br> through Transformative <br> Healthcare</h1>
        <button class="mt-8 text-white font-semibold pt-3 pb-3 pr-8 pl-8 text-xl bg-gradient-to-br rounded-full from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer scroll-animate scroll-animate-up delay-100"><a href="${pageContext.request.contextPath}/Patient">Make an Appointment</a></button>
      </div>
      <div class="flex scroll-animate scroll-animate-right delay-200">
        <div>
          <img src="${pageContext.request.contextPath}/assets/images/landing-page-image.png" alt="" class="ml-6 transition-transform duration-500 hover:scale-105" style="height: 500px;">
        </div>
      </div>
    </div>
  
    <!--Feature Content-->
    <div>
      <div class="flex justify-center bg-gray-200"  >
        <div class="w-80 text-center p-9 -mt-6 mb-10 bg-white shadow-2xl rounded-lg ml-8 mr-8 scroll-animate scroll-animate-up delay-100 hover:shadow-xl transition-all duration-500">
          <i class="fa fa-user-md text-5xl text-yellow-500 mb-4 transition-transform duration-500 hover:scale-110" aria-hidden="true"></i>
          <h3 class="text-xl mb-2 font-bold text-blue-800">Qualified Doctors</h3>
          <h5 class="text-lg font-semibold text-gray-800 mt-4">Developing whole individual is our goal. We have flexible, high-trust environment</h5>
        </div>

        <div class="w-80 text-center p-9 -mt-6 mb-10 bg-white rounded-lg shadow-2xl ml-8 mr-8 scroll-animate scroll-animate-up delay-200 hover:shadow-xl transition-all duration-500">
          <i class="fa fa-ambulance text-5xl text-green-500 mb-4 transition-transform duration-500 hover:scale-110" aria-hidden="true"></i>
          <h3 class="text-xl mb-2 font-bold text-blue-800">Emergency Services</h3>
          <h5 class="text-lg font-semibold text-gray-800 mt-4">The ambulance feature is now available even to middle class people, saving lives.</h5>
        </div>

        <div class="w-80 text-center p-9 -mt-6 mb-10 bg-white rounded-lg shadow-2xl ml-8 mr-8 scroll-animate scroll-animate-up delay-300 hover:shadow-xl transition-all duration-500">
          <i class="fa fa-tint text-5xl text-red-500 mb-4 transition-transform duration-500 hover:scale-110" aria-hidden="true"></i>
          <h3 class="text-xl mb-2 font-bold text-blue-800">Blood Bank</h3>
          <h5 class="text-lg font-semibold text-gray-800 mt-4">A licensed quality service technique applied with round the clock</h5>
        </div>
      </div>
    </div>
    
    <!--About Us Content-->
      <div class="flex justify-center items-center bg-gray-200 pt-8 pb-8">
        <div class="bg-gradient-to-br from-blue-700 to-blue-500 pt-12 pr-12 pl-12 rounded-tl-full rounded-full scroll-animate scroll-animate-left">
          <img src="${pageContext.request.contextPath}/assets/images/about-us-doctor-image.png" alt="" class="-mt-10 transition-transform duration-500 hover:scale-105" style="height: 500px;">
        </div>
        <div class="ml-28 scroll-animate scroll-animate-right delay-200" style="width: 500px;">
          <h3 class="text-xl font-semibold text-blue-800">25+ Year Of Experiences</h3>
          <h1 class="mt-4 text-4xl text-blue-800 font-bold">Welcome To Health Lanka</h1>
          <h3 class="mt-4 mb-8 text-lg text-justify">Welcome to <span class="font-semibold">Health Lanka</span>, where compassionate care meets medical excellence. Our dedicated team of doctors, nurses, and healthcare professionals work around the clock to provide quality treatment, advanced diagnostics, and personalized care to every patient.</h3>
          <a href="" class="text-lg font-semibold bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white mr-2 pt-2 pb-2 ">Book Now</a>
      </div>
    </div>

    <!--Our Services Section-->
      <div class="mt-8">
        <div class="scroll-animate scroll-animate-up">
          <h3 class="text-center text-xl text-blue-800 font-semibold mb-4">Services</h3>
          <h1 class="text-center text-5xl text-blue-700 font-semibold mb-6">Our Services</h1>
        </div>
        <div class="flex justify-center items-center mb-5">
          <div class="w-96 h-70 p-3 ml-6 mr-6 shadow-lg rounded-lg transform transition-all hover:scale-105 hover:shadow-xl cursor-pointer group hover:bg-gradient-to-br from-blue-500 to-blue-700 duration-500 scroll-animate scroll-animate-up delay-100">
            <div class="flex justify-center mb-2 mt-3">
              <i class="fa fa-plus-square text-6xl text-yellow-500 group-hover:text-white transition duration-400" aria-hidden="true"></i>
            </div>
            <div>
              <h2 class="text-center text-2xl font-bold text-blue-700 leading-normal group-hover:text-white transition duration-500">Specialized Treatments</h2>
              <p class="text-lg text-center mt-4 text-gray-700 group-hover:text-white transition duration-500">Expert care in fields like cardiology, neurology, orthopedics, dermatology, and more, tailored to meet specific medical needs.</p>
            </div>
          </div>

          <div class="w-96 h-70 p-3 ml-6 mr-6 shadow-lg rounded-lg transform transition-all hover:scale-105 hover:shadow-xl cursor-pointer group hover:bg-gradient-to-br from-blue-500 to-blue-700 duration-500 scroll-animate scroll-animate-up delay-200">
            <div class="flex justify-center mb-2 mt-3">
              <i class="fa fa-ambulance text-6xl text-yellow-500 group-hover:text-white transition duration-400" aria-hidden="true"></i>
            </div>
            <div>
              <h2 class="text-center text-2xl font-bold text-blue-700 leading-normal group-hover:text-white transition duration-500">Emergency & Urgent Care</h2>
              <p class="text-lg text-center mt-4 text-gray-700 group-hover:text-white transition duration-500">24/7 emergency services with a dedicated team of doctors and advanced medical equipment to provide immediate and life-saving treatments.</p>
            </div>
          </div>

          <div class="w-96 h-70 p-3 ml-6 mr-6 shadow-lg rounded-lg transform transition-all hover:scale-105 hover:shadow-xl cursor-pointer group hover:bg-gradient-to-br from-blue-500 to-blue-700 duration-500 scroll-animate scroll-animate-up delay-300">
            <div class="flex justify-center mb-2 mt-3">
              <i class="fa fa-flask text-6xl text-yellow-500 group-hover:text-white transition duration-400" aria-hidden="true"></i>
            </div>
            <div>
              <h2 class="text-center text-2xl font-bold text-blue-700 leading-normal group-hover:text-white transition duration-500">
                Diagnostic & Laboratory Services
              </h2>
              <p class="text-lg text-center mt-4 text-gray-700 group-hover:text-white transition duration-500">
                State-of-the-art imaging, blood tests, and diagnostic procedures to ensure accurate assessments and early disease detection.
              </p>
            </div>
          </div>
        </div>

        <div class="flex justify-center items-center mb-5">
          <div class="w-96 h-70 p-3 ml-6 mr-6 shadow-lg rounded-lg transform transition-all hover:scale-105 hover:shadow-xl cursor-pointer group hover:bg-gradient-to-br from-blue-500 to-blue-700 duration-500 scroll-animate scroll-animate-up delay-400">
            <div class="flex justify-center mb-2 mt-3">
              <i class="fa fa-medkit text-6xl text-yellow-500 group-hover:text-white transition duration-400" aria-hidden="true"></i>
            </div>
            <div>
              <h2 class="text-center text-2xl font-bold text-blue-700 leading-normal group-hover:text-white transition duration-500">Pharmacy Services</h2>
              <p class="text-lg text-center mt-4 text-gray-700 group-hover:text-white transition duration-500">On-site pharmacy providing prescribed medications, over-the-counter drugs, and expert advice to ensure safe and effective treatment.</p>
            </div>
          </div>

          <div class="w-96 h-70 p-3 ml-6 mr-6 shadow-lg rounded-lg transform transition-all hover:scale-105 hover:shadow-xl cursor-pointer group hover:bg-gradient-to-br from-blue-500 to-blue-700 duration-500 scroll-animate scroll-animate-up delay-500">
            <div class="flex justify-center mb-2 mt-3">
              <i class="fa fa-user-md text-6xl text-yellow-500 group-hover:text-white transition duration-400" aria-hidden="true"></i>
            </div>
            <div>
              <h2 class="text-center text-2xl font-bold text-blue-700 leading-normal group-hover:text-white transition duration-500">General Medicine</h2>
              <p class="text-lg text-center mt-4 text-gray-700 group-hover:text-white transition duration-500">Offering routine check-ups, diagnosis, and treatment for common health conditions, ensuring comprehensive primary care for patients of all ages.</p>
            </div>
          </div>

          <div class="w-96 h-70 p-3 ml-6 mr-6 shadow-lg rounded-lg transform transition-all hover:scale-105 hover:shadow-xl cursor-pointer group hover:bg-gradient-to-br from-blue-500 to-blue-700 duration-500 scroll-animate scroll-animate-up delay-600">
            <div class="flex justify-center mb-2 mt-3">
              <i class="fa fa-heartbeat text-6xl text-yellow-500 group-hover:text-white transition duration-400" aria-hidden="true"></i>
            </div>
            <div>
              <h2 class="text-center text-2xl font-bold text-blue-700 leading-normal group-hover:text-white transition duration-500">
                Mental Health & Counseling
              </h2>
              <p class="text-lg text-center mt-4 text-gray-700 group-hover:text-white transition duration-500">
                Professional psychological and psychiatric services to support mental well-being, including therapy sessions and stress management programs.
              </p>
            </div>
          </div>
        </div>
      </div>


    <!--Stats Section-->
      <div class="bg-blue-600 bg-opacity-80 pt-20 pb-20 mt-12">
        <div class="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-8 text-center text-white">
          
          <div class="scroll-animate scroll-animate-up delay-100">
            <div class="text-4xl mb-2 mr-2">
              <i class="fa fa-home text-4xl border-solid border-2 text-white-800 p-4 pr-5 pl-5 rounded-full hover:bg-white hover:text-blue-800 ease-in-out transition-all duration-500" aria-hidden="true"></i>
            </div>
            <div class="mt-4">
              <h2 class="text-4xl text font-bold">3468</h2>
              <h1 class="text-lg">Hospital Rooms</h1>
            </div>
          </div>

          <div class="scroll-animate scroll-animate-up delay-200">
            <div class="text-4xl mb-2">
              <i class="fa fa-user-md text-4xl border-solid border-2 text-white-800 p-4 pr-5 pl-5 rounded-full hover:bg-white hover:text-blue-800 ease-in-out transition-all duration-500" aria-hidden="true"></i>
            </div>
            <div class="mt-4">
              <h2 class="text-4xl text font-bold">557</h2>
              <p class="text-lg">Specialist Doctors</p>
            </div>
          </div>

          <div class="scroll-animate scroll-animate-up delay-300">
            <div class="text-4xl mb-2">
              <i class="fa fa-user-plus text-4xl border-solid border-2 text-white-800 p-4 rounded-full hover:bg-white hover:text-blue-800 ease-in-out transition-all duration-500" aria-hidden="true"></i>
            </div>
            <div class="mt-4">
              <h2 class="text-4xl text font-bold">4379</h2>
              <p class="text-lg">Happy Patients</p>
            </div>
          </div>

          <div class="scroll-animate scroll-animate-up delay-400">
            <div class="text-4xl mb-2">
              <i class="fa fa-hospital-o text-4xl border-solid border-2 text-white-800 p-4 pr-5 pl-5 rounded-full hover:bg-white hover:text-blue-800 ease-in-out transition-all duration-500" aria-hidden="true"></i>
            </div>
            <div class="mt-4">
              <h2 class="text-4xl text font-bold">25</h2>
              <p class="text-lg">Years of Experience</p>
            </div>
          </div>

        </div>
      </div>
    
      <!--Doctor Section-->

      <div class="mt-10">
        <div class="scroll-animate scroll-animate-up">
          <h3 class="text-center text-xl text-blue-800 font-semibold mb-2">Doctors</h3>
          <h1 class="text-center text-5xl text-blue-700 font-semibold mb-6">Meet Our Specialist</h1>
        </div>

        <div>
          <div class="flex justify-center items-center">
            <div class="shadow-2xl p-4 rounded-lg m-6 scroll-animate scroll-animate-up delay-100 transform transition-all hover:scale-105 duration-500" style="width: 240px;">
              <div class="bg-gradient-to-br from-blue-700 to-blue-500 rounded-tl-full rounded-tr-full flex justify-center pt-4" style="width: 210px;">
                <img src="${pageContext.request.contextPath}/assets/images/doctor-02.png" alt="" style="height: 200px;" class="-mt-8 transition-transform duration-500 hover:scale-105">
              </div>
              <div>
                <h3 class="text-center text-lg font-semibold mt-2 text-blue-700">Dr. Moditha Marasinghe</h3>
                <h2 class="text-center text-lg font-semibold">Cardiologist</h2>
                <div class="flex justify-center mt-2">
                  <a href="" class="text-lg text-center font-semibold bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white mr-2 pt-1 pb-1">Book Now</a>
                </div>
              </div>
            </div>

            <div class="shadow-2xl p-4 rounded-lg m-6 scroll-animate scroll-animate-up delay-200 transform transition-all hover:scale-105 duration-500" style="width: 240px;">
              <div class="bg-gradient-to-br from-blue-700 to-blue-500 rounded-tl-full rounded-tr-full flex justify-center pt-4" style="width: 210px;">
                <img src="${pageContext.request.contextPath}/assets/images/doctor-02.png" alt="" style="height: 200px;" class="-mt-8 transition-transform duration-500 hover:scale-105">
              </div>
              <div>
                <h3 class="text-center text-lg font-semibold mt-2 text-blue-700">Dr. Hasindu Chanuka</h3>
                <h2 class="text-center text-lg font-semibold">Neurology</h2>
                <div class="flex justify-center mt-2">
                  <a href="" class="text-lg text-center font-semibold bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white mr-2 pt-1 pb-1">Book Now</a>
                </div>
              </div>
            </div>

            <div class="shadow-2xl p-4 rounded-lg m-6 scroll-animate scroll-animate-up delay-300 transform transition-all hover:scale-105 duration-500" style="width: 240px;">
              <div class="bg-gradient-to-br from-blue-700 to-blue-500 rounded-tl-full rounded-tr-full flex justify-center pt-4" style="width: 210px;">
                <img src="${pageContext.request.contextPath}/assets/images/doctor-02.png" alt="" style="height: 200px;" class="-mt-8 transition-transform duration-500 hover:scale-105">
              </div>
              <div>
                <h3 class="text-center text-lg font-semibold mt-2 text-blue-700">Dr. Sharuka Sunthush</h3>
                <h2 class="text-center text-lg font-semibold">Dermatology</h2>
                <div class="flex justify-center mt-2">
                  <a href="" class="text-lg text-center font-semibold bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white mr-2 pt-1 pb-1">Book Now</a>
                </div>
              </div>
            </div>

            <div class="shadow-2xl p-4 rounded-lg m-6 scroll-animate scroll-animate-up delay-400 transform transition-all hover:scale-105 duration-500" style="width: 240px;">
              <div class="bg-gradient-to-br from-blue-700 to-blue-500 rounded-tl-full rounded-tr-full flex justify-center pt-4" style="width: 210px;">
                <img src="${pageContext.request.contextPath}/assets/images/doctor-01.png" alt="" style="height: 180px;"  class="-mt-8 transition-transform duration-500 hover:scale-105">
              </div>
              <div>
                <h3 class="text-center text-lg font-semibold mt-2 text-blue-700">Dr. Anjalee Samarasinghe</h3>
                <h2 class="text-center text-lg font-semibold">Cardiologist</h2>
                <div class="flex justify-center mt-2">
                  <a href="" class="text-lg text-center font-semibold bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded text-white mr-2 pt-1 pb-1">Book Now</a>
                </div>
              </div>
            </div>
          </div>
          

      <!--Contact Us-->

      <div class="flex justify-center items-center scroll-animate scroll-animate-up delay-100">
        <div class="bg-gradient-to-br from-blue-200 to-blue-300 pt-12 pl-10 pr-28 pb-12 rounded-3xl mt-20 mb-20 transform transition-all hover:scale-[1.02] duration-500" style="width: 1100px;">
          <h3 class="text-xl text font-semibold mb-2">Get in Touch</h3>
          <h1 class="text-5xl text-blue-900 font-semibold mb-6">Contact Us For Exceptional Care</h1>
          <h4 class="text-lg text-blue-500 font-semibold mb-8">We are here to address your healthcare needs and answer your questions</h4>
          <a href="${pageContext.request.contextPath}/ContactUs" class="text-lg font-semibold bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer px-3 py-1 rounded-2xl text-white mr-2 pt-3 pb-3 pl-6 pr-6">Contact Us</a>
        </div>
      </div>
	<jsp:include page="/views/partials/footer.jsp"/>
	<script src="${pageContext.request.contextPath}/assets/js/homePage.js"></script>
</body>
</html>