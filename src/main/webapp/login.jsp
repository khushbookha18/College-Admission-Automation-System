<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - UniAdmit Portal</title>

    <!-- CSS -->
    <link rel="stylesheet" href="CSS/style.css">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body class="auth-body">

<!-- BACKGROUND -->
<div class="bg-animation">
    <div class="bg-circle circle-1"></div>
    <div class="bg-circle circle-2"></div>
    <div class="bg-circle circle-3"></div>
</div>

<!-- MAIN CONTAINER -->
<div class="login-container">

    <!-- LEFT SIDE -->
    <div class="login-left">
        <div class="illustration-card">
            <i class="fas fa-user-graduate icon-main"></i>
            <h2>Welcome Back!</h2>
            <p>Login to continue your admission journey</p>
        </div>
    </div>

    <!-- RIGHT SIDE -->
    <div class="login-right">
        <div class="login-card">

            <h1 class="login-title">Student Login</h1>
            <p class="login-subtitle">Enter your credentials</p>

            <!-- LOGIN FORM -->
            <form action="LoginServlet" method="post">
                
                <div class="form-group">
                    <input type="email" name="email" placeholder="Enter Email" class="form-input" required>
                </div>

                <div class="form-group">
                    <input type="password" name="password" placeholder="Enter Password" class="form-input" required>
                </div>

                <div class="form-options">
                    <label>
                        <input type="checkbox"> Remember me
                    </label>

                    <a href="forgot.jsp" class="forgot-link">Forgot Password?</a>
                </div>

                <button type="submit" class="btn-login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>

            </form>

            <!-- REGISTER LINK -->
            <div class="auth-footer">
                <p>Don't have an account? 
                    <a href="register.jsp">Register</a>
                </p>

                <p>
                   <a href="admin/adminLogin.jsp">Admin Login</a>
                </p>
            </div>

        </div>
    </div>

</div>

<!-- MESSAGE DISPLAY -->
<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<% if ("success".equals(message)) { %>
    <script>alert("Login Successful!");</script>
<% } %>

<% if ("invalid".equals(error)) { %>
    <script>alert("Invalid Email or Password!");</script>
<% } %>

</body>
</html>