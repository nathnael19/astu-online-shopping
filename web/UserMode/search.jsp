<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Shopping</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css"/>
    </head>
    <body>
<%
            String username19 = (String) session.getAttribute("userName");
            if (username19 == null) {
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

        <%@include file="userNav.jsp"%>
        <form class="my-2" method="post" action="search.jsp" style="display:flex;justify-content: end">
            <input type="search" name="search" placeholder="Search..."><!-- Search input -->
            <button type="submit"><i class="fa fa-search search"></i></button>
        </form>

        <div style="display: flex; flex-wrap: wrap; gap: 10px; justify-content: start;">
            <%        String name = request.getParameter("search");
                int x = 0;
                try {
                    Connection con = DatabaseProvider.getConn();
                    String qq = "SELECT * FROM products where name like'%" + name + "%' or category like '%" + name + "%'";

                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(qq);

                    while (rs.next()) {
            %>
            <div class="card" style="width: 240px; border: 1px solid #ddd; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
                <!-- Image Section -->

                <div style="text-align: center; padding: 10px;">
                    <img src="../productImages/<%=rs.getString(4)%>" width="100%" height="150px" alt="Product Image"/>
                </div>
                <!-- Product Details Section -->
                <div style="padding: 10px; font-family: Arial, sans-serif;">
                    <div>
                        <strong>Name:</strong> <%=rs.getString(2)%><br>
                        <strong>Category:</strong> <%=rs.getString(3)%><br>
                        <strong>Price:</strong> $<%=rs.getInt(6)%>
                    </div>
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" 
                                        aria-expanded="false" aria-controls="collapseOne">
                                    Description
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <%=rs.getString(5)%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: center; margin-top: 10px;">
                        <a href="cartAction.jsp?productId=<%=rs.getInt(1)%>" class="btn btn-primary btn-sm">Add to Cart</a>
                    </div>
                </div>
            </div>
            <%
                        x++;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (x == 0) {
            %>
            <div class="h5" style="margin:0 auto;">No Result Found!</div>
            <%}%>
        </div>

        <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
