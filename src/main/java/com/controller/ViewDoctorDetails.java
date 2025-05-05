package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Doctor;
import com.service.AdminService;


@WebServlet("/ViewDoctorDetails")
public class ViewDoctorDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPostt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ArrayList<Doctor> doctor = AdminService.getDoctorDetails();
			request.setAttribute("AdminService", doctor);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("views/AdminDB.jsp");
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
