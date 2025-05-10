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
import com.service.doctorDashboardService;


@WebServlet("/Appointments")
public class Appointments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DoctorDashboardServlet - doGet() called");

		 doctorDashboardService service = new doctorDashboardService();
		
		 
		 try {
	        	
        	 // Get doctor ID from session (recommended)
        	HttpSession session = request.getSession(false);
			int currentUserid =(int) session.getAttribute("uid");
          
            // Get today's top appointments
            List<AppointmentDetails> todayAppointments = service.getTodayAppointments(currentUserid);
            request.setAttribute("todayAppointments", todayAppointments);

            // Get new pending appointments
            List<AppointmentDetails> newAppointments = service.getPendingAppointments(currentUserid);
            request.setAttribute("newAppointments", newAppointments);
            
            // Get new completed appointments
            List<AppointmentDetails> incompletedAppointments = service.getIncompletedAppointments(currentUserid);
            request.setAttribute("incompletedAppointments", incompletedAppointments);
            
            // Get new completed appointments
            List<AppointmentDetails> completedAppointments = service.getCompletedAppointments(currentUserid);
            request.setAttribute("completedAppointments", completedAppointments);
            
            System.out.println("Today's appointments: " + todayAppointments.size());
            System.out.println("Incompleted appointments: " + incompletedAppointments.size());
            System.out.println("Completed appointments: " + completedAppointments.size());


            

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching appointments or surgeries.");
        }
		 
		request.getRequestDispatcher("views/appointments.jsp").forward(request, response);
		
		
	}
	
	
	
	
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        doctorDashboardService service = new doctorDashboardService();
        
     // Get doctor ID from session (recommended)
    	HttpSession session = request.getSession(false);
		int currentUserid =(int) session.getAttribute("uid");

        if ("accept".equals(action)) {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
            boolean success = service.updateAppointmentStatusToAccepted(appointmentId);
            System.out.println("Appointment ID: " + request.getParameter("appointmentId"));


            if (success) {
                request.setAttribute("message", "Appointment accepted successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to accept appointment.");
            }
        }
        
        if ("reschedule".equals(action)) {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
            boolean success = service.updateAppointmentStatusToReschedule(appointmentId);
            System.out.println("Appointment ID: " + request.getParameter("appointmentId"));


            if (success) {
                request.setAttribute("message", "Appointment accepted successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to accept appointment.");
            }
        }

        if ("completed".equals(action)) {
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
            boolean success = service.updateAppointmentStatusToCompleted(appointmentId);
            System.out.println("Appointment ID: " + request.getParameter("appointmentId"));


            if (success) {
                request.setAttribute("message", "Appointment accepted successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to accept appointment.");
            }
        }


        // Reload data after update
        try {
            List<AppointmentDetails> todayAppointments = service.getTodayAppointments(currentUserid);
            request.setAttribute("todayAppointments", todayAppointments);
            
         // Get new pending appointments
            List<AppointmentDetails> newAppointments = service.getPendingAppointments(currentUserid);
            request.setAttribute("newAppointments", newAppointments);
            
            // Get new completed appointments
            List<AppointmentDetails> incompletedAppointments = service.getIncompletedAppointments(currentUserid);
            request.setAttribute("incompletedAppointments", incompletedAppointments);
            
            // Get new completed appointments
            List<AppointmentDetails> completedAppointments = service.getCompletedAppointments(currentUserid);
            request.setAttribute("completedAppointments", completedAppointments);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading appointments.");
        }

        request.getRequestDispatcher("views/appointments.jsp").forward(request, response);
    }


}
