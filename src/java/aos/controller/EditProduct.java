package aos.controller;

import aos.dao.DatabaseProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String category = request.getParameter("productCategory");
        int price = Integer.parseInt(request.getParameter("price"));

        try {
            Connection connection = DatabaseProvider.getConn();
            Statement stmt = connection.createStatement();

            String qq = "select * from products where productId='" + productId + "'";
            String updateProduct = "update products set name=?, category=?, price=? where productId='" + productId + "';";
            PreparedStatement st = connection.prepareStatement(updateProduct);

            ResultSet rs = stmt.executeQuery(qq);
            while (rs.next()) {
                st.setString(1, name);
                st.setString(2, category);
                st.setInt(3, price);

                int row = st.executeUpdate();

                if (row > 0) {
                    request.setAttribute("errorMessage", "Successfully Updated.");
                    request.getRequestDispatcher("AdminMode/adminHomePage.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Something went wrong!. Please try again.");
                    request.getRequestDispatcher("AdminMode/adminHomePage.jsp").forward(request, response);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong!. Please try again.");
            request.getRequestDispatcher("AdminMode/adminHomePage.jsp").forward(request, response);
        }
    }
}
