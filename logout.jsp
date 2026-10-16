<%-- 
    Document   : logout
    Created on : 15-Mar-2026, 1:25:25 pm
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    // Destroy the admin session
    session.invalidate();

    // Redirect back to admin login page
    response.sendRedirect("adminLogin.jsp");
%>
