package com.controller;

import com.model.Appointment;
import com.service.AppointmentService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AppointmentBookingController")
public class AppointmentBookingController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int doctorId = Integer.parseInt(request.getParameter("doctorId"));
            int patientId = Integer.parseInt(request.getParameter("patientId")); // Assume this comes from a hidden input
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String status = "Pending"; // Default

            Appointment appointment = new Appointment(doctorId, patientId, date, time, status);

            String appointmentIdStr = request.getParameter("appointmentId");
            boolean result;

            if (appointmentIdStr != null && !appointmentIdStr.isEmpty()) {
                int appointmentId = Integer.parseInt(appointmentIdStr);
                appointment.setId(appointmentId);
                result = AppointmentService.updateAppointment(appointment);
            } else {
                result = AppointmentService.insertAppointment(appointment);
            }

            if (result) {
                response.sendRedirect("appointmentHistory.jsp?success=Appointment Saved");
            } else {
                response.sendRedirect("patient.jsp?error=Unable to save appointment");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("patient.jsp?error=Internal error occurred");
        }
    }
}
