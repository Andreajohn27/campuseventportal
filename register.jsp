<%-- 
    Document   : register
    Created on : 15-Mar-2026, 10:56:54 am
    Author     : acer
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%
    Map<String, Calendar> eventDeadlines = new HashMap<>();

    // Set deadlines with month info (March = 2, April = 3 in Calendar, 0-based)
    Calendar cal = Calendar.getInstance();

    // First 5 events - deadlines in April
    cal.set(Calendar.MONTH, Calendar.APRIL);
    cal.set(Calendar.DAY_OF_MONTH, 2);
    eventDeadlines.put("Quiz Night", (Calendar) cal.clone());

    cal.set(Calendar.DAY_OF_MONTH, 5);
    eventDeadlines.put("Twilight Coding", (Calendar) cal.clone());

    cal.set(Calendar.DAY_OF_MONTH, 8);
    eventDeadlines.put("Art Fiesta", (Calendar) cal.clone());

    cal.set(Calendar.DAY_OF_MONTH, 10);
    eventDeadlines.put("Book Fair", (Calendar) cal.clone());

    cal.set(Calendar.DAY_OF_MONTH, 15);
    eventDeadlines.put("Freshers Day", (Calendar) cal.clone());

    // Last 3 events - still in March
    cal.set(Calendar.MONTH, Calendar.MARCH);
    cal.set(Calendar.DAY_OF_MONTH, 26);
    eventDeadlines.put("Class Meet", (Calendar) cal.clone());

    cal.set(Calendar.DAY_OF_MONTH, 27);
    eventDeadlines.put("Team GD", (Calendar) cal.clone());

    cal.set(Calendar.DAY_OF_MONTH, 28);
    eventDeadlines.put("Concert the Star", (Calendar) cal.clone());

    String selectedEvent = request.getParameter("event");
    String errorMsg = null;

    if (selectedEvent != null && eventDeadlines.containsKey(selectedEvent)) {
        Calendar today = Calendar.getInstance();
        Calendar lastDate = eventDeadlines.get(selectedEvent);

        if (today.after(lastDate)) {
            errorMsg = "Registration closed for " + selectedEvent + 
                       "! Last date was " + (lastDate.get(Calendar.MONTH)+1) + "/" + lastDate.get(Calendar.DAY_OF_MONTH);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Registration</title>
<style>
 body { 
    margin:0; 
    font-family: Arial, sans-serif; 
    background: url('campus.jpg') no-repeat center center/cover;
    position: relative;
    color:#3e2c23;
}

/* Soft overlay (instead of dull opacity) */
body::before {
    content: "";
    position: fixed;
    top:0; left:0; right:0; bottom:0;
    background: rgba(255, 248, 240, 0.75); /* light warm overlay */
    z-index:-1;
}

/* Navbar */
.navbar { 
    width:100%; 
    background: rgba(255,255,255,0.85); 
    backdrop-filter: blur(8px);
    position:fixed; 
    top:0; left:0; 
    display:flex; 
    align-items:center; 
    padding:18px 30px; 
    box-shadow:0 2px 10px rgba(0,0,0,0.1); 
    z-index:1000; 
}

.logo { 
    font-size:20px; 
    font-weight:700; 
    color:#4a2f1d;
}

.nav-links { 
    display:flex; 
    justify-content:center; 
    flex:1; 
}

.nav-links a { 
    color:#4a2f1d; 
    text-decoration:none; 
    margin:0 20px; 
    font-size:15px; 
    font-weight:600; 
    transition:0.3s; 
}

.nav-links a:hover { 
    color:#8b5e3c;
}

/* Register Box (MAIN FIX 🔥) */
.register-box { 
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
.register-box h2 { 
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
</head>
<body>

<div class="navbar">
    <div class="logo">Campus Event Portal</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="index.jsp#events">View Events</a>
        <a href="eventdetails.jsp">Event Details</a>
        <a href="register.jsp">Register</a>
        <a href="adminLogin.jsp">Admin</a>
    </div>
</div>

<div class="register-box">
<h2>Event Registration</h2>


<%
    String msg = (String) request.getAttribute("message");
    String color = (String) request.getAttribute("color");

    if (msg != null) {
%>
    <p style="color:<%=color%>; text-align:center; font-weight:bold;">
        <%= msg %>
    </p>
<%
    }
%>

<form method="post" action="RegisterServlet">
    <select name="event" required>
        <option value="">Select Event</option>
        <option value="Quiz Night">Quiz Night</option>
        <option value="Twilight Coding">Twilight Coding</option>
        <option value="Art Fiesta">Art Fiesta</option>
        <option value="Book Fair">Book Fair</option>
        <option value="Freshers Day">Freshers Day</option>
        <option value="Class Meet">Class Meet</option>
        <option value="Team GD">Team GD</option>
        <option value="Concert the Star">Concert the Star</option>
    </select>

    <input type="text" name="name" placeholder="Full Name" required>
    <input type="text" name="deptNumber" placeholder="Department Number" required>
    <input type="text" name="deptName" placeholder="Department Name" required>
    <select name="year" required>
        <option value="">Select Year</option>
        <option value="1st">1st Year</option>
        <option value="2nd">2nd Year</option>
        <option value="3rd">3rd Year</option>
        <option value="4th">4th Year</option>
    </select>

    <select name="participatedBefore" required>
        <option value="">Participated in any events before?</option>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
    </select>
    <select name="wonBefore" required>
        <option value="">Won any events before?</option>
        <option value="Yes">Yes</option>
        <option value="No">No</option>
    </select>

    <input type="text" name="teamName" placeholder="Team Name (if group event)">

    <div style="display:flex; gap:10px;">
        <button type="submit">Register</button>
        <button type="submit" formaction="RegisterServlet?print=true">Print</button>
    </div>
</form>
</div>

<footer>
    © 2026 Campus Event Portal | All Rights Reserved
</footer>

</body>
</html>
