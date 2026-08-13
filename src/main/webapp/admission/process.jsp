<%@ page import="java.util.*" %>

<%
    // ✅ Get form data
    String appId = request.getParameter("appId");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String course = request.getParameter("course");

    String fullName = firstName + " " + lastName;

    try {
        // ✅ Correct DB name
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/college_admission", "root", "password"
        );

        // ✅ Insert (WITH app_id)
        String sql = "INSERT INTO applications(app_id, full_name, email, phone, course, status) VALUES(?,?,?,?,?,?)";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, appId);
        ps.setString(2, fullName);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, course);
        ps.setString(6, "PENDING");

        ps.executeUpdate();

        // ✅ Store in session
        session.setAttribute("appId", appId);
        session.setAttribute("name", fullName);

    } catch(Exception e) {
        e.printStackTrace();
    }

    // ✅ Get name for display
    String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Application</title>

    <!-- ✅ Redirect after 3 seconds -->
    <meta http-equiv="refresh" content="3;URL=status.jsp?success=1&appId=<%=appId%>">

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            text-align: center;
            margin-top: 150px;
        }

        .box {
            background: rgba(255,255,255,0.15);
            padding: 30px;
            border-radius: 15px;
            display: inline-block;
        }

        .loader {
            border: 5px solid white;
            border-top: 5px solid transparent;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin: 20px auto;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            100% { transform: rotate(360deg); }
        }
    </style>
</head>

<body>

<div class="box">

    <h2>⏳ Processing your application...</h2>

    <p><b>Applicant:</b> <%= name %></p>
    <p><b>Application ID:</b> <%= appId %></p>

    <div class="loader"></div>

    <p>Please wait while we verify your details...</p>

    <p style="margin-top:15px; font-size:14px;">
        You will be redirected to status page shortly...
    </p>

</div>

</body>
</html>