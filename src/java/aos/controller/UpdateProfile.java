package aos.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import aos.dao.DatabaseProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.FileOutputStream;
import java.io.InputStream;

@WebServlet("/UpdateProfile")
@MultipartConfig
public class UpdateProfile extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Part file = request.getPart("picturePicture");
        String imageFileName = file.getSubmittedFileName();
        String uploadPath = "C:/Users/DELL/Documents/NetBeansProjects/AstuOnlineShopping/web/productImages/" + imageFileName;
        HttpSession session = request.getSession();

        int userId = (Integer) session.getAttribute("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        String qq = "update users set fullName=?, email=?, phoneNumber=?, address=?, city=?, region=?, profilePicture=? where userId='" + userId + "';";
        try (FileOutputStream fos = new FileOutputStream(uploadPath)) {
            InputStream fis = file.getInputStream();

            byte[] data = new byte[fis.available()];
            fis.read(data);
            fos.write(data);
        }
        try {
            Connection connection = DatabaseProvider.getConn();
            PreparedStatement stmt = connection.prepareStatement(qq);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, address);
            stmt.setString(5, city);
            stmt.setString(6, region);
            stmt.setString(7,imageFileName);

            int row = stmt.executeUpdate();

            if (row > 0) {
                response.sendRedirect("UserMode/userProfile.jsp?msg=success");
            } else {
                response.sendRedirect("UserMode/userProfile.jsp?msg=fail");
            }

        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
