package aos.controller;

import aos.dao.DatabaseProvider;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/SignupAction")
public class SignupAction extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String securityQuestion = request.getParameter("securityQuestion");
        String securityAnswer = request.getParameter("securityAnswer");
        String userName = request.getParameter("userName");

        String createUserTable = "CREATE TABLE IF NOT EXISTS users(userId int auto_increment primary key,userName varchar(50) not null unique,fullName varchar(100) not null,email varchar(100) not null unique,gender varchar(10), phoneNumber varchar(10) not null unique, address varchar(50),city varchar(50),region varchar(50), securityQuestion varchar(100) not null,securityAnswer varchar(100) not null,dob varchar(50) not null,password varchar(35) not null,joinedAt timestamp default current_timestamp, profilePicture varchar(255));";

        String insertUser = "INSERT INTO users(userName,fullName,email,gender,phoneNumber,address,city,region,securityQuestion,securityAnswer,dob,password) VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";

        try {
            Connection connection = DatabaseProvider.getConn();
            Statement st = connection.createStatement();
            st.executeUpdate(createUserTable);
            PreparedStatement ps = connection.prepareStatement(insertUser);

            ps.setString(1, userName);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, gender);
            ps.setString(5, phoneNumber);
            ps.setString(6, address);
            ps.setString(7, city);
            ps.setString(8, region);
            ps.setString(9, securityQuestion);
            ps.setString(10, securityAnswer);
            ps.setString(11, dob);
            ps.setString(12, password);

            int row1 = ps.executeUpdate();

            if (row1 > 0) {
                response.sendRedirect("index.jsp?msg=success");
            } else {
                response.sendRedirect("signup.jsp?msg=fail");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
