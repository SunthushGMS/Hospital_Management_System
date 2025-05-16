document.querySelector(".book-appoint").addEventListener("submit", function(event) {
        const appointDateInput = document.getElementById("date");
        const appointDate = new Date(appointDateInput.value);
        const today = new Date();
        today.setHours(0, 0, 0, 0); 

        const errorElement = document.getElementById("date-error"); 

        if (appointDate < today) {
            event.preventDefault();
            errorElement.style.display = "block";
            errorElement.textContent = "Invalid appointment date!";
        } else {
            errorElement.style.display = "none";
        }
    });