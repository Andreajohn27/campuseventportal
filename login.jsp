<%-- 
    Document   : login
    Created on : 17-Mar-2026, 9:32:17 pm
    Author     : acer
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <style>
      
       body { 
    margin:0; 
    font-family: Arial, sans-serif; 
    background: url('campus.jpg') no-repeat center center/cover;
    position: relative;
    color:#3e2c23;
}

        body::before {
    content: "";
    position: fixed;
    top:0; left:0; right:0; bottom:0;
    background: rgba(255, 248, 240, 0.75); /* light warm overlay */
    z-index:-1; }

        
    .login-bg {
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    position:relative;
    animation:fadeIn 1s ease-in-out;

}

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

        .box {
            color: #6f4e37;
            max-width: 500px;
            margin: 120px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        input, select, button {
            width: 90%;
            padding: 10px;
            margin: 8px;
            border-radius:5px;
        }

        button {
            background: #6f4e37;
            color: white;
            margin: 40px auto;
            margin-left: 23px;
            border-radius:5px;
            border: none;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>
    
<nav class="navbar">
    <h2>Stella Maris College - Event Registration Portal</h2>
    </nav>
    
    
<div class="box">

    <h2>Login</h2>

    <!-- Error Message -->
    <p class="error">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </p>

    <form action="LoginServlet" method="post">

        <select name="role" required>
            <option value="">-- Select Role --</option>
            <option value="student">Student</option>
            <option value="admin">Admin</option>
        </select>

        <h4>Student</h4>
        <input type="text" name="name" placeholder="Name">
        <input type="text" name="dept" placeholder="Department">
        <input type="password" name="password" placeholder="Password">

        <h4>Admin</h4>
        <input type="text" name="adminUser" placeholder="Username">
        <input type="password" name="adminPass" placeholder="Password">

        <button type="submit">Login</button>

    </form>
</div>
</body>
</html>
