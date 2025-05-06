package com.controller;

import com.model.Surgery;
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
            String name = request.getParameter("name");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
            
            
            System.out.println("Surgery Name: " + name);
            System.out.println("Date: " + date);
            System.out.println("Time: " + time);
            System.out.println("Doctor ID: " + doctorId);
            

            Surgery surgery = new Surgery(name, date, time);

            boolean isSuccess = SurgeryService.addSurgery(surgery, doctorId);

            if (isSuccess) {
                response.sendRedirect("Surgeries?success=" + URLEncoder.encode("Surgery scheduled successfully.", "UTF-8"));
            } else {
                response.sendRedirect("Surgeries?error=" + URLEncoder.encode("Failed to schedule surgery.", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Surgeries?error=" + URLEncoder.encode("An error occurred while processing your request.", "UTF-8"));
        }
    }
}
