package com.pagecontroller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.AppointmentDetails;
import com.model.SurgeryDetails;
import com.model.EmergencyPatientDetails;
import com.service.doctorDashboardService;


@WebServlet("/doctorDashboard")
public class doctorDashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doctorDashboardService service = new doctorDashboardService();

        try {
        	
        	 // Get doctor ID from session (recommended)
        	HttpSession session = request.getSession(false);
			int currentUserid =(int) session.getAttribute("uid");
          
            // Get today's top appointments
            List<AppointmentDetails> todayAppointments = service.getTodayTopAppointments();
            request.setAttribute("todayAppointments", todayAppointments);

            // Get new pending appointments
            List<AppointmentDetails> newAppointments = service.getNewPendingAppointments();
            request.setAttribute("newAppointments", newAppointments);

            // Get weekly scheduled surgeries for doctor
            List<SurgeryDetails> weeklySurgeries = service.getWeeklyScheduledSurgeriesForDoctor(currentUserid);
            request.setAttribute("weeklySurgeries", weeklySurgeries);
            
         // Get all patient assigned emergency status
            List<EmergencyPatientDetails> emergencyPatients = service.getAllEmergencyPatientDetails();
            request.setAttribute("emergencyPatients", emergencyPatients);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching appointments or surgeries.");
        }

        // Forward to JSP once
        request.getRequestDispatcher("views/doctorDashboard.jsp").forward(request, response);
    }
}




