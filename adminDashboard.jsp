<%-- 
    Document   : adminDashboard
    Created on : 15-Mar-2026, 1:21:21 pm
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("adminLogin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard | Campus Event Portal</title>

<style>
body{
    font-family:Arial;
    background:beige;
    margin:0;
}

/* NAVBAR */
.navbar{
    width:100%;
    background:#fff8f0;
    position:fixed;
    top:0;
    left:0;
    display:flex;
    align-items:center;
    padding:18px 30px;
    box-shadow:0 2px 8px rgba(0,0,0,0.08);
}

.logo{
    font-size:18px;
    font-weight:700;
}

.nav-links{
    display:flex;
    justify-content:center;
    flex:1;
}

.nav-links a{
    color:black;
    text-decoration:none;
    margin:0 20px;
    font-size:15px;
    font-weight:700;
}

/* TABLE */
h2{
    text-align:center;
    margin-top:120px;
}

table{
    width:90%;
    margin:30px auto;
    border-collapse:collapse;
    background:white;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

th,td{
    padding:12px;
    border:1px solid #ddd;
    text-align:center;
}

th{
    background:burlywood;
}

footer{
    height:60px;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#5a3e2b;
    color:white;
    font-size:14px;
    margin-top:40px;
}

.center-box {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 30px;
}

button {
    padding: 8px 16px;
    margin:2px;
    font-size: 16px;
    background: #5a3e2b;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s ease;
}
.button2{
    padding: 8px 16px;
    margin:2px;
    font-size: 30px;
    background: #5a3e2b;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s ease;
    
}
button:hover {
    transform: scale(1.05);
}
button2:hover {
    transform: scale(1.05);
}
</style>
</head>
<body>

<div class="navbar">
    <div class="logo">Campus Event Portal</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="index.jsp#events">View Events</a>
        <a href="eventdetails.jsp">Event Details</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<h2>Event Registrations</h2>

<%
Connection con = null;
PreparedStatement psUpdate = null, psDeleteEvent=null;
Statement st = null;
ResultSet rs = null;

try {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    con = DriverManager.getConnection("jdbc:derby://localhost:1527/evDB","app","app");

    // Handle Approve / Reject
    String action = request.getParameter("action");
    String regId = request.getParameter("id");
    if(action != null && regId != null){
        String status = action.equals("approve") ? "Approved" : "Rejected";
        psUpdate = con.prepareStatement("UPDATE registrations SET status=? WHERE id=?");
        psUpdate.setString(1, status);
        psUpdate.setInt(2, Integer.parseInt(regId));
        psUpdate.executeUpdate();
    }

    // Handle Event Deletion
    String deleteEventId = request.getParameter("deleteEventId");
    if(deleteEventId != null){
        psDeleteEvent = con.prepareStatement("DELETE FROM events WHERE eventid=?");
        psDeleteEvent.setInt(1, Integer.parseInt(deleteEventId));
        psDeleteEvent.executeUpdate();
        response.sendRedirect("adminDashboard.jsp"); // refresh
    }

    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM registrations");
%>

<table>
<tr>
<th>ID</th>
<th>Event</th>
<th>Full Name</th>
<th>Dept Number</th>
<th>Dept Name</th>
<th>Year</th>
<th>Participated Before</th>
<th>Won Before</th>
<th>Team Name</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
while(rs.next()){
    int regIdLoop = rs.getInt("id");
%>
<tr>
<td><%=regIdLoop%></td>
<td><%=rs.getString("event")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("deptNumber")%></td>
<td><%=rs.getString("deptName")%></td>
<td><%=rs.getString("studentyear")%></td>
<td><%=rs.getString("participatedBefore")%></td>
<td><%=rs.getString("wonBefore")%></td>
<td><%=rs.getString("teamName")%></td>
<td><%= (rs.getString("status")==null)?"Pending":rs.getString("status") %></td>
<td>
<form method="post">
    <input type="hidden" name="id" value="<%=regIdLoop%>">
    <button type="submit" name="action" value="approve">Approve</button><br>
    <button type="submit" name="action" value="reject">Reject</button>
</form>
</td>
</tr>
<%
}
%>
</table>

<h2>Events Management</h2>

<%
rs = st.executeQuery("SELECT * FROM events");
%>

<table>
<tr>
<th>ID</th><th>Event Name</th><th>Date</th><th>Venue</th><th>Action</th>
</tr>

<%
while(rs.next()){
    int eventId = rs.getInt("eventid");
%>
<tr>
<td><%=eventId%></td>
<td><%=rs.getString("eventname")%></td>
<td><%=rs.getString("eventdate")%></td>
<td><%=rs.getString("eventvenue")%></td>
<td>
    <a href="editevent.jsp?id=<%=eventId%>"><button type="button">Edit</button></a>
    <a href="adminDashboard.jsp?deleteEventId=<%=eventId%>" onclick="return confirm('Are you sure?');">
        <button type="button">Delete</button>
    </a>
</td>
</tr>
<%
}
%>
</table>

<div class="center-box">
    <form action="addevent.jsp">
        <button class="button2" type="submit">Add Event</button>
    </form>
</div>

<%
} catch(Exception e){
    out.println(e);
} finally {
    try{ if(rs!=null) rs.close(); }catch(Exception e){}
    try{ if(st!=null) st.close(); }catch(Exception e){}
    try{ if(psUpdate!=null) psUpdate.close(); }catch(Exception e){}
    try{ if(psDeleteEvent!=null) psDeleteEvent.close(); }catch(Exception e){}
    try{ if(con!=null) con.close(); }catch(Exception e){}
}
%>

<footer>
© 2026 Stella Maris College | Campus Event Portal
</footer>

</body>
</html>
