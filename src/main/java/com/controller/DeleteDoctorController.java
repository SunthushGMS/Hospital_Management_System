package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.service.UserService;

@WebServlet("/DeleteDoctorController")
public class DeleteDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int docId = Integer.parseInt(request.getParameter("id"));
		
		if(UserService.deleteUser(docId)) {
			response.sendRedirect("AdminDB");
		} else {
			response.sendRedirect("AdminDB?error=Delete Failed");
		}
	}

}
