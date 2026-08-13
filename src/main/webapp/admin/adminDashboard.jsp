<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.college.admission_system.DBConnection" %>

<%
/* ✅ FIX 1: Only ADMIN session check (REMOVE USER CHECK) */
if(session.getAttribute("admin") == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:#f4f6f9;
}

/* SIDEBAR */
.sidebar{
    width:230px;
    height:100vh;
    background:#1e293b;
    color:white;
    position:fixed;
    padding:20px;
}
.sidebar h2{
    text-align:center;
    margin-bottom:30px;
}
.sidebar a{
    display:block;
    padding:12px;
    margin:8px 0;
    color:white;
    text-decoration:none;
    border-radius:8px;
    transition:0.3s;
}
.sidebar a:hover{
    background:#334155;
}

/* MAIN */
.main{
    margin-left:250px;
    padding:20px;
}

/* NAVBAR */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:white;
    padding:15px 20px;
    border-radius:10px;
    margin-bottom:20px;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

/* STATS */
.stats{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
}
.card{
    background:white;
    padding:20px;
    border-radius:12px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}
.stat{
    text-align:center;
    color:white;
}
.blue{background:#3b82f6;}
.green{background:#10b981;}
.orange{background:#f59e0b;}
.red{background:#ef4444;}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
}
th{
    background:#1e293b;
    color:white;
}
td,th{
    padding:12px;
    text-align:center;
}
tr:hover{
    background:#f1f5f9;
}

/* STATUS */
.status{
    padding:6px 14px;
    border-radius:20px;
    color:white;
    font-size:14px;
}
.pending{background:#f59e0b;}
.approved{background:#10b981;}
.rejected{background:#ef4444;}

/* BUTTONS */
button{
    padding:6px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:13px;
    margin:2px;
}
.approve{background:#16a34a;color:white;}
.reject{background:#dc2626;color:white;}
.pay{background:#2563eb;color:white;}
.pay:hover{background:#1d4ed8;}
</style>

</head>
<body>

<!-- SIDEBAR -->
<div class="sidebar">
<h2>🎓 Admin</h2>
<a href="adminDashboard.jsp">Dashboard</a>
<a href="#">Applications</a>
<a href="#">Merit List</a>
<a href="payment.jsp">Payments</a>
<a href="../LogoutServlet">🚪 Logout</a>
</div>

<div class="main">

<!-- NAVBAR -->
<div class="navbar">
<h3>Dashboard</h3>
<span>Welcome, Admin 👋</span>
</div>

<%
int total=0,approved=0,pending=0,rejected=0;

Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT status FROM students");

while(rs.next()){
    total++;
    String s=rs.getString("status");
    if("Approved".equalsIgnoreCase(s)) approved++;
    else if("Rejected".equalsIgnoreCase(s)) rejected++;
    else pending++;
}
%>

<!-- STATS -->
<div class="stats">
<div class="card stat blue"><h2><%=total%></h2>Total</div>
<div class="card stat green"><h2><%=approved%></h2>Approved</div>
<div class="card stat orange"><h2><%=pending%></h2>Pending</div>
<div class="card stat red"><h2><%=rejected%></h2>Rejected</div>
</div>

<br>

<!-- CHART -->
<div class="card">
<h3>📊 Application Analytics</h3>
<canvas id="chart"></canvas>
</div>

<br>

<!-- TABLE -->
<div class="card">
<h3>📋 Applications</h3>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
ResultSet data = st.executeQuery("SELECT * FROM students");

while(data.next()){
String status = data.getString("status");
if(status==null) status="Pending";
int id = data.getInt("id");
%>

<tr>
<td><%=id%></td>
<td><%=data.getString("name")%></td>
<td><%=data.getString("email")%></td>

<td>
<span class="status <%=status.toLowerCase()%>">
<%=status%>
</span>
</td>

<td>

<!-- APPROVE -->
<form action="../UpdateStatusServlet" method="post" style="display:inline;">
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="status" value="Approved">
<button class="approve">Approve</button>
</form>

<!-- REJECT -->
<form action="../UpdateStatusServlet" method="post" style="display:inline;">
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="status" value="Rejected">
<button class="reject">Reject</button>
</form>

<!-- ✅ FIX 2: CORRECT PAYMENT PATH -->
<% if("Approved".equalsIgnoreCase(status)) { %>
<form action="../admin/payment.jsp" method="get" style="display:inline;">
<input type="hidden" name="appId" value="<%=data.getString("applicant_id")%>">
<button class="pay">Pay</button>
</form>
<% } %>

</td>
</tr>

<% } %>

</table>
</div>

</div>

<!-- CHART -->
<script>
new Chart(document.getElementById("chart"),{
type:'doughnut',
data:{
labels:['Approved','Pending','Rejected'],
datasets:[{
data:[<%=approved%>,<%=pending%>,<%=rejected%>]
}]
}
});
</script>

</body>
</html>