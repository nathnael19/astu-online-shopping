package aos.dao;

import java.sql.*;

public class DatabaseProvider {

    static Connection connection = null;
    static String url = "jdbc:mysql://localhost:3306/";
    static String userName = "root";
    static String password = "root";

    public static Connection getConn() {
        String createDatabase = "create database if not exists suq;";
        String useDatabase = "use suq;";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, userName, password);
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(createDatabase);
            stmt.executeUpdate(useDatabase);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return connection;
    }
}
