package aos.controller;

import aos.dao.DatabaseProvider;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/PaymentMethod")
public class PaymentMethod extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String createOrderTable = "CREATE TABLE IF NOT EXISTS orders(orderId int auto_increment primary key, userId int not null,productId int not null,totalPrice decimal(10,2) not null,paymentMethod varchar(100) not null,bankAcc varchar(50), status varchar(50) not null, createdAt timestamp default current_timestamp, foreign key(userId) references users(userId),foreign key(productId) references products(productId));";
        String query1 = "insert into orders(userId,productId,totalPrice,paymentMethod,bankAcc,status) values(?,?,?,?,?,?);";

        HttpSession session = request.getSession();
        int userId = (Integer) session.getAttribute("userId");
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        String paymentMethod = request.getParameter("paymentMethod");
        String bankAcc = request.getParameter("bankAcc");
        int totalPrice = Integer.parseInt(request.getParameter("totalPP"));
        int productId = Integer.parseInt(request.getParameter("ppId"));

//        PrintWriter out = response.getWriter();
//        out.println(totalPrice);
        try {
            Connection connection = DatabaseProvider.getConn();
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(createOrderTable);

            PreparedStatement pstmt = connection.prepareStatement(query1);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, productId);
            pstmt.setInt(3, totalPrice);
            pstmt.setString(4, paymentMethod);
            pstmt.setString(5, bankAcc);
            pstmt.setString(6, "Processing");

            int row = pstmt.executeUpdate();
            if (row > 0) {
                String deleteFromCart = "delete from cart where cartId='"+cartId+"'";
                
                Statement stmtt = connection.createStatement();
                int row2 = stmtt.executeUpdate(deleteFromCart);
                if (row2 > 0) {
                    response.sendRedirect("UserMode/order.jsp");
                }
            } else {
                response.sendRedirect("UserMode/homePage.jsp");
            }

        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }

}
