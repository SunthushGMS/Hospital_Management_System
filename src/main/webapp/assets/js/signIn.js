//Show Password Function
document.getElementById("show-pwd").addEventListener("change", function () {
    const passwordInput = document.getElementById("password");
    passwordInput.type = this.checked ? "text" : "password";
});
