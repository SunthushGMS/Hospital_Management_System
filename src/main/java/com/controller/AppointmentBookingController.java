package com.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Appointment;
import com.service.AppointmentService;

@WebServlet("/AppointmentBookingController")
public class AppointmentBookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form parameters
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            int age = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            String doctorName = request.getParameter("doctorName");
            String dateStr = request.getParameter("date");
            String reason = request.getParameter("reason");

            // Convert date string to java.sql.Date
            Date appointmentDate = Date.valueOf(dateStr); // Expected format: yyyy-MM-dd

            // Create Appointment object
            Appointment appointment = new Appointment(
                0, name, email, contact, age, gender, doctorName, appointmentDate, reason
            );

            // Insert appointment into the database
            boolean isInserted = AppointmentService.insertAppointment(appointment);

            if (isInserted) {
                // Redirect to patient.jsp with success message
                response.sendRedirect("patient.jsp?success=" + URLEncoder.encode("Appointment booked successfully!", "UTF-8"));
            } else {
                // If insertion failed, redirect with error message
                String message = "Error when booking appointment. Please try again.";
                response.sendRedirect("patient.jsp?error=" + URLEncoder.encode(message, "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            // If any exception occurs, redirect with error message
            String message = "Error when booking appointment. Please try again.";
            response.sendRedirect("patient.jsp?error=" + URLEncoder.encode(message, "UTF-8"));
        }
    }
}
