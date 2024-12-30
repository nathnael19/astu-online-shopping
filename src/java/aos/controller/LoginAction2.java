package aos.controller;

import aos.dao.DatabaseProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginAction2")
public class LoginAction2 extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        try {
            Connection conn = DatabaseProvider.getConn();
            Statement stmt = conn.createStatement();
            if (email.equals("admin@gmail.com") && password.equals("admin")) {
                session.setAttribute("userName", "admin");
                response.sendRedirect("AdminMode/adminHomePage.jsp");
            } else {
                String query = "SELECT * FROM users WHERE email='" + email + "' and password='" + password + "'";
                ResultSet rs = stmt.executeQuery(query);
                if (rs.next()) {
                    session.setAttribute("userId", rs.getInt(1));
                    session.setAttribute("userName", rs.getString(2));
                    response.sendRedirect("UserMode/homePage.jsp");

                } else {
                    // Invalid credentials
                    System.out.println("Invalid credentials for email: " + email);
                    request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
        } catch (IOException | SQLException e) {
            // Handle database connection or query errors
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again later.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
