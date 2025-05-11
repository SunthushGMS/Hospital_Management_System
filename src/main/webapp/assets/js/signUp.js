//compare password inputs.
function comparepwd(){
	
	var form = document.getElementById("regform");
	var submitbtn = document.getElementById("submitbtn");
	var error = document.getElementById("pwdnotmatcherr");
	const errorText = document.getElementById("errortext");
	
	var password = form.password.value;
	var passwordagain = form.cpassword.value

	if(passwordagain !== "" && password !== passwordagain){
		
		error.style.display = "block";
		errorText.textContent = "Passwords do not match. Please re-enter the same password in both fields.";
		submitbtn.disabled = true;
	}
	else{
		submitbtn.disabled = false;
		error.style.display = "none";
	}
}

//input validation
document.getElementById("regform").addEventListener("submit", function(event) {
    const phoneInput = document.getElementById("phonenum").value;
    const errorElement = document.getElementById("pwdnotmatcherr");
	const errorText = document.getElementById("errortext");
	const birthdayInput = document.getElementById("bday").value;
	const selectedDate = new Date(birthdayInput);
	const today = new Date();
	
	today.setHours(0, 0, 0, 0);

    const phonePattern = 	/^(?:0|94|\+94)?(7[0-9]{8})$/;
	
	//phone number validation
    if(!phonePattern.test(phoneInput)) {
	  errorElement.style.display = "block";
      errorText.textContent = "Please enter a valid 10-digit phone number.";
      event.preventDefault(); // Prevent form submitting
	 
	  //birthday validation 
    }else if(selectedDate > today){
		errorElement.style.display = "block";
		errorText.textContent = "Birthday cannot be in the future.";
		event.preventDefault();
	}else {
	  error.style.display = "none";
    }
  });