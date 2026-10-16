<%-- 
    Document   : adminlogin
    Created on : 15-Mar-2026, 1:17:37 pm
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login | Campus Event Portal</title>

<style>



body {
    margin: 0;
    padding: 0;
    font-family: Arial;
}

/* BACKGROUND */
.admin-bg {
    position: relative;
    height: 100vh;
    background: url('campus.jpg') no-repeat center center/cover;
}

/* overlay (lighter for better visibility) */



/* content stays above overlay */
.admin-content {
    position: relative;
    z-index: 1;
    color: white;
    text-align: center;
    padding-top: 100px;
}

/* NAVBAR */
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
    z-index: 1000;
}

.logo {
    font-size: 18px;
    font-weight: 700;
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
    font-size: 15px;
    font-weight: 700;
}

.nav-links a:hover {
    opacity: 0.7;
}

/* LOGIN CONTAINER */
.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* LOGIN BOX (MAIN FIX) */
.login-box {
    padding: 30px;
    border-radius: 12px;
    width: 350px;
    text-align: center;

    background: rgba(255, 248, 240,295); /* ✅ soft visible box */
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
}

/* HEADING */
.login-box h2 {
    font-size: 26px;
    font-weight: 700;
    color: #5a3e2b;
    letter-spacing: 1px;
    margin-bottom: 20px;
}

/* INPUTS */
.login-box input {
    width: 80%;
    padding: 12px;
    margin: 10px 0;

    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

/* BUTTON */
.login-box button {
    width: 100%;
    padding: 12px;

    background: #6f4e37;
    color: white;

    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
}

.login-box button:hover {
    background: #8b5e3c;
}

footer{
height:60px;
display:flex;
justify-content:center;
align-items:center;
background:#5a3e2b;
color:white;
font-size:14px;
}

</style>
</head>

<body>

<!-- NAVBAR -->

<div class="admin-bg">

<div class="navbar">

<div class="logo">
Campus Event Portal
</div>

<div class="nav-links">
<a href="index.jsp">Home</a>
<a href="index.jsp#events">View Events</a>
<a href="eventdetails.jsp">Event Details</a>
<a href="register.jsp">Register</a>
<a href="adminLogin.jsp">Admin</a>
</div>

</div>

<!-- LOGIN FORM -->

<div class="login-container">

<div class="login-box">

<h2>Admin Login</h2>
<form action="<%= request.getContextPath() %>/AdminLoginServlet" method="post">

<input type="text" name="username" placeholder="Username" required>

<input type="password" name="password" placeholder="Password" required>

<br><br>

<button type="submit">Login</button>

</form>

</div>

</div>

</div> <!-- 🔥 CLOSE background div -->

<footer>
© 2026 Stella Maris College | Campus Event Portal
</footer>

</body>
</html>
