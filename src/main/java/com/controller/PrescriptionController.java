package com.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Prescription;
import com.service.PrescriptionService;



@WebServlet("/PrescriptionController")
public class PrescriptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String dietaryAdvices = request.getParameter("dietary-advices");
			String doctorsNotes = request.getParameter("doctors-notes");
			
			int doctorId = 1;
			int patientId = 1;
			
			Date dateIssued = new Date(System.currentTimeMillis());
				
			Prescription prescription = new Prescription(0,dateIssued,  dietaryAdvices, doctorsNotes, doctorId, patientId);

			boolean isInserted = PrescriptionService.insertPrescription(prescription);
				
			if(isInserted) {
				String message = "Prescription sent successfully";
				response.sendRedirect("createPrescription?success=" + URLEncoder.encode(message, "UTF-8"));
			} else {
					
				String message = "Failed to create Prescription. Please try Again.";
				response.sendRedirect("createPrescription?error=" + URLEncoder.encode(message, "UTF-8"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			String message = "Error occurred while adding prescription";
			response.sendRedirect("createPrescription?error=" + URLEncoder.encode(message, "UTF-8"));
		}
		
	}

}
