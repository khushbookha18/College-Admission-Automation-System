<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UniAdmit - Premium College Admission Portal</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css?v=2">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Animated Background Particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>


    <!-- Header -->
    <header class="header">
        <nav class="navbar">
            <div class="nav-brand">
                <div class="logo">
                    <i class="fas fa-graduation-cap logo-icon"></i>
                    <span class="logo-text">Uni<span class="logo-gradient">Admit</span></span>
                </div>
            </div>
            <div class="nav-menu">
                <a href="#home" class="nav-link active"><i class="fas fa-home"></i> Home</a>
                <a href="#features" class="nav-link"><i class="fas fa-star"></i> Features</a>
                <a href="#courses" class="nav-link"><i class="fas fa-book"></i> Courses</a>
                <a href="about.jsp" class="nav-link"><i class="fas fa-info-circle"></i> About</a>
                <a href="login.jsp" class="nav-link"><i class="fas fa-sign-in-alt"></i> Login</a>
            </div>
            <div class="nav-cta">
                <a href="register.jsp" class="btn-register-nav">
                    <i class="fas fa-user-plus"></i> Get Started
                </a>
            </div>
            <div class="hamburger">
                <span></span><span></span><span></span>
            </div>
        </nav>
    </header>


    <!-- Hero Section with Video Background -->
    <section id="home" class="hero">
        <div class="hero-overlay"></div>
        <video autoplay muted loop class="hero-video">
            <source src="https://assets.mixkit.co/videos/preview/mixkit-abstract-colorful-background-12166-large.mp4" type="video/mp4">
        </video>
       
        <div class="hero-content">
            <div class="hero-badge">
                <i class="fas fa-crown"></i>
                <span>#1 Admission Portal</span>
            </div>
           
            <h1 class="hero-title">Your Dream University Awaits You</h1>
           
            <p class="hero-subtitle">
                Join <strong>50K+</strong> students who secured their future with our
                <strong>AI-powered admission system</strong> and <strong>99.8% success rate</strong>
            </p>
           
            <div class="hero-buttons">
                <a href="register.jsp" class="btn-primary btn-hero">
                    <i class="fas fa-rocket"></i>
                    <span>Start Application</span>
                    <div class="btn-glow"></div>
                </a>
                <a href="login.jsp" class="btn-secondary btn-hero">
                    <i class="fas fa-sign-in-alt"></i>
                    <span>Student Login</span>
                </a>
            </div>
           
            <!-- Live Stats -->
            <div class="hero-stats">
                <div class="stat-item">
                    <div class="stat-number" data-target="50000">0</div>
                    <div class="stat-label">Students</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" data-target="998">0</div>
                    <div class="stat-label">% Success</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" data-target="247">0</div>
                    <div class="stat-label">Courses</div>
                </div>
            </div>
        </div>
       
        <div class="hero-image">
        <div class="floating-card">
      				  <h3>3 Steps Only</h3>
        			  <p>1. Register</p>
       				  <p>2. Apply</p>
     			     <p>3. Get Accepted</p>
    			</div>
          
            
         </div>
                 
       
    </section>


    <!-- Features Section -->
    <section id="features" class="features section-padding">
        <div class="container">
				<div class="section-header">
				    <span class="section-subtitle">Trusted by Top Universities</span>
				    <h2 class="section-title gradient-text">Why 50K+ Students Choose Us</h2>
				</div>
           
            <div class="features-grid">
                <div class="feature-card modern-card">
                    <div class="feature-icon-wrapper">
                        <i class="fas fa-bolt feature-icon"></i>
                    </div>
                    <h3>Lightning Fast</h3>
                    <p>Complete applications in under 5 minutes with our intelligent auto-fill</p>
                </div>
                <div class="feature-card modern-card">
                    <div class="feature-icon-wrapper">
                        <i class="fas fa-shield-alt feature-icon"></i>
                    </div>
                    <h3>100% Secure</h3>
                    <p>Bank-level encryption for all documents and personal information</p>
                </div>
                <div class="feature-card modern-card">
                    <div class="feature-icon-wrapper">
                        <i class="fas fa-robot feature-icon"></i>
                    </div>
                    <h3>AI Powered</h3>
                    <p>Smart course matching and admission probability prediction</p>
                </div>
                <div class="feature-card modern-card">
                    <div class="feature-icon-wrapper">
                        <i class="fas fa-headset feature-icon"></i>
                    </div>
                    <h3>24/7 Support</h3>
                    <p>Live chat, email, and phone support available round the clock</p>
                </div>
            </div>
        </div>
    </section>


    <!-- Course Showcase -->
    <section id="courses" class="courses section-padding">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Popular Programs</h2>
                <p class="section-subtitle">Choose from 247+ accredited programs</p>
            </div>
            <div class="courses-grid">
                <div class="course-card">
                    <div class="course-badge">B.Tech</div>
                    <h3>Computer Science</h3>
                    <div class="course-stats">
                        <span><i class="fas fa-users"></i> 1200 seats</span>
                        <span><i class="fas fa-star"></i> 4.9/5</span>
                    </div>
                </div>
                <!-- Add more course cards -->
            </div>
        </div>
    </section>


    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-brand">
                    <div class="logo">
                        <i class="fas fa-graduation-cap"></i>
                        <span>UniAdmit</span>
                    </div>
                    <p>Your trusted partner for college admissions</p>
                </div>
                <div class="footer-links">
                    <a href="register.jsp">Start Application</a>
                    <a href="login.jsp">Student Login</a>
                    <a href="#">Admin Portal</a>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 UniAdmit Portal. All rights reserved.</p>
            </div>
        </div>
    </footer>


    <script src="js/app.js"></script>
    <!-- CHATBOT ICON -->
<div id="chatbot-icon">
    <i class="fas fa-comments"></i>
</div>

<!-- CHATBOT BOX -->
<div id="chatbot-box">
    <div class="chat-header">UniAdmit Assistant</div>
    
    <div id="chat-content">
        <p><b>Bot:</b> Hi 👋 Welcome to UniAdmit!</p>
    </div>
    
    <input type="text" id="chat-input" placeholder="Ask something...">
</div>
n
</body>
</html>