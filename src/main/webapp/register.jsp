<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <link rel="stylesheet" href="CSS/style.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/CSS/all.min.css">
</head>

<body class="simple-bg">

<div class="register-wrapper">

    <div class="register-box">

        <h2>Create Account</h2>
        <p>Start your admission journey</p>

        <form action="RegisterServlet" method="post">

            <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" name="name" placeholder="Full Name" required>
            </div>
            
			<div class="input-box">
                <i class="fas fa-user"></i>
                <input type="username" name="username" placeholder="User Name" required>
            </div>
            
            <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" placeholder="Email Address" required>
            </div>

            <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>

            <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
            </div>

            <button type="submit" class="register-btn">
                Register
            </button>

        </form>

        <div class="register-footer">
            Already have an account? <a href="login.jsp">Login</a>
        </div>

    </div>

</div>

</body>
</html>