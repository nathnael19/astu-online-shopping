<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="aos.dao.DatabaseProvider" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css"/>
        <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    </head>
    <body>
               <%
            String username15 = (String) session.getAttribute("userName");
            if (username15 == null) {
                // User not logged in, redirect to login page
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
        <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Prevent caching
%>
        <%@include file="userNav.jsp" %>
        <div class="my-6">
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price ($)</th>
                            <th>Payment Method</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <%
                        int userId = (Integer) session.getAttribute("userId");
                        String status = "";
                        try {
                            Connection con = DatabaseProvider.getConn();
                            String qq = "SELECT p.name,p.category,o.totalPrice,o.paymentMethod,o.status ,o.createdAt,o.orderId FROM Orders o JOIN Products p ON o.productId = p.productId where o.userId='" + userId + "';";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(qq);
                            while (rs.next()) {
                                status = rs.getString(5);
                    %>
                    <tbody>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=status%></td>

                            <td><%=rs.getString(6)%></td>
                            <%if (status.equals("Shipping")) {%>
                            <td><a href="acceptOrder.jsp?orderId=<%=rs.getInt(7)%>" class="btn btn-success btn-sm">Received</a><td>
                                <%}%>

                        </tr>
                        <%    }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
