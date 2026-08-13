package com.college.admission_system;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        // ✅ Get session
        HttpSession session = req.getSession();

        // ✅ Destroy session (logout)
        session.invalidate();

        // ✅ Redirect to login page
        res.sendRedirect("login.jsp");
    }
}
