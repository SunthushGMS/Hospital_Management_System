package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.LabReport;
import com.service.LabReportService;

@WebServlet("/LabReportUpload")
@MultipartConfig
public class LabReportUpload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String department = request.getParameter("department");
            Part filePart = request.getPart("document");
            InputStream document = filePart.getInputStream();
            String summary = request.getParameter("summary");
            String description = request.getParameter("description");
            int patientId = Integer.parseInt(request.getParameter("patientId"));
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));

            LabReport report = new LabReport(0, name, department, document, summary, description, patientId, doctorId);

            boolean isInserted = LabReportService.uploadLabReport(report);

            if (isInserted) {
                response.sendRedirect("upload_labreport.jsp?success=" + URLEncoder.encode("Lab report uploaded successfully!", "UTF-8"));
            } else {
                response.sendRedirect("upload_labreport.jsp?error=" + URLEncoder.encode("Error uploading lab report. Please try again.", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("upload_labreport.jsp?error=" + URLEncoder.encode("Unexpected error occurred!", "UTF-8"));
        }
    }
}
