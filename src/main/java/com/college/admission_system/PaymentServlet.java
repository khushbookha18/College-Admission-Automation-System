package com.college.admission_system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appId = request.getParameter("appId");

        try {
            Connection con = DBConnection.getConnection();

            // ✅ USE applicant_id
            String sql = "UPDATE students SET payment_status='Paid' WHERE applicant_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, appId);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/paymentSuccess.jsp?appId=" + appId);
            } else {
                response.getWriter().println("❌ Payment Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}