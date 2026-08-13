
<%@ page import="java.sql.*" %>
<%@ page import="com.college.admission_system.DBConnection" %>

<%
String appId = request.getParameter("appId");

if(appId == null || appId.isEmpty()){
    out.println("❌ Invalid Access");
    return;
}
%>

<html>
<head>
<title>Payment</title>

<style>
body{
    font-family: Arial;
    background:#f5f6fa;
}
.box{
    width:400px;
    margin:auto;
    margin-top:100px;
    padding:30px;
    background:white;
    text-align:center;
    border-radius:10px;
}
button{
    padding:10px 20px;
    background:green;
    color:white;
    border:none;
    border-radius:5px;
}
</style>
</head>

<body>

<div class="box">
<h2>Admission Fee Payment</h2>

<p>Application ID: <%=appId%></p>
<p>Amount: ₹50,000</p>

<form action="<%=request.getContextPath()%>/PaymentServlet" method="post">
    <input type="hidden" name="appId" value="<%=appId%>">
    <button type="submit">Pay Now</button>
</form>

</div>

</body>
</html>