package com.college.admission_system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        try {
            Connection conn = DBConnection.getConnection();

            // Check if email exists
            String sql = "SELECT * FROM students WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Generate new password
                String newPassword = "PWD" + new Random().nextInt(9999);

                // Update password in DB
                String updateSql = "UPDATE students SET password=? WHERE email=?";
                PreparedStatement ps2 = conn.prepareStatement(updateSql);
                ps2.setString(1, newPassword);
                ps2.setString(2, email);
                ps2.executeUpdate();

                // Send email
                String subject = "Password Reset";
                String message = "Your new password is: " + newPassword;

                EmailSender.sendEmail(email, subject, message);

                response.getWriter().println("New password sent to your email!");

            } else {
                response.getWriter().println("Email not registered!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}