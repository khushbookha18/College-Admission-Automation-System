<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Glass Card */
.container {
    width: 350px;
    padding: 30px;
    border-radius: 20px;
    backdrop-filter: blur(10px);
    background: rgba(255, 255, 255, 0.15);
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
    text-align: center;
    color: #fff;
    animation: fadeIn 1s ease;
}

h2 {
    margin-bottom: 10px;
}

p {
    font-size: 14px;
    opacity: 0.8;
}

/* Input */
input {
    width: 100%;
    padding: 12px;
    margin-top: 20px;
    border-radius: 10px;
    border: none;
    outline: none;
}

/* Button */
button {
    width: 100%;
    margin-top: 20px;
    padding: 12px;
    border-radius: 10px;
    border: none;
    background: #ff7eb3;
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: #ff4d94;
    transform: scale(1.05);
}

/* Link */
.back-link {
    display: block;
    margin-top: 15px;
    color: #fff;
    text-decoration: none;
    font-size: 14px;
}

.back-link:hover {
    text-decoration: underline;
}

/* Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Floating circles */
.circle {
    position: absolute;
    border-radius: 50%;
    opacity: 0.3;
}

.c1 {
    width: 200px;
    height: 200px;
    background: #ff7eb3;
    top: 10%;
    left: 10%;
}

.c2 {
    width: 150px;
    height: 150px;
    background: #fff;
    bottom: 10%;
    right: 10%;
}
</style>
</head>

<body>

<div class="circle c1"></div>
<div class="circle c2"></div>

<div class="container">
    <h2>Forgot Password</h2>
    <p>Enter your email to receive reset link</p>

    <form action="ForgotPasswordServlet" method="post">
        <input type="email" name="email" placeholder="Enter your email" required>

        <button type="submit">Send Reset Email</button>
    </form>

    <a href="login.jsp" class="back-link">← Back to Login</a>
</div>

</body>
</html>