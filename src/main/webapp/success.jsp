<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admission Success</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

/* Background */

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#11998e,#38ef7d);
}

/* Card */

.success-card{
background:white;
padding:40px;
width:400px;
border-radius:15px;
text-align:center;
box-shadow:0 10px 40px rgba(0,0,0,0.3);
animation:fadeIn 0.8s ease;
}

/* Icon */

.success-icon{
font-size:60px;
color:#28a745;
margin-bottom:15px;
}

/* Title */

.success-card h2{
margin-bottom:10px;
}

/* Text */

.success-card p{
color:gray;
font-size:14px;
margin-bottom:20px;
}

/* Buttons */

.btn{
display:inline-block;
padding:10px 18px;
margin:5px;
border-radius:6px;
text-decoration:none;
color:white;
font-size:14px;
transition:0.3s;
}

.home-btn{
background:#007bff;
}

.home-btn:hover{
background:#0056b3;
}

.new-btn{
background:#28a745;
}

.new-btn:hover{
background:#1e7e34;
}

/* Animation */

@keyframes fadeIn{
from{
opacity:0;
transform:translateY(30px);
}
to{
opacity:1;
transform:translateY(0);
}
}

</style>

</head>

<body>

<div class="success-card">

<div class="success-icon">✔</div>

<h2>Admission Submitted!</h2>

<p>Your application has been successfully submitted.  
Our team will review your details soon.</p>

<a href="dashboard.jsp" class="btn home-btn">🏠 Go to Dashboard</a>
<a href="admission.jsp" class="btn new-btn">➕ New Application</a>

</div>

</body>
</html>