/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("eventId"));
        String name = request.getParameter("eventName");
        String type = request.getParameter("eventType");
        String desc = request.getParameter("description");
        String date = request.getParameter("eventDate");
        String venue = request.getParameter("eventVenue");
        String img = request.getParameter("imagePath");

        try {

            Class.forName("org.apache.derby.jdbc.ClientDriver");

            Connection con = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/evDB", "app", "app");

            String sql = "INSERT INTO events VALUES (?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, type);   // FIXED ORDER
            ps.setString(4, desc);
            ps.setString(5, date);
            ps.setString(6, venue);
            ps.setString(7, img);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("addevent.jsp?msg=success");
            } else {
                response.sendRedirect("addevent.jsp?msg=fail");
            }

            con.close();

        } catch (Exception e) {
            response.sendRedirect("addevent.jsp?msg=error");
        }
    }
}
