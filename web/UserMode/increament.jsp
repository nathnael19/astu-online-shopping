<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*" %>
<%
            String username13 = (String) session.getAttribute("userName");
            if (username13 == null) {
                // User not logged in, redirect to login page
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
<%
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("../index.jsp?msg=Login_First");
            }
        %>
<%  
    
    int productId = Integer.parseInt(request.getParameter("productId"));
    int quantity = 1;

    String check = "select * from cart where userId='" + userId + "'and productId='" + productId + "';";
    try {
        Connection con = DatabaseProvider.getConn();
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
                response.sendRedirect("cart.jsp");
            }
        }
    } catch (Exception e) {

    }
%>