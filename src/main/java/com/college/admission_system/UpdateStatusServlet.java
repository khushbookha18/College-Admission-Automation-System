package com.college.admission_system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String idStr = req.getParameter("id");
        String status = req.getParameter("status");

        if (idStr == null || status == null || idStr.isEmpty()) {
            res.getWriter().println("Invalid Request");
            return;
        }

        int id = Integer.parseInt(idStr);

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();

            // ===============================
            // 🔥 NEW: GET OLD STATUS
            // ===============================
            String oldStatus = "";
            ps = con.prepareStatement("SELECT status FROM students WHERE id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                oldStatus = rs.getString("status");
            }

            rs.close();
            ps.close();

            // ===============================
            // 1. UPDATE STATUS
            // ===============================
            ps = con.prepareStatement("UPDATE students SET status=? WHERE id=?");
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();

            ps.close();

            // ===============================
            // 2. GET STUDENT DATA
            // ===============================
            ps = con.prepareStatement(
                    "SELECT name, email, applicant_id FROM students WHERE id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();

            String name = "";
            String email = "";
            String appId = "";

            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
                appId = rs.getString("applicant_id");
            }

            rs.close();
            ps.close();

            // ===============================
            // 3. GET COURSE
            // ===============================
            String course = "";

            if (appId != null && !appId.isEmpty()) {

                ps = con.prepareStatement(
                        "SELECT course FROM admission_form WHERE app_id=?");
                ps.setString(1, appId);
                rs = ps.executeQuery();

                if (rs.next()) {
                    course = rs.getString("course");
                }

                rs.close();
                ps.close();
            }

            // DEBUG
            System.out.println("OLD STATUS = " + oldStatus);
            System.out.println("NEW STATUS = " + status);
            System.out.println("COURSE = " + course);

            // ===============================
            // 🔥 UPDATED SEAT LOGIC
            // ===============================

            // ✅ Reduce seat only when going to Approved
            if ("Approved".equalsIgnoreCase(status) &&
                !"Approved".equalsIgnoreCase(oldStatus) &&
                course != null && !course.isEmpty()) {

                ps = con.prepareStatement(
                        "UPDATE courses SET available_seats = available_seats - 1 " +
                        "WHERE course_name=? AND available_seats > 0");

                ps.setString(1, course);
                ps.executeUpdate();
                ps.close();
            }

            // ✅ Add seat back if changed from Approved → Rejected
            if ("Rejected".equalsIgnoreCase(status) &&
                "Approved".equalsIgnoreCase(oldStatus) &&
                course != null && !course.isEmpty()) {

                ps = con.prepareStatement(
                        "UPDATE courses SET available_seats = available_seats + 1 " +
                        "WHERE course_name=?");

                ps.setString(1, course);
                ps.executeUpdate();
                ps.close();
            }

            // ===============================
            // 5. SEND EMAIL
            // ===============================
            if (email != null && !email.isEmpty()) {

                String subject = "Application Status Update";

                String message =
                        "Hello " + name + ",\n\n" +
                        "Your application status has been updated.\n\n" +
                        "New Status: " + status + "\n\n" +
                        "Course: " + course + "\n\n" +
                        "Thank you.\nAdmission Team";

                EmailSender.sendEmail(email, subject, message);
            }

            // ===============================
            // 6. REDIRECT
            // ===============================
            res.sendRedirect("admin/adminDashboard.jsp?msg=updated");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}