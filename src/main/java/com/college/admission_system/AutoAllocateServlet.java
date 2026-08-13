package com.college.admission_system;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AutoAllocateServlet")
public class AutoAllocateServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {

            Connection con = DBConnection.getConnection();

            // ===============================
            // GET STUDENTS BY MERIT (HIGH → LOW)
            // ===============================
            String sql = "SELECT app_id, course, " +
                    "(CAST(tenth_marks AS DECIMAL(5,2)) + CAST(twelfth_marks AS DECIMAL(5,2))) AS total " +
                    "FROM admission_form ORDER BY total DESC";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

                String appId = rs.getString("app_id");
                String course = rs.getString("course");
                double total = rs.getDouble("total");

                // ===============================
                // GET COURSE DETAILS
                // ===============================
                PreparedStatement ps = con.prepareStatement(
                        "SELECT available_seats, cutoff_marks FROM courses WHERE course_name=?"
                );
                ps.setString(1, course);

                ResultSet crs = ps.executeQuery();

                if (crs.next()) {

                    int seats = crs.getInt("available_seats");
                    int cutoff = crs.getInt("cutoff_marks");

                    // ===============================
                    // CHECK CUTOFF
                    // ===============================
                    if (total < cutoff) {

                        PreparedStatement reject = con.prepareStatement(
                                "UPDATE students SET status='Rejected' WHERE applicant_id=?"
                        );
                        reject.setString(1, appId);
                        reject.executeUpdate();

                        continue;
                    }

                    // ===============================
                    // ALLOCATE SEAT
                    // ===============================
                    if (seats > 0) {

                        // Approve
                        PreparedStatement approve = con.prepareStatement(
                                "UPDATE students SET status='Approved' WHERE applicant_id=?"
                        );
                        approve.setString(1, appId);
                        approve.executeUpdate();

                        // Reduce seat
                        PreparedStatement seatUpdate = con.prepareStatement(
                                "UPDATE courses SET available_seats = available_seats - 1 WHERE course_name=?"
                        );
                        seatUpdate.setString(1, course);
                        seatUpdate.executeUpdate();

                    } else {

                        // No seat → Reject
                        PreparedStatement reject = con.prepareStatement(
                                "UPDATE students SET status='Rejected' WHERE applicant_id=?"
                        );
                        reject.setString(1, appId);
                        reject.executeUpdate();
                    }
                }
            }

            // ===============================
            // REDIRECT BACK
            // ===============================
            res.sendRedirect("admin/adminDashboard.jsp?msg=auto_done");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}