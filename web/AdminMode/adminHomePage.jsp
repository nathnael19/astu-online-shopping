<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Online Shopping</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
    </head>
    <body>
        <%@include file="adminNav.jsp"%>
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
                        <a href="editProduct.jsp?productId=<%=rs.getInt(1)%>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="deleteProduct.jsp?productId=<%=rs.getInt(1)%>" class="btn btn-danger btn-sm ms-2">Delete</a>
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



