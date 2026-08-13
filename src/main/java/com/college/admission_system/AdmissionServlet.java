package com.college.admission_system;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdmissionServlet")
@MultipartConfig
public class AdmissionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appId = request.getParameter("appId");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String course = request.getParameter("course");
        String address = request.getParameter("address");
        String declaration = request.getParameter("declaration");

        Part photoPart = request.getPart("photo");
        Part docPart = request.getPart("documents");

        String uploadPath = getServletContext().getRealPath("") + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save photo
        String photoFileName = photoPart.getSubmittedFileName();
        photoPart.write(uploadPath + File.separator + photoFileName);

        // Save document
        String docFileName = docPart.getSubmittedFileName();
        docPart.write(uploadPath + File.separator + docFileName);

        try {
            Connection conn = DBConnection.getConnection();

            // ✅ ADDED status column
            String sql = "INSERT INTO applications VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, appId);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, course);
            ps.setString(7, address);
            ps.setString(8, photoFileName);
            ps.setString(9, docFileName);
            ps.setString(10, declaration);
            ps.setString(11, "PENDING"); // ✅ NEW

            ps.executeUpdate();

            // ✅ STORE IN SESSION (VERY IMPORTANT)
            HttpSession session = request.getSession();
            session.setAttribute("appId", appId);
            session.setAttribute("applicantName", firstName + " " + lastName);

            // ✅ REDIRECT TO PROCESS PAGE
            response.sendRedirect("admission/process.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}