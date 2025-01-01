<%@page import="aos.dao.DatabaseProvider" %>
<%@page import="java.sql.*" %>

<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    String updateOrder = "update orders set status='Rejected' where orderId='" + orderId + "';";
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