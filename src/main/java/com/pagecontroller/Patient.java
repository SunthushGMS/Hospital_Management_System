package com.pagecontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Doctor;
import com.service.AppointmentService;

@WebServlet("/Patient")
public class Patient extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = request.getParameter("error");
		if(error != null) {
			request.setAttribute("error", error);
		}
		ArrayList<Doctor> doctors = AppointmentService.getDoctorDetails();
		request.setAttribute("doctors", doctors);
		request.getRequestDispatcher("views/patient.jsp").forward(request, response);
	}
	
}
