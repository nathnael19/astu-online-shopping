<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/> <!-- Include Bootstrap CSS for styling -->
    </head>
    <body>
        <%@include file="userNav.jsp" %>
        <div class="container mt-4">
            <% 
                String query = "SELECT * FROM notifications";
                try {
                    Connection connection = DatabaseProvider.getConn();
                    PreparedStatement ps = connection.prepareStatement(query);

                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <!-- Each notification in a separate card -->
            <div class="card mb-3">
                <div class="card-header">
                    <strong><%= rs.getString(2) %></strong> <!-- Notification title -->
                </div>
                <div class="card-body">
                    <p><%= rs.getString(3) %></p> <!-- Notification description -->
                    <a href="homePage.jsp" class="btn btn-primary btn-sm">Check it out</a>
                </div>
            </div>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>

        <script src="../bootstrap/bootstrap.bundle.min.js"></script> <!-- Include Bootstrap JS -->
    </body>
</html>
