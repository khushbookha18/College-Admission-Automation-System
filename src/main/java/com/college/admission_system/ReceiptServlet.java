package com.college.admission_system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/ReceiptServlet")
public class ReceiptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appId = request.getParameter("appId");

        String name = "";
        String course = "";
        String paymentStatus = "Paid";

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT s.name, a.course, s.payment_status " +
                "FROM students s " +
                "LEFT JOIN admission_form a ON s.applicant_id = a.app_id " +
                "WHERE s.applicant_id=?"
            );

            ps.setString(1, appId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                course = rs.getString("course");
                paymentStatus = rs.getString("payment_status");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ PDF response
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Receipt_" + appId + ".pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();

            // 🎨 Title
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
            Paragraph title = new Paragraph("College Admission Receipt", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            document.add(new Paragraph("\n"));

            // 📄 Details
            document.add(new Paragraph("Application ID: " + appId));
            document.add(new Paragraph("Student Name: " + name));
            document.add(new Paragraph("Course: " + course));
            document.add(new Paragraph("Amount Paid: ₹50,000"));
            document.add(new Paragraph("Payment Status: " + paymentStatus));
            document.add(new Paragraph("Date: " + new java.util.Date()));

            document.add(new Paragraph("\n\n"));

            // ✅ Footer
            Paragraph footer = new Paragraph("Thank you for your payment!");
            footer.setAlignment(Element.ALIGN_CENTER);
            document.add(footer);

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}