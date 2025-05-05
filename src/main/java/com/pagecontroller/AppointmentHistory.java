package com.pagecontroller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.AppointmentHistoryService;
import com.model.Appointment;

@WebServlet("/AppointmentHistory")
public class AppointmentHistory extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession(false);
			int currentUserid =(int) session.getAttribute("uid");
			ArrayList<Appointment> appointments = AppointmentHistoryService.getAppointmentsByPatientId(currentUserid);
			request.setAttribute("appointments", appointments);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			String error = request.getParameter("error");
			if(error != null) {
				request.setAttribute("error", error);
			}
			request.getRequestDispatcher("views/appointHistory.jsp").forward(request, response);
		}
    
	}
	
}
