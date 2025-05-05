//By Sharuka
package com.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.model.Appointment;
import com.service.AppointmentService;

@WebServlet("/AppointmentBookingController")
public class AppointmentBookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String doctorIdStr = request.getParameter("doctorId");
            String dateStr = request.getParameter("date");
            String time = request.getParameter("time");

            if (doctorIdStr == null || dateStr == null || time == null ||
                doctorIdStr.isEmpty() || dateStr.isEmpty() || time.isEmpty()) {
                response.sendRedirect("patient.jsp?error=" + URLEncoder.encode("All fields are required.", "UTF-8"));
                return;
            }

            int doctorId = Integer.parseInt(doctorIdStr);
            Date appointmentDate = Date.valueOf(dateStr);

            HttpSession session = request.getSession(false);
            int patientId = (int) session.getAttribute("uid"); // get session user id

            Appointment appointment = new Appointment(
                doctorId,
                patientId,
                appointmentDate,
                time,
                "Pending"
            );

            boolean isInserted = AppointmentService.insertAppointment(appointment);

            if (isInserted) {
                response.sendRedirect("AppointmentHistory?success=" + URLEncoder.encode("Appointment booked successfully!", "UTF-8"));
            } else {
                response.sendRedirect("Patient?error=" + URLEncoder.encode("Error when booking appointment.", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Patient?error=" + URLEncoder.encode("Unexpected error occurred.", "UTF-8"));
        }
    }
}
