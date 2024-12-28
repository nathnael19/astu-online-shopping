<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*"%>

<%
//    int userId = Integer.parseInt(request.getParameter("userId"));
    int productId = Integer.parseInt(request.getParameter("productId"));

    String query = "delete from products where productId='" + productId + "'";

    try {
        Connection connection = DatabaseProvider.getConn();
        Statement stmt = connection.createStatement();
        int row4 = stmt.executeUpdate(query);
        if (row4 > 0) {
            response.sendRedirect("adminHomePage.jsp");
        } else {
            request.setAttribute("errorMessage", "Something went wrong!. Please try again.");
            request.getRequestDispatcher("adminHomePage.jsp").forward(request, response);
        }
//        }

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Something went wrong! there might be in someone's cart. Please try again.");
            request.getRequestDispatcher("adminHomePage.jsp").forward(request, response);
    }

%>