package com.college.admission_system;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Admin credentials
    private final String ADMIN_USER = "admin";
    private final String ADMIN_PASS = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // ✅ LOGIN SUCCESS
        if (ADMIN_USER.equals(username) && ADMIN_PASS.equals(password)) {

            // Destroy old session (security best practice)
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            // Create new session
            HttpSession session = request.getSession(true);
            session.setAttribute("admin", username);

            // Set session timeout (optional)
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // ✅ FIX: Use context path (important)
            response.sendRedirect(request.getContextPath() + "/admin/adminDashboard.jsp");

        } else {

            // ❌ LOGIN FAILED → redirect back with error param
            response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp?error=1");
        }
    }

    // Optional: handle direct GET request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Redirect GET access to login page
        response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
    }
}