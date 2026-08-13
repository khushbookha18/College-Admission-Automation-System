<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About - UniAdmit</title>

    <!-- CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/style.css">

    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>

<body>

<!-- HEADER (same as index) -->
<header class="header">
    <nav class="navbar">
        <div class="logo">UniAdmit</div>
        <div class="nav-menu">
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About</a>
            <a href="login.jsp">Login</a>
        </div>
    </nav>
</header>

<!-- ABOUT SECTION -->
<section class="about-page">

    <div class="container">

        <h1 class="about-title">About UniAdmit</h1>

        <p class="about-desc">
            UniAdmit is a modern college admission portal designed to simplify the entire admission process.
            Students can easily register, apply for courses, and track their admission status online.
        </p>

        <!-- FEATURES CARDS -->
        <div class="about-cards">

            <div class="about-card">
                <i class="fas fa-user-graduate"></i>
                <h3>Easy Registration</h3>
                <p>Students can quickly create an account and start applying.</p>
            </div>

            <div class="about-card">
                <i class="fas fa-book"></i>
                <h3>Multiple Courses</h3>
                <p>Choose from a wide range of available courses.</p>
            </div>

            <div class="about-card">
                <i class="fas fa-shield-alt"></i>
                <h3>Secure System</h3>
                <p>Your data is protected with strong security.</p>
            </div>

            <div class="about-card">
                <i class="fas fa-chart-line"></i>
                <h3>Track Status</h3>
                <p>Check your admission progress in real time.</p>
            </div>

        </div>

        <!-- PROCESS -->
        <div class="about-process">

            <h2>How It Works</h2>

            <div class="steps">

                <div class="step">
                    <span>1</span>
                    <p>Register Account</p>
                </div>

                <div class="step">
                    <span>2</span>
                    <p>Fill Application</p>
                </div>

                <div class="step">
                    <span>3</span>
                    <p>Submit Form</p>
                </div>

                <div class="step">
                    <span>4</span>
                    <p>Get Admission</p>
                </div>

            </div>

        </div>

    </div>

</section>

</body>
</html>