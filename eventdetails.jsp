<%-- 
    Document   : eventdetails
    Created on : 14-Mar-2026, 7:26:44 pm
    Author     : acer
--%>



<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event Details | Campus Event Portal</title>

<style>
body {
    font-family: Arial;
    background: #f4f4f4;
    margin: 0;
}

.navbar {
    width: 100%;
    background: #fff8f0;
    position: fixed;
    top: 0;
    left: 0;
    display: flex;
    align-items: center;
    padding: 18px 30px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.nav-links {
    display: flex;
    justify-content: center;
    flex: 1;
}

.nav-links a {
    color: black;
    text-decoration: none;
    margin: 0 20px;
    font-weight: 700;
}

.logo {
    font-weight: 700;
}

/* SINGLE EVENT */
.event-box {
    width: 50%;
    margin: 110px auto;
    background: #fff8f0;
    padding: 10px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
}

.event-box img {
    width: 100%;
    max-height: 350px;
    object-fit: contain;
}

/* ALL EVENTS */
.event-row {
    width: 80%;
    height: 300px;
    margin: 100px auto 10px;
    display: flex;
    background: #fff8f0;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
}

.event-row img {
    width: 200px;
    height: 270px;
    object-fit: cover;
    border-radius: 8px;
}

.event-info {
    margin-left: 20px;
}

.btn {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 20px;
    background: burlywood;
    color: black;
    text-decoration: none;
    border-radius: 5px;
}

footer {
    height: 60px;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#5a3e2b;
    color:white;
    margin-top:40px;
}
</style>
</head>

<%@page import="java.sql.*"%>


<body>

<div class="navbar">
    <div><b>Campus Event Portal</b></div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="index.jsp#events">View Events</a>
        <a href="eventdetails.jsp">Event Details</a>
        <a href="register.jsp">Register</a>
        <a href="adminLogin.jsp">Admin</a>
    </div>
</div>

<%
String eventId = request.getParameter("id");

try {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/evDB","app","app");

    if(eventId != null && !eventId.trim().equals("")){

        int eid = Integer.parseInt(eventId.trim());

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM events WHERE eventId = ?");

        ps.setInt(1, eid);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
%>

<div class="event-row" style="margin-top:120px;">
    <img src="<%=rs.getString(7)%>">
    <div class="event-info">
        <h2><%=rs.getString(2)%></h2>
        <p><b>Type:</b> <%=rs.getString(3)%></p>
        <p><b>Description:</b> <%=rs.getString(4)%></p>
        <p><b>Date:</b> <%=rs.getString(5)%></p>
        <p><b>Venue:</b> <%=rs.getString(6)%></p>

        <a class="btn" href="register.jsp?event=<%=rs.getString(2)%>">Register</a>
    </div>
</div>

<%
        } else {
%>

<p style="text-align:center; color:red; margin-top:120px;">
    Event not found
</p>

<%
        }

    } else {
%>

<!-- 🔴 If no ID, show message -->
<p style="text-align:center; margin-top:120px;">
    Please select an event from Home page
</p>

<%
    }

    con.close();

} catch(Exception e){
%>

<p style="color:red; text-align:center;">
    Error: <%= e.getMessage() %>
</p>

<%
}
%>

<footer>
© 2026 Campus Event Portal
</footer>

</body>
</html>
