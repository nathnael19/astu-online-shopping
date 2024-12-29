package aos.controller;

import aos.dao.DatabaseProvider;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String securityQuestion = request.getParameter("securityQuestion");
        String securityAnswer = request.getParameter("securityAnswer");
        String confirmPassword = request.getParameter("confirmPassword");

        try {
            Connection connection = DatabaseProvider.getConn();
            Statement stmt = connection.createStatement();
            String qq = "select * from users where securityAnswer='" + securityAnswer + " and securityQuestion='" + securityQuestion + "';";
            String q2 = "update users set password='" + password + "' where userName='" + userName + "'";

            String check = "select * from users where userName='" + userName + "'";
            if (password.equals(confirmPassword)) {
                ResultSet rs = stmt.executeQuery(check);
                if (rs.next()) {
                    ResultSet rs1 = stmt.executeQuery(qq);
                    while (rs1.next()) {
                        if (rs1.next()) {
                            stmt.executeUpdate(q2);
                            response.sendRedirect("index.jsp");
                        } else {
                            request.setAttribute("errorMessage", "Invalid userName or password. Please try again.");
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
