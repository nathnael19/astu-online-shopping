<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Shopping</title>
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
        <style>.error-message {
                color: red;
                font-size: 0.9em;
                margin-bottom: 15px;
                text-align: center;
            }</style>
    </head>
    <body>
        <%@include file="userNav.jsp"%>
        <div class="error-message">
            <%                    String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
            <div class="error-message">
                <%= errorMessage%>
            </div>
            <% }%>
        </div>
        <form class="my-2" action="search.jsp" method="post" style="display:flex;justify-content: end">
            <input type="search" name="search" placeholder="Search..."><!-- Search input -->
            <button type="submit"><img src="../assets/search.svg"></button>
        </form>

        <!-- Container for the products -->
        <div class="container">
            <div class="row">
                <%
                    try {
                        Connection con = DatabaseProvider.getConn();
                        String qq = "SELECT * FROM products";
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(qq);
                        while (rs.next()) {
                %>
                <div class="col-md-3 mb-4">
                    <!-- Product Card -->
                    <div class="card" style="border: 1px solid #ddd; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
                        <!-- Image Section -->
                        <div style="text-align: center; padding: 10px;">
                            <img src="../productImages/<%=rs.getString(4)%>" width="100%" height="150px" alt="Product Image"/>
                        </div>

                        <!-- Product Details Section -->
                        <div style="padding: 10px; font-family: Arial, sans-serif;">
                            <div>
                                <strong>Name:</strong> <%=rs.getString(2)%><br>
                                <strong>Category:</strong> <%=rs.getString(3)%><br>
                                <strong>Price:</strong> $<%=rs.getString(6)%>

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
                            </div>
                            <div style="text-align: center; margin-top: 10px;">
                                <a href="cartAction.jsp?productIdCart=<%=rs.getInt(1)%>" class="btn btn-primary btn-sm">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>

        <script src="../bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
