<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.college.admission_system.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Application Status</title>

    <!-- Auto Refresh every 5 sec -->
    <meta http-equiv="refresh" content="5">

    <style>
        body {
            font-family: 'Segoe UI';
            background: linear-gradient(135deg, #a8e6cf, #88d8a3);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 20px;
            width: 500px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .status-badge {
            padding: 10px 20px;
            border-radius: 20px;
            color: white;
            display: inline-block;
            margin-top: 10px;
        }

        .approved { background: green; }
        .rejected { background: red; }
        .pending { background: orange; }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 10px;
        }
    </style>
</head>

<body>

<%
String success = request.getParameter("success");
String appId = request.getParameter("appId");
String applicantName = (String) session.getAttribute("applicantName");

String status = "Pending"; // default

// Only query DB if appId exists
if(appId != null && !appId.isEmpty()){
    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT status FROM students WHERE applicant_id=?"
        );
        ps.setString(1, appId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            status = rs.getString("status");
        }

        rs.close();
        ps.close();
        con.close();

    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    }
}
%>

<div class="container">

<h1>📊 Application Status</h1>

<!-- ✅ FIXED HERE -->
<% if("true".equals(success)) { %>

<p><b>Application ID:</b> <%= appId %></p>

<div class="status-badge 
    <%= status.equals("Approved") ? "approved" :
        status.equals("Rejected") ? "rejected" : "pending" %>">
    <%= status %>
</div>

<p style="margin-top:20px;">
    Hello <%= applicantName != null ? applicantName : "Student" %>
</p>

<p>
    Submitted on:
    <%= new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date()) %>
</p>

<% } else { %>

<h2 style="color:red;">❌ Submission Failed</h2>

<% } %>

<br>
<a href="../index.jsp" class="btn">Home</a>

<% if("true".equals(success))  { %>
<a href="form.jsp" class="btn">New Application</a>
<% } %>

</div>

</body>
</html>