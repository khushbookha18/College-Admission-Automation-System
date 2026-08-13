document.addEventListener("DOMContentLoaded", () => {
    const counters = document.querySelectorAll('.stat-number');

    counters.forEach(counter => {
        const target = +counter.getAttribute('data-target');

        let count = 0;
        const speed = 200;

        const update = () => {
            const increment = target / speed;

            if (count < target) {
                count += increment;
                counter.innerText = Math.ceil(count);
                requestAnimationFrame(update);
            } else {
                counter.innerText = target;
            }
        };

        update();
    });
});


/// ================= CHATBOT CODE =================

document.addEventListener("DOMContentLoaded", function () {

    const icon = document.getElementById("chatbot-icon");
    const box = document.getElementById("chatbot-box");
    const input = document.getElementById("chat-input");
    const chat = document.getElementById("chat-content");

    // safety check (VERY IMPORTANT)
    if (!icon || !box || !input || !chat) {
        console.log("Chatbot elements not found");
        return;
    }

    // CLICK EVENT
    icon.addEventListener("click", function () {
        box.style.display = (box.style.display === "block") ? "none" : "block";
    });

    // ENTER KEY EVENT
    input.addEventListener("keypress", function (e) {
        if (e.key === "Enter") {

            let msg = input.value.trim();
            if (msg === "") return;

            chat.innerHTML += `<p><b>You:</b> ${msg}</p>`;

            let reply = getReply(msg.toLowerCase());

            chat.innerHTML += `<p><b>Bot:</b> ${reply}</p>`;

            input.value = "";
            chat.scrollTop = chat.scrollHeight;
        }
    });

    function getReply(msg) {

        if (msg.includes("admission")) {
            return "Step 1: Register → Step 2: Login → Step 3: Apply → Step 4: Confirmation";
        }

        if (msg.includes("course")) {
            return "We offer B.Tech, MBA, BCA and more.";
        }

        if (msg.includes("register")) {
            return "Click on 'Get Started' button.";
        }

        if (msg.includes("login")) {
            return "Go to Login page.";
        }

        if (msg.includes("hello") || msg.includes("hi")) {
            return "Hello 👋 How can I help you?";
        }

        return "Please ask about admission, courses, login or register.";
    }

});
icon.onclick = function() {
    console.log("clicked");
}