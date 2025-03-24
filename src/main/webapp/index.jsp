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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/homePage.css">
</head>
<body>

	<jsp:include page="/views/partials/header.jsp"/>
	
	<!--Section One Started-->
	<div class="flex justify-center bg-gradient-to-br from-blue-100 to-blue-400 min-h-screen items-center overflow-hidden">
		<div class="flex justify-between items-center">
			<div class="ml-20 scroll-animate scroll-animate-left">
				<h4 class="text-6xl font-semibold mb-10 leading-normal">Bringing You Closer to <br> Better Health.</h4>
				<button class="text-white font-semibold pt-3 pb-3 pr-4 pl-4 text-xl bg-gradient-to-br rounded-lg from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer scroll-animate scroll-animate-up delay-100">Book Now</button>
			</div>
			<div class="scroll-animate scroll-animate-right delay-200"><img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="h-150 w-150"></div>
		</div>
	</div>
	<!-- Section One Ended -->

	<!-- Section Two Started -->
	<div class="flex justify-center min-h-screen overflow-hidden">
		<div class="flex justify-between items-center">
			<div class="mr-30 scroll-animate scroll-animate-left">
				<img src="${pageContext.request.contextPath}/assets/images/landing-page-about-us.png" alt="" class="h-150 w-150">
			</div>
			<div class="w-160 scroll-animate scroll-animate-right delay-200">
				<h3 class="text-5xl text-blue-500 font-semibold mb-5 leading-normal">About HealthLanka</h3>
				<p class="text-lg font-semibold text-grey-400">
					At HealthLanka, we are committed to providing compassionate, high-quality healthcare that puts patients first. Our state-of-the-art facilities, advanced medical technologies, and dedicated team of healthcare professionals ensure that every patient receives the best possible care.
					<br> <br>
					Whether you need routine check-ups, specialized treatments, or emergency medical attention, we offer a wide range of services designed to meet your health needs. With a patient-centered approach, we strive to make healthcare accessible, efficient, and reassuring for everyone.
					<br> <br>
					Your health is our priority, and we are here to guide you on your journey to wellness with trust, care, and excellence.
				</p>
			</div>	
		</div>
	</div>
	<!-- Section Two Ended -->

	<!-- Section Three Started -->
	 <div class="flex justify-center min-h-screen overflow-hidden">
		<div class="">
			<div class="scroll-animate scroll-animate-up">
				<h3 class="text-5xl text-blue-500 font-semibold mb-5 leading-normal text-center">Our Services</h3>
			</div>
			<div>
				<div class="flex">
					<div class="service-card w-100 pt-8 pb-8 pl-4 pr-4 border-blue-100 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl cursor-pointer border-t-4 border-blue-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-blue-100 to-blue-50 hover:text-blue-500 scroll-animate scroll-animate-up delay-100">
						<h2 class="text-center text-2xl font-bold text-yellow-500 leading-normal">Specialized Treatments</h2>
						<p class="text-md text-gray-700 font-medium text-center mt-4">Expert care in fields like cardiology, neurology, orthopedics, dermatology, and more, tailored to meet specific medical needs.</p>
					</div>

					<div class="service-card w-100 pt-8 pb-8 pl-4 pr-4 border-blue-100 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl cursor-pointer border-t-4 border-blue-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-blue-100 to-blue-50 hover:text-blue-500 scroll-animate scroll-animate-up delay-200">
						<h2 class="text-center text-2xl font-bold text-yellow-500 leading-normal">Emergency & Urgent Care</h2>
						<p class="text-md text-gray-700 font-medium text-center mt-4">24/7 emergency services with a dedicated team of doctors and advanced medical equipment to provide immediate and life-saving treatments.</p>
					</div>

					<div class="service-card w-100 pt-8 pb-8 pl-4 pr-4 border-blue-100 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl cursor-pointer border-t-4 border-blue-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-blue-100 to-blue-50 hover:text-blue-500 scroll-animate scroll-animate-up delay-300">
						<h2 class="text-center text-2xl font-bold text-yellow-500 leading-normal">Diagnostic & Laboratory Services</h2>
						<p class="text-md text-gray-700 font-medium text-center mt-4">State-of-the-art imaging, blood tests, and diagnostic procedures to ensure accurate assessments and early disease detection.</p>
					</div>
				</div>
				
				<div class="flex">
					<div class="service-card w-100 pt-8 pb-8 pl-4 pr-4 border-blue-100 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl cursor-pointer border-t-4 border-blue-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-blue-100 to-blue-50 hover:text-blue-500 scroll-animate scroll-animate-up delay-100">
						<h2 class="text-center text-2xl font-bold text-yellow-500 leading-normal">Pharmacy Services</h2>
						<p class="text-md text-gray-700 font-medium text-center mt-4">On-site pharmacy providing prescribed medications, over-the-counter drugs, and expert advice to ensure safe and effective treatment.</p>
					</div>

					<div class="service-card w-100 pt-8 pb-8 pl-4 pr-4 border-blue-100 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl cursor-pointer border-t-4 border-blue-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-blue-100 to-blue-50 hover:text-blue-500 scroll-animate scroll-animate-up delay-200">
						<h2 class="text-center text-2xl font-bold text-yellow-500 leading-normal">General Medicine</h2>
						<p class="text-md text-gray-700 font-medium text-center mt-4">Offering routine check-ups, diagnosis, and treatment for common health conditions, ensuring comprehensive primary care for patients of all ages.</p>
					</div>

					<div class="service-card w-100 pt-8 pb-8 pl-4 pr-4 border-blue-100 w-1/5 mr-10 ml-10 mt-10 rounded-lg shadow-2xl cursor-pointer border-t-4 border-blue-500 transform transition-all hover:scale-105 hover:shadow-xl hover:bg-gradient-to-br from-blue-100 to-blue-50 hover:text-blue-500 scroll-animate scroll-animate-up delay-300">
						<h2 class="text-center text-2xl font-bold text-yellow-500 leading-normal">Mental Health & Counseling</h2>
						<p class="text-md text-gray-700 font-medium text-center mt-4">Professional psychological and psychiatric services to support mental well-being, including therapy sessions and stress management programs.</p>
					</div>
				</div>
			</div>
		</div>
	 </div>
	<!-- Section Three Ended -->

	<!--Section Four Started-->
	<div class="flex justify-center bg-gradient-to-br from-yellow-100 to-yellow-400 min-h-screen items-center overflow-hidden">
		<div class="flex justify-between items-center">
			<div class="scroll-animate scroll-animate-left"><img src="${pageContext.request.contextPath}/assets/images/bookDoctor-Section-image-01.png" alt="" class="h-150 w-150"></div>
			<div class="ml-20 scroll-animate scroll-animate-right delay-200">
				<h4 class="text-6xl font-semibold mb-10 leading-normal">Take the First Step to <br>Better Health</h4>
				<button class="text-white font-semibold pt-3 pb-3 pr-4 pl-4 text-xl bg-gradient-to-br rounded-lg from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer scroll-animate scroll-animate-up delay-300">Make an Appointement</button>
			</div>
		</div>
	</div>
	<!-- Section four Ended -->

	<!-- Section Five Started-->
	 <div class="flex justify-center min-h-screen overflow-hidden mt-20">
		<div>
			<div class="flex justify-center mb-20 scroll-animate scroll-animate-up">
				<h2 class="text-5xl text-blue-500 font-semibold">Meet Our Specialists</h2>
			</div>

			<div class="flex flex-wrap justify-center mt-10">
				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-100">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>

				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-200">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>

				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-300">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>

				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-400">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>

				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-100">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>

				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-200">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>

				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-300">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>

				<div class="p-4 shadow-2xl w-70 rounded-xl mr-4 ml-4 mt-4 mb-4 scroll-animate scroll-animate-scale delay-400">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-60 h-60 mb-5">
					<h3 class="text-lg font-semibold text-gray-700 text-center">Dr.Moditha Marasingha</h3>
					<h4 class="text-md font-semibold text-grey-200 text-center">Cardiologist</h4>
					<div class="flex justify-center">
						<a href="" class="text-white pt-2 pb-2 pl-3 pr-3 rounded-lg mt-4 bg-gradient-to-br from-blue-500 to-blue-600 hover:from-blue-600 hover:to-blue-500 transition ease-in-out duration-500 cursor-pointer">Book Now</a>
					</div>
				</div>
			</div>
		</div>
	 </div>
	<!-- Section Five Ended -->
	
	<!-- Section Six Started-->
	 <div class="flex justify-center min-h-screen items-center overflow-hidden mt-20">
		<div>
			<div class="flex justify-center scroll-animate scroll-animate-up">
				<h4 class="text-5xl text-blue-500 font-semibold">Contact Us</h4>
			</div>
			<div class="flex flex-wrap justify-center items-center mt-15 mb-15">
				<div class="mb-20 scroll-animate scroll-animate-left">
					<img src="${pageContext.request.contextPath}/assets/images/landing-page-image-01.png" alt="" class="w-150 h-150">
				</div>

				<div class="shadow-2xl p-4 bg-gray-50 scroll-animate scroll-animate-right delay-200">
					<form action="">
						<div class="flex">
							<div class="flex flex-col m-5">
								<label for="" class="mb-3">First Name</label>
								<input type="text" class="w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="example@gmail.com">
							</div>
							<div class="flex flex-col m-5">
								<label for="" class="mb-3">Last Name</label>
								<input type="text" class="w-60 h-10 p-2 rounded-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="example@gmail.com">
							</div>
						</div>
						<div class="flex flex-col m-5">
							<label for="" class="mb-3">Email</label>
							<input type="text" class="w-60 h-10 p-2 rounded-lg min-w-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="example@gmail.com">
						</div>

						<div class="flex flex-col m-5">
							<label for="" class="mb-3">Message</label>
							<textarea name="" id="" rows="8" class="p-2 rounded-lg min-w-lg shadow-inner focus:outline-none focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="example@gmail.com"></textarea>
						</div>
					</form>
				</div>
			</div>
		</div>
	 </div>
	<!-- Section Six Ended-->
	<jsp:include page="/views/partials/footer.jsp"/>
	<script src="${pageContext.request.contextPath}/assets/js/homePage.js"></script>
</body>
</html>