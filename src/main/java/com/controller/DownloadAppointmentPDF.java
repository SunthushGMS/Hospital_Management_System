package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.model.Appointment;
import com.service.AppointmentHistoryService;

@WebServlet("/DownloadAppointmentPDF")
public class DownloadAppointmentPDF extends HttpServlet {

    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            int currentUserid = (int) session.getAttribute("uid");
            ArrayList<Appointment> appointments = AppointmentHistoryService.getAppointmentsByPatientId(currentUserid);

         
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=AppointmentHistory.pdf");

           
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            document.add(new Paragraph("Appointment History"));
            document.add(new Paragraph(" ")); 

            PdfPTable table = new PdfPTable(6); 
            table.addCell("ID");
            table.addCell("Doctor ID");
            table.addCell("Patient ID");
            table.addCell("Date");
            table.addCell("Time");
            table.addCell("Status");

            for (Appointment a : appointments) {
                table.addCell(String.valueOf(a.getId()));
                table.addCell(String.valueOf(a.getDoctorId()));
                table.addCell(String.valueOf(a.getPatientId()));
                table.addCell(a.getAppointmentDate());
                table.addCell(a.getTime());
                table.addCell(a.getStatus());
            }

            document.add(table);
            document.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "PDF generation failed");
        }
    }
}
