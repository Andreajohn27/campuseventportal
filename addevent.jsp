<%-- 
    Document   : addevent
    Created on : 16-Mar-2026, 3:07:37 pm
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Event page</title>
   <style>
       
       body { 
    margin:0; 
       font-family: Arial, sans-serif; 
       background-color:#fff8f0; 
       color:#5a3e2b; 
       
       .navbar { 
    width:100%; 
         background:#fff8f0; 
         position:fixed; 
         top:0; left:0; 
         display:flex; 
         align-items:center; 
         padding:18px 30px; 
         box-shadow:0 2px 8px rgba(0,0,0,0.08); 
         z-index:1000; 
}

 
 .nav-links {
    
    display:flex; 
    justify-content:center; 
    flex:1; }

.nav-links a { 
    color:black; 
    text-decoration:none; 
    margin:0 20px; 
    font-size:15px; 
    font-weight:700; 
    transition:0.3s; }
.nav-links a:hover { 
    opacity:0.7;
}
 

.logo { 
    font-size:18px; 
       font-weight:700; 
       color:black; 
       letter-spacing:0.5px; }
       
       .box { 
    max-width: 500px; 
    width: 90%; margin: 130px auto 50px; 
    background:white; padding:30px 25px; 
    border-radius:10px; 
    box-shadow:0px 0px 10px rgba(0,0,0,0.2); 
    box-sizing:border-box; }
       
       
    .box form button { 
    background:#6f4e37; 
    color:white; 
    border:none; 
    cursor:pointer; 
    font-weight:700; 
}
       .box form button:hover { 
    opacity:0.8;
}

.box form input, .box form select, .box form button { 
    width:100%; 
    padding:12px; 
    margin:8px 0; 
    border-radius:5px; 
    border:1px solid #ccc; 
    font-size:16px; 
    box-sizing:border-box; 
}
       
       
       </style> 
    </head>
 <body>
 <body>

<%
String msg = request.getParameter("msg");

if("success".equals(msg)){
%>
<p style="color:green; text-align:center;">Event Added Successfully!</p>
<%
}else if("fail".equals(msg)){
%>
<p style="color:red; text-align:center;">Failed to add event</p>
<%
}else if("error".equals(msg)){
%>
<p style="color:red; text-align:center;">Error occurred</p>
<%
}
%>


            <div class="navbar">
    <div class="logo">Campus Event Portal</div>
    <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href = "eventdetails.jsp">Event Details</a>
            <a href ="adminDashboard.jsp">Admin DashBoard</a>
            <a herf ="logout.jsp">Logout</a>
    </div>
    </div>
            
    <section class = "box">
        
        <h2><b><center>Add Event</center></b></h2>

<form action="AddEventServlet" method="post">

Event ID:<br>
<input type="number" name="eventId"><br><br>

Event Name:<br>
<input type="text" name="eventName"><br><br>

Event Type:<br>
<input type="text" name="eventType"><br><br>

Description:<br>
<input type="text" name="description"><br><br>

Event Date:<br>
<input type="date" name="eventDate"><br><br>

Event Venue:<br>
<input type="text" name="eventVenue"><br><br>

Image Path:<br>
<input type="text" name="imagePath"><br><br>

<button class="ae-box" type="submit">Add Event</button>

</form>
        </section>
    </body>
</html>
