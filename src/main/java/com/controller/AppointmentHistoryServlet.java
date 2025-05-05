package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.AppointmentHistory;
import com.service.AppointmentHistoryService;

@WebServlet("/AppointmentHistoryServlet")
public class AppointmentHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String patientId = request.getParameter("patientID");

            if (patientId == null || patientId.trim().isEmpty()) {
                response.sendRedirect("patient.jsp?error=Missing+patient+ID");
                return;
            }

            List<AppointmentHistory> appointments = AppointmentHistoryService.getAppointmentsByPatientId(patientId);

            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("appointment_history.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("patient.jsp?error=Unexpected+error+occurred");
        }
    }
}
