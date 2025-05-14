//By Moditha
package com.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;
import com.service.UserService;

@WebServlet("/Signinform")
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user;
		try {
			user = UserService.getUserByUsername(username);
		} catch (Exception e) {
			user = null;
			e.printStackTrace();
			String message = "Error when signing in. try Again.";
			response.sendRedirect("Signin?error=" + URLEncoder.encode(message, "UTF-8"));
			return;
		}
		
		if(user != null) {
			if(user.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("uid", user.getUid());
				session.setAttribute("username", user.getUsername());
				session.setAttribute("fullname", user.getFullname());
				session.setAttribute("profilepic", user.getProfilepic());
				session.setAttribute("role", user.getRole());
				session.setAttribute("pwd", user.getPassword());
				
				//filter by user type and redirect to appropriate page
				if(user.getRole().equals("patient")) {
					response.sendRedirect("/Hospital_Management_System/");
				} else if(user.getRole().equals("doctor")) {
					response.sendRedirect("doctorDashboard");
				}
				else if(user.getRole().equals("admin")) {
					response.sendRedirect("AdminDB");
				}
				
			} else {
				System.out.println("Error: Wrong password");
				String message = "Wrong password. try Again.";
				response.sendRedirect("Signin?error=" + URLEncoder.encode(message, "UTF-8"));
			}
		} else {
			System.out.println("Error: User not found");
			String message = "User not found. try Again.";
			response.sendRedirect("Signin?error=" + URLEncoder.encode(message, "UTF-8"));
		}
		
	}

}
