package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.SupportRequests;
import com.service.SupportService;


@WebServlet("/contactUsController")
public class contactUsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("contact");
		String message = request.getParameter("message");
		
		SupportRequests supportRequest = new SupportRequests(0,name,email,phone,message,"","pending");
		
		boolean isInserted = SupportService.insertSupportRequest(supportRequest);
		
		if(isInserted) {
			response.sendRedirect("ContactUs?success=Message sent successfully!");
		} else {
			
			String error = "Something went wrong. Please try Again.";
			response.sendRedirect("ContactUs?error=" + URLEncoder.encode(error, "UTF-8"));
		}
	}

}
	
	

