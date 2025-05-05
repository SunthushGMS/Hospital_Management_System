package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Doctor;
import com.service.AdminService;


@WebServlet("/AddDoctorForm")
public class AddDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullName");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phoneNumber");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String specialization = request.getParameter("specialization");
		String password = request.getParameter("password");
		
		Doctor doctor =  new Doctor(0, userName, password, fullname, dob, email, phonenumber, address, specialization, "doctor");
		
		boolean isInserted = AdminService.addDoctor(doctor);
		
		if(isInserted) {
			response.sendRedirect("AdminDB");
		}
		else {
			String message = "Something went worng, Try again";
			response.sendRedirect("AdminDB?error = " + URLEncoder.encode(message, "UTF-8"));
		}
		
	}

}
