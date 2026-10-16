/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


/**
 *
 * @author acer
 */
import java.io.*;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private Connection getConnection() throws Exception {
        // Derby Driver
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        // Derby Connection (change port if needed)
        return DriverManager.getConnection(
            "jdbc:derby://localhost:1527/evDB",
            "app",
            "app"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("role");

        if (role == null || role.isEmpty()) {
            request.setAttribute("error", "Please select a role!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        switch (role) {

            case "admin":
                handleAdminLogin(request, response);
                break;

            case "student":
                handleStudentLogin(request, response);
                break;

            default:
                request.setAttribute("error", "Invalid Role!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void handleAdminLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String username = request.getParameter("adminUser");
        String password = request.getParameter("adminPass");

        try (Connection con = getConnection()) {

           PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM STUDENTS WHERE TRIM(NAME)=? AND TRIM(DEPT)=? AND TRIM(PASSWORD)=?"
);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid Admin Login!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void handleStudentLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String name = request.getParameter("name");
        String dept = request.getParameter("dept");
        String password = request.getParameter("password");

        try (Connection con = getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM students WHERE name=? AND dept=? AND password=?"
            );

            ps.setString(1, name);
            ps.setString(2, dept);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Invalid Student Details!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



