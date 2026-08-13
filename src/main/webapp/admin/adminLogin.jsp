<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login - UniAdmit</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>

/* ===== BODY ===== */
body{
    margin:0;
    font-family:'Poppins', sans-serif;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    overflow:hidden;
}

/* ===== ANIMATED BACKGROUND ===== */
.circle{
    position:absolute;
    border-radius:50%;
    background:rgba(255,255,255,0.05);
    animation:float 8s infinite ease-in-out;
}
.circle1{width:200px;height:200px;top:10%;left:15%;}
.circle2{width:300px;height:300px;bottom:10%;right:10%;}
.circle3{width:150px;height:150px;bottom:20%;left:25%;}

@keyframes float{
    0%,100%{transform:translateY(0);}
    50%{transform:translateY(-20px);}
}

/* ===== LOGIN CARD ===== */
.login-box{
    background: rgba(255,255,255,0.1);
    padding:40px;
    border-radius:18px;
    backdrop-filter: blur(18px);
    box-shadow:0 8px 32px rgba(0,0,0,0.4);
    width:360px;
    text-align:center;
    z-index:2;
}

/* LOGO */
.logo{
    font-size:30px;
    margin-bottom:10px;
}

/* TITLE */
.login-box h2{
    color:#fff;
    margin-bottom:5px;
}

.subtitle{
    color:#ccc;
    font-size:14px;
    margin-bottom:25px;
}

/* INPUT */
.input-box{
    margin-bottom:18px;
}

.input-box input{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    outline:none;
    background:rgba(255,255,255,0.1);
    color:white;
    font-size:14px;
    transition:0.3s;
}

.input-box input:focus{
    background:rgba(255,255,255,0.2);
    box-shadow:0 0 8px rgba(255,122,0,0.5);
}

.input-box input::placeholder{
    color:#ccc;
}

/* BUTTON */
.btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:25px;
    background: linear-gradient(135deg,#ff7a00,#ffb347);
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 0 15px #ff7a00;
}

/* ERROR MESSAGE */
.error{
    color:#ff4d4d;
    font-size:13px;
    margin-bottom:10px;
}

/* BACK LINK */
.back{
    display:block;
    margin-top:15px;
    color:#ccc;
    text-decoration:none;
    font-size:14px;
}

.back:hover{
    color:#fff;
}

</style>
</head>

<body>

<!-- BACKGROUND -->
<div class="circle circle1"></div>
<div class="circle circle2"></div>
<div class="circle circle3"></div>

<!-- LOGIN BOX -->
<div class="login-box">

    <div class="logo">🎓</div>

    <h2>Admin Panel</h2>
    <p class="subtitle">Secure Admin Access</p>

    <!-- OPTIONAL ERROR MESSAGE -->
    <%
        String error = request.getParameter("error");
        if(error != null){
    %>
        <div class="error">Invalid Username or Password ❌</div>
    <%
        }
    %>

    <!-- FORM -->
    <!-- ✅ FIXED ACTION -->
    <form action="<%= request.getContextPath() %>/adminLogin" method="post">

        <div class="input-box">
            <input type="text" name="username" placeholder="Admin Username" required>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <button type="submit" class="btn">Login</button>

    </form>

    <a href="../login.jsp" class="back">← Back to Student Login</a>

</div>

</body>
</html>