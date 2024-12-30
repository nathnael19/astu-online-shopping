<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*" %>

<%
    int productId = Integer.parseInt(request.getParameter("productId"));

    try {
        Connection conn = DatabaseProvider.getConn();
        Statement stmt = conn.createStatement();

        String deleteQuery = "delete from cart where productId='" + productId + "';";

        int row = stmt.executeUpdate(deleteQuery);
        if (row > 0) {
            response.sendRedirect("cart.jsp");
        }
    } catch (Exception e) {

    }


%>