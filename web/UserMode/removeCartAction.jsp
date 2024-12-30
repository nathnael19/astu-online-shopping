<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*" %>
<%
            String username18 = (String) session.getAttribute("userName");
            if (username18 == null) {
                // User not logged in, redirect to login page
                response.sendRedirect("../index.jsp");
                return;
            }
        %>

<%
    int productId = Integer.parseInt(request.getParameter("productId"));

    try {
        Connection conn = DatabaseProvider.getConn();
        Statement stmt = conn.createStatement();

        String deleteQuery = "delete from cart where productId='" + productId + "';";

        int row = stmt.executeUpdate(deleteQuery);
        if (row > 0) {
            request.setAttribute("errorMessage", "Successfull Removed from our Cart!!");
        request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    } catch (Exception e) {

    }


%>