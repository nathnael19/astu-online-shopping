<%@page import="aos.dao.DatabaseProvider" %>
<%@page import="java.sql.*" %>
<%
            String username2 = (String) session.getAttribute("userName");
            if (username2 == null) {
                // User not logged in, redirect to login page
                response.sendRedirect("../index.jsp");
                return;
            }
        %>

<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    String updateOrder = "update orders set status='Shipping' where orderId='" + orderId + "';";
    try {
        Connection connection = DatabaseProvider.getConn();
        Statement stmt = connection.createStatement();
        int row = stmt.executeUpdate(updateOrder);
        if (row > 0) {
            response.sendRedirect("order.jsp");
        }
    } catch (Exception e) {

    }
%>