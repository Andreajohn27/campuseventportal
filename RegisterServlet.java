/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String event = request.getParameter("event");
        boolean isGroupEvent = "Team GD".equalsIgnoreCase(event) || 
                               "Concert the Star".equalsIgnoreCase(event);

        String name = request.getParameter("name");
        String deptNumber = request.getParameter("deptNumber");
        String deptName = request.getParameter("deptName");
        String year = request.getParameter("year");
        String participatedBefore = request.getParameter("participatedBefore");
        String wonBefore = request.getParameter("wonBefore");
        String teamName = request.getParameter("teamName");

        // 🔥 LAST DATE VALIDATION
        java.util.Map<String, java.util.Calendar> eventDeadlines = new java.util.HashMap<>();
        java.util.Calendar cal = java.util.Calendar.getInstance();

        // First 5 events - deadlines in April
        cal.set(java.util.Calendar.MONTH, java.util.Calendar.APRIL);
        cal.set(java.util.Calendar.DAY_OF_MONTH, 2);
        eventDeadlines.put("Quiz Night", (java.util.Calendar) cal.clone());

        cal.set(java.util.Calendar.DAY_OF_MONTH, 5);
        eventDeadlines.put("Twilight Coding", (java.util.Calendar) cal.clone());

        cal.set(java.util.Calendar.DAY_OF_MONTH, 8);
        eventDeadlines.put("Art Fiesta", (java.util.Calendar) cal.clone());

        cal.set(java.util.Calendar.DAY_OF_MONTH, 10);
        eventDeadlines.put("Book Fair", (java.util.Calendar) cal.clone());

        cal.set(java.util.Calendar.DAY_OF_MONTH, 15);
        eventDeadlines.put("Freshers Day", (java.util.Calendar) cal.clone());

        // Last 3 events - remain in March
        cal.set(java.util.Calendar.MONTH, java.util.Calendar.MARCH);
        cal.set(java.util.Calendar.DAY_OF_MONTH, 26);
        eventDeadlines.put("Class Meet", (java.util.Calendar) cal.clone());

        cal.set(java.util.Calendar.DAY_OF_MONTH, 27);
        eventDeadlines.put("Team GD", (java.util.Calendar) cal.clone());

        cal.set(java.util.Calendar.DAY_OF_MONTH, 28);
        eventDeadlines.put("Concert the Star", (java.util.Calendar) cal.clone());

        java.util.Calendar today = java.util.Calendar.getInstance();

        if (event != null && eventDeadlines.containsKey(event)) {
            java.util.Calendar lastDate = eventDeadlines.get(event);

            if (today.after(lastDate)) {
                request.setAttribute("message", "Registration closed for " + event + 
                        "! Last date was " + (lastDate.get(java.util.Calendar.MONTH)+1) 
                        + "/" + lastDate.get(java.util.Calendar.DAY_OF_MONTH));
                request.setAttribute("color", "red");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        }

        String dbURL = "jdbc:derby://localhost:1527/evDB";
        String dbUser = "app";
        String dbPass = "app";

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // 🔥 COUNT LIMIT CHECK
            PreparedStatement psCount = conn.prepareStatement(
                    "SELECT COUNT(*) FROM registrations WHERE event=? AND deptNumber=?"
            );

            psCount.setString(1, event);
            psCount.setString(2, deptNumber);

            ResultSet rsCount = psCount.executeQuery();
            rsCount.next();
            int count = rsCount.getInt(1);

            if (count >= 7) {
                request.setAttribute("message", "Registration blocked! Maximum 7 participants per department.");
                request.setAttribute("color", "red");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            } else {
                PreparedStatement psInsert = conn.prepareStatement(
                        "INSERT INTO registrations(event,name,deptNumber,deptName,studentyear,"
                        + "participatedBefore,wonBefore,teamName) VALUES(?,?,?,?,?,?,?,?)"
                );

                psInsert.setString(1, event);
                psInsert.setString(2, name);
                psInsert.setString(3, deptNumber);
                psInsert.setString(4, deptName);
                psInsert.setString(5, year);
                psInsert.setString(6, participatedBefore);
                psInsert.setString(7, wonBefore);
                psInsert.setString(8, isGroupEvent ? (teamName != null ? teamName : "") : "");

                psInsert.executeUpdate();

                request.setAttribute("message", "Successfully registered for " + event + "!");
                request.setAttribute("color", "green");
            }

            conn.close();

        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("color", "red");
        }

        request.getRequestDispatcher("register.jsp").forward(request, response); 
    }
}
