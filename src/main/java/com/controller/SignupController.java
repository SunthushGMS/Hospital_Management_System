//By Moditha
package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Patient;
import com.service.UserService;

@WebServlet("/SignupForm")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("name");
		String username = request.getParameter("uname");
		String email = request.getParameter("email");
		String phone = request.getParameter("number");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
		Patient patient = new Patient(0, username, password, fullname, "", dob, email, phone, address, "", "testimg.jpeg", "patient");
		
		boolean isInserted = UserService.insertPatient(patient);
		
		if(isInserted) {
			response.sendRedirect("Signin");
		} else {
			
			String message = "when signing up. try Again.";
			response.sendRedirect("SignUp?error=" + URLEncoder.encode(message, "UTF-8"));
		}
	}

}
