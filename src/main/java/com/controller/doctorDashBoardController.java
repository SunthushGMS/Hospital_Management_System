package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.sql.SQLException;

import com.model.AppointmentDetails;
import com.service.doctorDashboardService;

@WebServlet("/doctorDashBoardController")
public class doctorDashBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doctorDashboardService service = new doctorDashboardService();

        try {
            List<AppointmentDetails> todayAppointments = service.getTodayTopAppointments();
            
            

            
            request.setAttribute("todayAppointments", todayAppointments);
            request.getRequestDispatcher("doctorDashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching today's appointments.");
            request.getRequestDispatcher("doctorDashboard.jsp").forward(request, response);
        }
    }
    
    

}
