
document.getElementById("editDoctorForm").addEventListener("submit", function(event) {
    const phoneInput = document.getElementById("phonee").value;
    const errorElement = document.getElementById("errormsg");

    const phonePattern = 	/^(?:0|94|\+94)?(7[0-9]{8})$/;
	
	//phone number validation
    if(!phonePattern.test(phoneInput)) {
	  errorElement.style.display = "block";
      event.preventDefault(); // Prevent form submitting
	}else {
	  error.style.display = "none";
    }
  });