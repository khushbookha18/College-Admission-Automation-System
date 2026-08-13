<%@ page import="java.sql.*" %>
<%@ page import="com.college.admission_system.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Payment Success</title>
</head>

<body>

<h2>Payment Successful</h2>

<table border="1">
<tr>
<th>Applicant ID</th>
<th>Name</th>
<th>Email</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM students WHERE payment_status='Paid'");

while(rs.next()){
%>

<tr>
<td><%=rs.getString("applicant_id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
</tr>

<%
}
%>

</table>

</body>
</html>