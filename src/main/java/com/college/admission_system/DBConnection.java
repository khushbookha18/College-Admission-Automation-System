package com.college.admission_system;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {
            String url = "jdbc:mysql://localhost:3306/college_admission";
            String user = "root";
            String password = "";

            // ✅ ADD HERE
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, password);

            System.out.println("DB Connected Successfully!");

            return conn;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}