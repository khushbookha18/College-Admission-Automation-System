package com.college.admission_system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement checkPs = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();

            // ============================
            // 🔍 CHECK EMAIL OR USERNAME EXISTS
            // ============================
            String checkSql = "SELECT * FROM students WHERE email=? OR username=?";
            checkPs = conn.prepareStatement(checkSql);
            checkPs.setString(1, email);
            checkPs.setString(2, username);

            rs = checkPs.executeQuery();

            if (rs.next()) {
                response.sendRedirect("register.jsp?error=exists");
                return;
            }

            // ============================
            // ✅ GENERATE ONE UNIQUE APP ID
            // ============================
            String applicantId = "APP" + System.currentTimeMillis();

            // ============================
            // ✅ INSERT USER
            // ============================
            String sql = "INSERT INTO students (applicant_id, name, email, username, password, status) VALUES (?, ?, ?, ?, ?, 'Pending')";
            ps = conn.prepareStatement(sql);

            ps.setString(1, applicantId);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, username);
            ps.setString(5, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                HttpSession session = request.getSession();

                // ✅ IMPORTANT: USE SAME KEYS EVERYWHERE
                session.setAttribute("appId", applicantId);
                session.setAttribute("applicantName", name);
                session.setAttribute("email", email);

                // ============================
                // ✅ SEND EMAIL
                // ============================
                String subject = "Registration Successful";
                String message = "Hello " + name + ",\n\n"
                        + "Your Applicant ID: " + applicantId + "\n\n"
                        + "Use this ID for admission process.\n\n"
                        + "Thank you.";

                EmailSender.sendEmail(email, subject, message);

                // ✅ REDIRECT
                response.sendRedirect("login.jsp?success=registered");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=server");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (checkPs != null) checkPs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}