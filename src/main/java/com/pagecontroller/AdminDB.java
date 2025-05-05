package com.pagecontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.AdminAppointment;
import com.model.Doctor;
import com.model.User;
import com.service.AdminService;

@WebServlet("/AdminDB")
public class AdminDB extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Doctor> doctor = AdminService.getDoctorDetails();
		ArrayList<User> patient = AdminService.getPatientDetails();
		ArrayList<AdminAppointment> appointment = AdminService.getAppointmentDetails();
		
		request.setAttribute("doctorDetails", doctor);
		request.setAttribute("patientDetails", patient);
		request.setAttribute("appointments", appointment);
		
		String error = request.getParameter("error");
		if(error != null) {
			request.setAttribute("error", error);
		}
		request.getRequestDispatcher("views/AdminDB.jsp").forward(request, response);
	}

}
