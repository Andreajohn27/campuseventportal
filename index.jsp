<%-- 
    Document   : index
    Created on : 14-Mar-2026, 7:26:09 pm
    Author     : acer
--%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Campus Event Portal</title>

<style>
/* BODY */
body{
    margin:0;
    font-family: Arial, sans-serif;
    background-color:#fff8f0;
    color:#5a3e2b;
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
    z-index:1000;
}

/* LOGO */
.logo{
    font-size:18px;
    font-weight:700;
    color:black;
    letter-spacing:0.5px;
}

/* NAV LINKS CONTAINER */
.nav-links{
    display:flex;
    justify-content:center;
    flex:1;
}

/* NAV LINKS */
.nav-links a{
    color:black;
    text-decoration:none;
    margin:0 20px;
    font-size:15px;
    font-weight:700;
    transition:0.3s;
}

.nav-links a:hover{
    opacity:0.7;
}

/* HERO SECTION */
.hero{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
    background-image:url("campus.jpg");
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    position:relative;
    padding-top:70px; /* push down for fixed navbar */
    animation:fadeIn 1s ease-in-out;
}

    /* Define fadeIn animation */
@keyframes fadeIn {
0% {
    opacity: 0;
}
100% {
    opacity: 1;
}
}

/* HERO DARK OVERLAY */
.hero::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.35);
}

/* HERO TITLE */
.hero h1{
    font-size:52px;
    font-weight:600;
    color:white;
    margin:0;
    position:relative;
}

/* EVENTS SECTION */
.events{
    min-height:100vh;
    padding:160px 60px 60px 60px; /* top padding increased for navbar overlap */
    text-align:center;
    background-color:#fff8f0;
}

.events h2{
    font-size:36px;
    color:#5a3e2b;
    margin-bottom:30px;
    font-weight:600;
}

/* EVENT CONTAINER */
.event-container{
    display:flex;
    justify-content:center;
    gap:20px;
    flex-wrap:wrap;
}

/* EVENT ITEM */
.event-item{
    text-align:center;
}

/* EVENT IMAGE */
.event-box{
    width:220px;
    height:350px;
    object-fit:cover;
    border-radius:12px;
    box-shadow:0px 4px 10px rgba(90,62,43,0.2);
    transition: transform 0.35s ease, box-shadow 0.35s ease;
}

/* HOVER EFFECT */
.event-box:hover{
    transform:translateY(-10px) scale(1.03);
    box-shadow:0px 8px 20px rgba(90,62,43,0.35);
}

/* EVENT DATE */
.event-date{
    font-size:14px;
    color:#5a3e2b;
    margin-top:10px;
    font-weight:500;
}

/* FOOTER */
footer{
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
    <div class="logo">
        Campus Event Portal
    </div>

    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="#events">View Events</a>
        <a href="eventdetails.jsp">Event Details</a>
        <a href="register.jsp">Register</a>
        <a href="adminLogin.jsp">Admin</a>
    </div>
</div>

<section class="hero">
    <h1>Campus Event Registration Portal</h1>
</section>

<section class="events" id="events">
<h2>Upcoming Events</h2>

<div class="event-container">

    <div class="event-item">
        <a href="eventdetails.jsp?id=1">
            <img src="event1.jpg" class="event-box">
        </a>
    </div>

    <div class="event-item">
        <a href="eventdetails.jsp?id=2">
            <img src="event2.jpg" class="event-box">
        </a>
    </div>

    <div class="event-item">
        <a href="eventdetails.jsp?id=3">
            <img src="event3.jpg" class="event-box">
        </a>
    </div>

    <div class="event-item">
        <a href="eventdetails.jsp?id=4">
            <img src="event4.jpg" class="event-box">
        </a>
    </div>

    <div class="event-item">
        <a href="eventdetails.jsp?id=5">
            <img src="event5.jpg" class="event-box">
        </a>
    </div>

    <div class="event-item">
        <a href="eventdetails.jsp?id=6">
            <img src="event6.jpg" class="event-box">
        </a>
    </div>

    <div class="event-item">
        <a href="eventdetails.jsp?id=7">
            <img src="event7.jpg" class="event-box">
        </a>
    </div>

    <div class="event-item">
        <a href="eventdetails.jsp?id=8">
            <img src="event8.jpg" class="event-box">
        </a>
    </div>

</div>
</section>

<footer>
    © 2026 Stella Maris College | Campus Event Portal | All Rights Reserved
</footer>

</body>
</html>
