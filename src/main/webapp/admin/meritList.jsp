
<%@ page import="java.sql.*" %>
<%@ page import="com.college.admission_system.DBConnection" %>

<html>
<head>
<title>Merit List</title>

<style>
body{
    font-family: Arial;
    background:#f5f6fa;
}
table{
    width:90%;
    margin:auto;
    margin-top:40px;
    border-collapse: collapse;
    background:white;
}
th, td{
    padding:12px;
    border:1px solid #ddd;
    text-align:center;
}
th{
    background:#2c3e50;
    color:white;
}
.rank{
    font-weight:bold;
    color:green;
}
</style>
</head>

<body>

<h2 style="text-align:center;">🏆 Merit List</h2>

<table>
<tr>
    <th>Rank</th>
    <th>App ID</th>
    <th>Name</th>
    <th>Course</th>
    <th>10th</th>
    <th>12th</th>
    <th>Total</th>
</tr>

<%
int rank = 1;

try {
    Connection con = DBConnection.getConnection();

    String sql = "SELECT app_id, first_name, last_name, course, " +
                 "CAST(tenth_marks AS DECIMAL(5,2)) AS tenth, " +
                 "CAST(twelfth_marks AS DECIMAL(5,2)) AS twelfth, " +
                 "(CAST(tenth_marks AS DECIMAL(5,2)) + " +
                 "CAST(twelfth_marks AS DECIMAL(5,2))) AS totalMarks " +
                 "FROM admission_form ORDER BY totalMarks DESC";

    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
    <td class="rank"><%= rank++ %></td>
    <td><%= rs.getString("app_id") %></td>
    <td><%= rs.getString("first_name") + " " + rs.getString("last_name") %></td>
    <td><%= rs.getString("course") %></td>
    <td><%= rs.getString("tenth") %></td>
    <td><%= rs.getString("twelfth") %></td>
    <td><%= rs.getString("totalMarks") %></td>
</tr>

<%
    }

    rs.close();
    ps.close();
    con.close();

} catch(Exception e){
    out.println("Error: " + e.getMessage());
}
%>

</table>

</body>
</html>