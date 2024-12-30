package aos.controller;

import aos.dao.DatabaseProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Part file = request.getPart("fileUrl");
        String imageFileName = file.getSubmittedFileName();
        String uploadPath = "C:/Users/DELL/Desktop/clone/astu-online-shopping/web/productImages/" + imageFileName;
        String name = request.getParameter("name");
        String category = request.getParameter("productCategory");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        try {
            Connection connection = DatabaseProvider.getConn();
            Statement st = connection.createStatement();

            String createNotificationTable = "CREATE TABLE IF NOT EXISTS notifications (nid int auto_increment primary key, title varchar(50) not null,msg varchar(100) not null, userId int,createdAt timestamp default current_timestamp, foreign key(userId) references users(userId));";
            String createProductTable = "CREATE TABLE IF NOT EXISTS products(productId int auto_increment primary key, name varchar(50) not null,category varchar(50) not null,imageUrl varchar(255) not null, description TEXT, price decimal(10,2) not null, addedAt timestamp default current_timestamp);";
            String insertProduct = "INSERT INTO products(name,category,imageUrl,description,price) VALUES(?,?,?,?,?);";
            String insertNotification = "INSERT INTO notifications(title,msg) values(?,?);";

            st.executeUpdate(createProductTable);
            st.executeUpdate(createNotificationTable);

            try (FileOutputStream fos = new FileOutputStream(uploadPath)) {
                InputStream fis = file.getInputStream();

                byte[] data = new byte[fis.available()];
                fis.read(data);
                fos.write(data);
            }

            PreparedStatement ps = connection.prepareStatement(insertProduct);
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setString(3, imageFileName);
            ps.setString(4, description);
            ps.setInt(5, price);

            int row = ps.executeUpdate();
            if (row > 0) {
                PreparedStatement ps2 = connection.prepareStatement(insertNotification);
                ps2.setString(1, "New Product Added");
                ps2.setString(2, "A new Product <html><strong>" + name + "</strong></html> has been added to the store");

                int row2 = ps2.executeUpdate();
                if (row2 > 0) {
                    response.sendRedirect("AdminMode/adminHomePage.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Something went wrong!. Please try again.");
                request.getRequestDispatcher("AdminMode/addProduct.jsp").forward(request, response);
            }

        } catch (IOException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong!. Please try again.");
            request.getRequestDispatcher("AdminMode/addProduct.jsp").forward(request, response);
        }
    }
}
