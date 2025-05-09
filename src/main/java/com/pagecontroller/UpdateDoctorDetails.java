package com.pagecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Doctor;
import com.service.AdminService;


@WebServlet("/UpdateDoctorDetails")
public class UpdateDoctorDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int doctorId = Integer.parseInt(request.getParameter("uid"));
		
		Doctor doctor = AdminService.getDoctorDetailsById(doctorId);
		request.setAttribute("doctor", doctor);

        String error = request.getParameter("error");
		if(error != null) {
			request.setAttribute("error", error);
		}
		request.getRequestDispatcher("views/editDoctorDetails.jsp").forward(request, response);
	}

}
