<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    // ✅ SESSION CHECK (important)
    if(session.getAttribute("appId") == null){
        response.sendRedirect("../login.jsp");
        return;
    }

    String appId = (String) session.getAttribute("appId");
    String email = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admission Form</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI';
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.15);
            padding: 40px;
        }
        h1 {
            text-align: center;
            color: #2d3436;
            margin-bottom: 40px;
            font-size: 2.8em;
        }
        .form-group {
            margin-bottom: 25px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        input, select, textarea {
            width: 100%;
            padding: 18px;
            border: 2px solid #dfe6e9;
            border-radius: 12px;
            font-size: 16px;
        }
        .readonly {
            background: #f8f9fa;
            color: #6c757d;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
        }
        button {
            width: 100%;
            padding: 20px;
            background: #00b894;
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 20px;
            margin-top: 30px;
        }
    </style>
</head>

<body>

<div class="container">

<h1>📋 Online Admission Form</h1>

<!-- ✅ ERROR MESSAGE -->
<%
String error = request.getParameter("error");
if("already_applied".equals(error)){
%>
    <p style="color:red; text-align:center;">
        ❌ You have already submitted the application!
    </p>
<%
}
%>

<form action="../UploadServlet" method="post" enctype="multipart/form-data">

    <!-- ✅ APP ID (fixed) -->
    <div class="form-group">
        <label>Application ID *</label>
        <input type="text" name="appId" value="<%= appId %>" readonly class="readonly">
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>First Name *</label>
            <input type="text" name="firstName" required>
        </div>
        <div class="form-group">
            <label>Last Name *</label>
            <input type="text" name="lastName" required>
        </div>
    </div>

    <div class="form-group">
        <label>Date of Birth *</label>
        <input type="date" name="dob" required>
    </div>

    <div class="form-row">

        <!-- ✅ EMAIL LOCKED -->
        <div class="form-group">
            <label>Email *</label>
            <input type="email" name="email" value="<%= email %>" readonly class="readonly">
        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="tel" name="phone">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>10th Marks (%) *</label>
            <input type="text" name="tenthMarks" required>
        </div>

        <div class="form-group">
            <label>12th Marks (%) *</label>
            <input type="text" name="twelfthMarks" required>
        </div>
    </div>

    <div class="form-group">
        <label>Course *</label>
        <select name="course" required>
            <option value="">Select Course</option>
            <option value="B.Tech Computer Science">B.Tech Computer Science</option>
            <option value="B.Tech Electronics">B.Tech Electronics</option>
            <option value="B.Tech Mechanical">B.Tech Mechanical</option>
            <option value="B.Sc Physics">B.Sc Physics</option>
            <option value="B.Sc Chemistry">B.Sc Chemistry</option>
            <option value="B.Com">B.Com</option>
        </select>
    </div>

    <div class="form-group">
        <label>Address</label>
        <textarea name="address"></textarea>
    </div>

    <div class="form-group">
        <label>Select University</label>
        <select name="university" required>
            <option value="">-- Choose University --</option>
            <option value="MIT">MIT</option>
            <option value="Harvard">Harvard</option>
            <option value="Stanford">Stanford</option>
            <option value="Oxford">Oxford</option>
            <option value="Mumbai">Mumbai</option>
            <option value="IIT">IIT</option>
        </select>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label>Upload Photo *</label>
            <input type="file" name="photo" required>
        </div>

        <div class="form-group">
            <label>Upload Documents *</label>
            <input type="file" name="documents" multiple required>
        </div>
    </div>

    <div class="form-group">
        <label>Declaration *</label>
        <textarea name="declaration" required></textarea>
    </div>

    <button type="submit">🚀 Submit Application</button>

</form>

</div>

</body>
</html>