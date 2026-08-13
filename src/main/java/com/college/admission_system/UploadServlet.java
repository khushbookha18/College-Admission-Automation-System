package com.college.admission_system;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ================= FIXED APP ID LOGIC =================
            HttpSession session = request.getSession();
            String appId = (String) session.getAttribute("appId");

            // fallback safety (if session lost)
            if (appId == null || appId.isEmpty()) {
                appId = request.getParameter("appId");
            }

            if (appId == null || appId.isEmpty()) {
                response.getWriter().println("Application ID Missing!");
                return;
            }

            System.out.println("FINAL APP ID USED = " + appId);

            // ================= FORM DATA =================
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String course = request.getParameter("course");
            String address = request.getParameter("address");

            String dob = request.getParameter("dob");
            String tenthMarks = request.getParameter("tenthMarks");
            String twelfthMarks = request.getParameter("twelfthMarks");
            String university = request.getParameter("university");

            // ================= PATHS =================
            String cDrivePath = "C:/uploads";
            String projectPath = getServletContext().getRealPath("") + "uploads";

            File dir1 = new File(cDrivePath);
            File dir2 = new File(projectPath);

            if (!dir1.exists()) dir1.mkdirs();
            if (!dir2.exists()) dir2.mkdirs();

            // ================= PHOTO =================
            Part photoPart = request.getPart("photo");
            String photoName = System.currentTimeMillis() + "_" + photoPart.getSubmittedFileName();

            File photoFileC = new File(cDrivePath + File.separator + photoName);
            File photoFileP = new File(projectPath + File.separator + photoName);

            photoPart.write(photoFileC.getAbsolutePath());
            Files.copy(photoFileC.toPath(), photoFileP.toPath(), StandardCopyOption.REPLACE_EXISTING);

            // ================= DOCUMENTS =================
            StringBuilder documentNames = new StringBuilder();

            for (Part part : request.getParts()) {
                if ("documents".equals(part.getName())) {

                    String fileName = part.getSubmittedFileName();

                    if (fileName != null && !fileName.isEmpty()) {

                        String uniqueName = System.currentTimeMillis() + "_" + fileName;

                        File fileC = new File(cDrivePath + File.separator + uniqueName);
                        File fileP = new File(projectPath + File.separator + uniqueName);

                        part.write(fileC.getAbsolutePath());
                        Files.copy(fileC.toPath(), fileP.toPath(), StandardCopyOption.REPLACE_EXISTING);

                        documentNames.append(uniqueName).append(",");
                    }
                }
            }

            // ================= DATABASE =================
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO admission_form "
                    + "(app_id, first_name, last_name, email, phone, course, address, dob, tenth_marks, twelfth_marks, universities, photo, documents) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, appId);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, course);
            ps.setString(7, address);
            ps.setString(8, dob);
            ps.setString(9, tenthMarks);
            ps.setString(10, twelfthMarks);
            ps.setString(11, university);
            ps.setString(12, photoName);
            ps.setString(13, documentNames.toString());

            ps.executeUpdate();

            // ================= REDIRECT =================
            response.sendRedirect("admission/status.jsp?success=true&appId=" + appId);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}