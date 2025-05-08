package com.controller;

import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.service.AppointmentService;

@WebServlet("/AppointmentUpdateController")
public class AppointmentUpdateController extends HttpServlet {

 
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String doctorId = request.getParameter("doctorId");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        // Basic validation
        if (idStr == null || doctorId == null || date == null || time == null ||
            idStr.isEmpty() || doctorId.isEmpty() || date.isEmpty() || time.isEmpty()) {

            String error = URLEncoder.encode("Missing required fields", "UTF-8");
            response.sendRedirect("AppointmentHistory?error=" + error);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);

          
            AppointmentService.updateAppointment(id, doctorId, date, time);

         
            String success = URLEncoder.encode("Appointment updated successfully", "UTF-8");
            response.sendRedirect("AppointmentHistory?success=" + success);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            String error = URLEncoder.encode("Invalid appointment ID", "UTF-8");
            response.sendRedirect("AppointmentHistory?error=" + error);
        } catch (Exception e) {
            e.printStackTrace();
            String error = URLEncoder.encode("Something went wrong", "UTF-8");
            response.sendRedirect("AppointmentHistory?error=" + error);
        }
    }
}
