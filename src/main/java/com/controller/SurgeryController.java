package com.controller;

import com.model.Surgery;
import com.service.PatientProfile_DoctorViewServices;
import com.service.SurgeryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/SurgeryController")
public class SurgeryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
        	int patientId = Integer.parseInt(request.getParameter("patientId"));
            String name = request.getParameter("name");
            String dateStr = request.getParameter("date");
            String timeStr = request.getParameter("time");
            HttpSession session = request.getSession(false);
    		int doctorId =(int) session.getAttribute("uid");
    
    		
    		java.sql.Date date = java.sql.Date.valueOf(dateStr);
            java.sql.Time time = java.sql.Time.valueOf(timeStr);

            Surgery surgery = new Surgery();
            surgery.setPatientId(patientId);
            surgery.setName(name);
            surgery.setDate(date);
            surgery.setTime(time);
            surgery.setCompletionStatus("scheduled");
            surgery.setAcceptanceStatus("pending");
            
            boolean isSuccess = SurgeryService.InsertSurgery(surgery, doctorId);

            if (isSuccess) {
            	System.out.println("Surgery scheduled successfully.");
                response.sendRedirect("Surgeries?success=" + URLEncoder.encode("Surgery scheduled successfully.", "UTF-8"));
            } else {
                response.sendRedirect("Surgeries?error=" + URLEncoder.encode("Failed to schedule surgery.", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Surgeries?error=" + URLEncoder.encode("An error occurred while processing your request.", "UTF-8"));
        }
    }}
