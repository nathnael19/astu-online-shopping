<%@page import="aos.dao.DatabaseProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css"/>
        <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <%@include file="userNav.jsp" %>
        <div class="my-6">
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Quantity</th>
                            <th>Price ($)</th>
                            <th>Total Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <%            int totalPrice = 0;
                        int total = 0;

                        try {
                            Connection con = DatabaseProvider.getConn();
                            int userId = (Integer) session.getAttribute("userId");
                            String query = "SELECT p.name,p.category,c.quantity,p.price, p.productId,c.cartId FROM Cart c JOIN Products p ON c.productId = p.productId where userId='" + userId + "';";

                            Statement stt = con.createStatement();
                            ResultSet rs = stt.executeQuery(query);
                            while (rs.next()) {
                                total = rs.getInt(3) * rs.getInt(4);
                    %>
                    <tbody>
                        <tr>
                            <td><%=rs.getString(1)%></td><!-- Name -->
                            <td><%=rs.getString(2)%></td><!-- Category -->
                            <td><a style="margin:1px 10px 1px 1px" href="decreament.jsp?productId=<%=rs.getInt(5)%>"><button class="btn btn-primary">-</button></a><%=rs.getInt(3)%><a  style="margin:1px 1px 1px 10px" href="increament.jsp?productId=<%=rs.getInt(5)%>"><button class="btn btn-primary">+</button></a></td> <!--Quantity -->
                            <td><%=rs.getInt(4)%></td><!-- Price -->
                            <td><%=total%></td>
                            <td>
                                <a href="proceed.jsp?productId=<%=(Integer) rs.getInt(5)%>&total=<%=total%>&cartId=<%=rs.getInt(6)%>" class="btn btn-primary btn-sm">Buy</a> 
                                <a href="removeCartAction.jsp?productId=<%=rs.getInt(5)%>" class="btn btn-warning btn-sm">Remove</a><!-- Remove Button -->
                            </td>
                        </tr>
                        <%   totalPrice = totalPrice + (rs.getInt(3) * rs.getInt(4));
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                        %>
                    </tbody>
                </table>
            </div>
            <button>Total Price= $<%=totalPrice%></button>
        </div>
    </body>
</html>
