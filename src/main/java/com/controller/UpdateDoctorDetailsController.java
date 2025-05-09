package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Doctor;
import com.service.AdminService;


@WebServlet("/UpdateDoctorDetailsController")
public class UpdateDoctorDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String phoneno = request.getParameter("phoneno");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String specialization = request.getParameter("specialization");
		
		Doctor doctor = new Doctor(uid, username, password, fullname, dob, email, phoneno, address, specialization);
		
		if(AdminService.updateDoctorDetailsById(doctor)) {
			response.sendRedirect("AdminDB?success=Profile updated successfully.");
		}
		else {
			response.sendRedirect("AdminDB?error=An error occurred while updating the profile. Please try again later.");
		}
		
	}

}
