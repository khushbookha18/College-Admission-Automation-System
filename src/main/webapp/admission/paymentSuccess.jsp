<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.college.admission_system.DBConnection" %>

<%
String appId = request.getParameter("appId");

// ✅ Fix 1: Validate appId
if(appId == null || appId.isEmpty()){
    response.sendRedirect("index.jsp");
    return;
}

String name = "";
String status = "";

try {
    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "SELECT name, payment_status FROM students WHERE applicant_id=?"
    );
    ps.setString(1, appId);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("name");
        status = rs.getString("payment_status");
    }

    rs.close();
    ps.close();
    con.close();

} catch(Exception e){
    out.println("Error: " + e.getMessage());
}

// ✅ Fix 2: Default status
if(status == null || status.isEmpty()){
    status = "Pending";
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Payment Success</title>

<style>
body{
    font-family: 'Segoe UI';
    background: linear-gradient(135deg,#55efc4,#81ecec);
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.box{
    background:white;
    padding:40px;
    border-radius:20px;
    width:450px;
    text-align:center;
    box-shadow:0 15px 40px rgba(0,0,0,0.2);
}

.success{
    font-size:50px;
    color:green;
}

.badge{
    display:inline-block;
    padding:10px 20px;
    background:green;
    color:white;
    border-radius:20px;
    margin-top:10px;
}

.btn{
    display:inline-block;
    margin-top:20px;
    padding:10px 20px;
    background:#2d3436;
    color:white;
    text-decoration:none;
    border-radius:10px;
}
</style>
</head>

<body>

<div class="box">

<div class="success">✔</div>

<h2>Payment Successful</h2>

<p>Hello <b><%= name %></b></p>

<p><b>Application ID:</b> <%= appId %></p>

<p><b>Status:</b></p>
<div class="badge"><%= status %></div>

<p style="margin-top:15px;">
<b>Date:</b>
<%= new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new Date()) %>
</p>

<a href="<%=request.getContextPath()%>/ReceiptServlet?appId=<%=appId%>" class="btn">
Download Receipt
</a>
<a href="status.jsp?success=true&appId=<%=appId%>" class="btn">
View Application Status
</a>

</div>

</body>
</html>