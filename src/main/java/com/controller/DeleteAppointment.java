package com.controller;

import com.service.AppointmentService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteAppointment")
public class DeleteAppointment extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean result = AppointmentService.deleteAppointment(id);

            if (result) {
                response.sendRedirect("appointmentHistory.jsp?success=Appointment deleted");
            } else {
                response.sendRedirect("appointmentHistory.jsp?error=Delete failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("appointmentHistory.jsp?error=Error occurred");
        }
    }
}
