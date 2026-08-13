package com.college.admission_system;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        try {

            // ============================
            // ✅ ADMIN LOGIN
            // ============================
            String role = req.getParameter("role");

            if ("admin".equals(role) && "admin".equals(username) && "admin123".equals(password)) {
                session.setAttribute("user", "admin");
                res.sendRedirect(req.getContextPath() + "/admin/adminDashboard.jsp");
                return;
            }

            // ============================
            // ✅ STUDENT LOGIN
            // ============================
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM students WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // ✅ STORE CORRECT DATA FROM DATABASE
                session.setAttribute("user", rs.getString("username"));
                session.setAttribute("appId", rs.getString("applicant_id")); // 🔥 IMPORTANT
                session.setAttribute("applicantName", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));

                // ❌ REMOVE EMAIL SENDING HERE (NOT NEEDED)

                // ✅ REDIRECT
                res.sendRedirect("admission/form.jsp");

            } else {
                res.sendRedirect("login.jsp?error=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}