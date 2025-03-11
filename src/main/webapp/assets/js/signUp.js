//compare password inputs.
function comparepwd(){
	
	var form = document.getElementById("regform");
	var submitbtn = document.getElementById("submitbtn");
	var error = document.getElementById("pwdnotmatcherr");
	
	var password = form.password.value;
	var passwordagain = form.cpassword.value

	if(passwordagain !== "" && password !== passwordagain){
		
		error.style.display = "block";
		submitbtn.disabled = true;
	}
	else{
		submitbtn.disabled = false;
		error.style.display = "none";
	}
}