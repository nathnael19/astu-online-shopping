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
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                color: #333;
                margin: 0;
                padding: 0;
            }

            .error-message {
                color: red;
                font-size: 0.9em;
                margin-bottom: 15px;
                text-align: center;
            }

            .card {
                border: none;
                border-radius: 1rem;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                margin: 1rem;
            }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            }

            .card-img-top {
                transition: transform 0.3s ease;
            }

            .card-img-top:hover {
                transform: scale(1.1);
            }

            .btn-add {
                background-color: #28a745;
                color: white;
                font-weight: 600;
                border-radius: 1rem;
                padding: 0.75rem 1.25rem;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .btn-add:hover {
                background-color: #218838;
                transform: scale(1.05);
            }

            .card-body {
                padding: 1.25rem;
            }

            .card-title {
                font-size: 1.25rem;
                font-weight: 700;
                color: #333;
            }

            .card-text.text-success {
                font-size: 1.1rem;
                font-weight: 600;
            }

            .card-text {
                color: #555;
                font-size: 0.95rem;
            }

            footer {
                background-color: #343a40;
                color: white;
                text-align: center;
                padding: 1rem 0;
                margin-top: 2rem;
            }

            .search-container {
                display: flex;
                justify-content: flex-end;
                margin: 1rem 0;
            }

            .search-container input {
                width: 270px;
                margin-right: 0.5rem;
            }

            .product-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: start;
            }
        </style>
    </head>
    <body>
          <%
            String usernameCheck = (String) session.getAttribute("userName");
            if (usernameCheck == null) {
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

        <div class="error-message">
            <% String errorMessage = (String) request.getAttribute("errorMessage");
               if (errorMessage != null) {
            %>
            <div class="error-message">
                <%= errorMessage %>
            </div>
            <% } %>
        </div>

        <form class="search-container" action="search.jsp" method="post">
            <input class="form-control" type="search" name="search" placeholder="Search...">
            <button class="btn btn-warning" type="submit">
                <img src="${pageContext.request.contextPath}/assets/search.svg" alt="Search">
            </button>
        </form>

        <div class="product-container">
            <% try {
                   Connection con = DatabaseProvider.getConn();
                   String query = "SELECT * FROM products";
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery(query);
                   while (rs.next()) {
            %>
            <div class="card" style="width: 18rem;">
                <img src="../productImages/<%=rs.getString(4)%>" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title"><%= rs.getString(2) %></h5>
                    <p class="card-text text-success">$<%= rs.getString(6) %></p>
                    <p class="card-text"><%= rs.getString(5) %></p>
                    <a href="cartAction.jsp?productIdCart=<%= rs.getInt(1) %>" class="btn btn-success w-100 btn-add">Add to Cart</a>
                </div>
            </div>
            <% }
               } catch (Exception e) {
                   e.printStackTrace();
               }
            %>
        </div>

        <footer>&COPY; 2025 SuQ Online Shopping</footer>
        <script src="../bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
