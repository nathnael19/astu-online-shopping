<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="aos.dao.DatabaseProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proceed</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css">
        <style>
            .form-container {
                max-width: 600px;
                margin: 50px auto;
                padding: 30px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .hidden{
                display:none;
            }
        </style>
    </head>

    <body>
        <%
            String username17 = (String) session.getAttribute("userName");
            if (username17 == null) {
                // User not logged in, redirect to login page
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
        <%@include file="userNav.jsp"%>

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
                        </tr>
                    </thead>
                    <%            int totalPrice = 0;
                        int ppId = 0;
                        int productId = Integer.parseInt(request.getParameter("productId"));
//                            int total = (Integer)request.getAttribute("total");
                        int total = Integer.parseInt(request.getParameter("total"));
                        try {
                            Connection con = DatabaseProvider.getConn();
                            int userId = (Integer) session.getAttribute("userId");

                            String query = "SELECT p.name,p.category,c.quantity,p.price,p.productId FROM Cart c JOIN Products p ON c.productId = p.productId where c.productId='" + productId + "' and c.userId='" + userId + "';";

                            Statement stt = con.createStatement();
                            ResultSet rs = stt.executeQuery(query);
                            while (rs.next()) {

                    %>
                    <tbody>
                        <tr>
                            <td><%=rs.getString(1)%></td><!-- Name -->
                            <td><%=rs.getString(2)%></td><!-- Category -->
                            <td><%=rs.getInt(3)%></td> <!--Quantity -->
                            <td><%=rs.getInt(4)%></td><!-- Price -->
                            <td><%=(rs.getInt(3) * rs.getInt(4))%></td><!-- Total Price -->

                        </tr>
                        <%   totalPrice = totalPrice + rs.getInt(4);
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="form-container">
            <h2 class="text-center mb-4">Payment</h2>
            <form action="../PaymentMethod" method="post">
                <!-- Payment Method -->
                <div class="mb-3">
                    <label for="paymentMethod" class="form-label">Method</label>
                    <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                        <option selected disabled>Select Payment Method</option>
                        <!--                        <option  value="Telebirr">TeleBirr</option>
                                                <option  value="Mpesa">M-Pesa</option>-->
                        <option value="Enat">Enat International Bank</option>
                        <option  value="Coop">CooP International Bank</option>
                        <option  value="CBE">CBE</option>
                        <option value="Awash">Awash International Bank</option>
                        <option  value="Abysinnia">Abysinnia International Bank</option>
                    </select>
                </div>

                <div id="bank" class="mb-3">
                    <label for="bankAcc" class="form-label">Bank Account</label>
                    <input type="number" name="bankAcc" class="form-control" id="bankAcc" placeholder="Enter Account Number">
                </div>
                <!-- Price -->
                <div class="mb-3">
                    <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
                    <input type="hidden" value="<%=total%>" name="totalPP">
                    <input type="hidden" value="<%=productId%>" name="ppId">
                    <label for="productPrice" class="form-label">Total Price = $<%=total%></label>
                </div>

                <!-- Submit Button -->
                <div class="d-grid gap-2">
                    <button type="submit"  class="btn btn-primary">Proceed</button>
                </div>
            </form>
        </div>

        <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>