document.addEventListener("DOMContentLoaded", function() {
    const contactForm = document.querySelector(".contact-form");

    if (contactForm) {
        contactForm.addEventListener("submit", function(event) {
            event.preventDefault();
           
            let name = document.getElementById("name").value.trim();
            let email = document.getElementById("email").value.trim();
            let message = document.getElementById("message").value.trim();

            if (name === "" || email === "" || message === "") {
                alert("Please fill in all the fields.");
            } else {
                alert("Thank you! Your message has been sent successfully.");
                contactForm.reset();
            }
        });
    }
});