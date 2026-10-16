<%-- 
    Document   : editevent
    Created on : 29-Mar-2026, 4:06:09 pm
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("adminlogin.jsp");
}

String id = request.getParameter("id");
if(id == null){
    out.println("No event selected.");
    return;
}

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    con = DriverManager.getConnection("jdbc:derby://localhost:1527/evDB","app","app");

    // If form submitted, update event
    if(request.getParameter("updateEvent") != null){
        String name = request.getParameter("ename");
        String date = request.getParameter("edate");
        String venue = request.getParameter("evenue");

        ps = con.prepareStatement("UPDATE events SET eventname=?, eventdate=?, eventvenue=? WHERE eventid=?");
        ps.setString(1, name);
        ps.setString(2, date);
        ps.setString(3, venue);
        ps.setInt(4, Integer.parseInt(id));
        ps.executeUpdate();

        out.println("<p style='color:green;text-align:center;'>Event updated successfully!</p>");
    }

    // Fetch current event data
    ps = con.prepareStatement("SELECT * FROM events WHERE eventid=?");
    ps.setInt(1, Integer.parseInt(id));
    rs = ps.executeQuery();

    if(rs.next()){
%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            register-box { 
    max-width: 550px; 
    width: 90%; 
    margin: 130px auto 50px; 
    
    background: rgba(255,255,255,0.9); /* bright glass effect */
    backdrop-filter: blur(10px);
    
    padding:35px 30px; 
    border-radius:15px; 
    
    box-shadow:0px 8px 25px rgba(0,0,0,0.15); 
    border:1px solid rgba(255,255,255,0.3);
}

/* Title */
 h2 { 
    text-align:center; 
    margin-bottom:20px; 
    color:#5a3e2b;
}

/* Inputs */
/* Form container */
.register-box form {
    display: flex;
    flex-direction: column;
    align-items: center; /* center everything */
}

/* Inputs & Select */
.register-box form input,
.register-box form select {
    width: 100%;              /* full width */
    max-width: 400px;         /* control size */
    padding: 12px;
    margin: 10px 0;           /* remove auto */
    border-radius: 8px;
    border: 1px solid #ddd;
    font-size: 15px;
    background: #fff;
    box-sizing: border-box;   /* IMPORTANT */
}

/* Button container */
.button-group {
    display: flex;
    gap: 15px;
    width: 100%;
    max-width: 600px;
}

/* Buttons */
.register-box form button {
    flex: 1;                  /* equal size buttons */
    padding: 12px;
    background: #6f4e37;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: 600;
    border-radius: 8px;
    transition: 0.3s;
}

/* Hover effect */
.register-box form button:hover {
    background: #5a3e2b;
}



/* Footer */
footer { 
    height:60px; 
    display:flex; 
    justify-content:center; 
    align-items:center; 
    background:#5a3e2b; 
    color:white; 
    font-size:14px; 
    margin-top:50px; 
}

            </style>
    <body>
        <section class="register-box">
<h2 style="text-align:center;">Edit Event</h2>
<div style="text-align:center;margin-top:20px;">
<form method="post">
    <input type="text" name="ename" value="<%=rs.getString("eventname")%>" required><br><br>
    <input type="text" name="edate" value="<%=rs.getString("eventdate")%>" required><br><br>
    <input type="text" name="evenue" value="<%=rs.getString("eventvenue")%>" required><br><br>
    <button type="submit" name="updateEvent">Update Event</button>
</form>
    </section>
<br> <center>
<a href="adminDashboard.jsp"><h2>Back to Dashboard</h2></a>
</center>
</div>
    <footer> C Stella Maris College | 2026 </footer>

<%
    } else {
        out.println("Event not found.");
    }

}catch(Exception e){
    out.println(e);
} finally {
    try{ if(rs!=null) rs.close(); }catch(Exception e){}
    try{ if(ps!=null) ps.close(); }catch(Exception e){}
    try{ if(con!=null) con.close(); }catch(Exception e){}
}
%>
</body>
</html>
