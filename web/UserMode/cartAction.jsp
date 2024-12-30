<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*" %>
<%
            String username11 = (String) session.getAttribute("userName");
            if (username11 == null) {
                // User not logged in, redirect to login page
                response.sendRedirect("../index.jsp");
                return;
            }
        %>

<%                        try {
        Connection con = DatabaseProvider.getConn();
        int productId = Integer.parseInt(request.getParameter("productIdCart"));
        Statement statement = con.createStatement();
        String createCartTable = "CREATE TABLE IF NOT EXISTS cart(cartId int auto_increment primary key, userId int not null, productId int not null,quantity int not null, addedAt timestamp default current_timestamp, foreign key(userId) references users(userId), foreign key(productId) references products(productId));";
        statement.executeUpdate(createCartTable);

        int userId = (Integer) session.getAttribute("userId");
        int price = 0;
        int quantity = 1;
        int totalPrice = 0;

        String check = "select * from cart where userId='" + userId + "'and productId='" + productId + "';";
        String inc = "update cart set quantity=?, where userId='" + userId + "'and productId='" + productId + "';";
        Statement sstt = con.createStatement();
        ResultSet rsCheck = sstt.executeQuery(check);
        if (rsCheck.next()) {
            quantity = rsCheck.getInt(4);
            quantity++;
            int cartId = (Integer) rsCheck.getInt(1);
            Statement sst = con.createStatement();
            String qqqq = "update cart set quantity=? where cartId='" + cartId + "';";
            PreparedStatement ppp = con.prepareStatement(qqqq);
            ppp.setInt(1, quantity);
            int row = ppp.executeUpdate();
            if (row > 0) {
                request.setAttribute("errorMessage", "Successfully increamented");
                request.getRequestDispatcher("homePage.jsp").forward(request, response);
            }
        } else {
            String insertQuery = "insert into cart(userId,productId,quantity) values(?,?,?);";
            PreparedStatement stmt = con.prepareStatement(insertQuery);
            totalPrice = quantity * price;
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);

            int row = stmt.executeUpdate();
            if (row > 0) {
                request.setAttribute("errorMessage", "Successfully Added to the Cart!.");
                request.getRequestDispatcher("homePage.jsp").forward(request, response);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Something went wrong!");
        request.getRequestDispatcher("homePage.jsp").forward(request, response);
    }
%>
