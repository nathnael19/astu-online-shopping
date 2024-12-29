<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="aos.dao.DatabaseProvider" %>
<%@page import="java.sql.*" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Orders - Online Shopping</title>
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
    </head>
    <body>
        <%@include file="adminNav.jsp"%>
        <div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Product Name</th>
                            <th>Electronic</th>
                            <th>Total Price</th>
                            <th>Payment Method</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <%
//                        int userId = (Integer) session.getAttribute("userId");
                        try {
                            Connection con = DatabaseProvider.getConn();
                            String qq = "SELECT p.name,p.category,o.totalPrice,o.paymentMethod,o.status ,o.createdAt,o.orderId FROM Orders o JOIN Products p ON o.productId = p.productId;";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(qq);
                            while (rs.next()) {
                    %>
                    <tbody>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td>
                                <a href="acceptOrder.jsp?orderId=<%=rs.getInt(7)%>" class="btn btn-success btn-sm">Accept</a>
                                <a href="rejectOrder.jsp?orderId=<%=rs.getInt(7)%>" class="btn btn-danger btn-sm ms-2">Reject</a>
                            </td>
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
        <script src="../bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
