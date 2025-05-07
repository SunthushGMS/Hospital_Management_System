//By Moditha
package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Admin;
import com.model.Doctor;
import com.model.Patient;
import com.service.UserService;


@WebServlet("/UpdateUserController")
public class UpdateUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String userRole =(String) session.getAttribute("role"); // get session user role
		int currentUserid =(int) session.getAttribute("uid"); // get session user id
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String dob = request.getParameter("dob");
		String language = request.getParameter("language");
		String address = request.getParameter("address");
		String bio = request.getParameter("bio");
		
		if("doctor".equals(userRole)) {
			String specialization = request.getParameter("specialization");
			String licenseNo = request.getParameter("licenseNumber");
			String yearOfExperience = request.getParameter("yearsOfExperience");
			String publicBio = request.getParameter("publicbio");
			
			Doctor doc = new Doctor(currentUserid, null, null, null, bio, dob, email, phone, address, language, null, null, specialization, licenseNo, yearOfExperience, publicBio);
			if (UserService.updateDoctor(doc)) {
				response.sendRedirect("userprofile?success=Profile updated successfully.");
			}
			else {
				response.sendRedirect("userprofile?error=An error occurred while updating the profile. Please try again later.");
			}
		}
		else if ("patient".equals(userRole)) {
			String bloodGroup = request.getParameter("bloodType");
			String gender = request.getParameter("gender");
			String allergies = request.getParameter("allergies");
			String medicalHistory = request.getParameter("medicalHistory");
			String geneticPredispositions = request.getParameter("geneticPredispositions");
			String specialNotes = request.getParameter("specialNotes");
			
			Patient patient = new Patient(currentUserid, null, null, null, bio, dob, email, phone, address, language, null, null, bloodGroup, gender, allergies, medicalHistory, geneticPredispositions, specialNotes);
			if (UserService.updatePatient(patient)) {
				response.sendRedirect("userprofile?success=Profile updated successfully.");
			}
			else {
				response.sendRedirect("userprofile?error=An error occurred while updating the profile. Please try again later.");
			}
		}
		else if ("admin".equals(userRole)) {
			String role = request.getParameter("role");
			String accessLevel = request.getParameter("accessLevel");
			String publicBio = request.getParameter("publicbio");
			
			Admin admin = new Admin(currentUserid, null, null, null, bio, dob, email, phone, address, language, null, null, role, publicBio, null ,accessLevel);
			if (UserService.updateAdmin(admin)) {
				response.sendRedirect("userprofile?success=Profile updated successfully.");
			}
			else {
				response.sendRedirect("userprofile?error=An error occurred while updating the profile. Please try again later.");
			}
		}	
	}
}
