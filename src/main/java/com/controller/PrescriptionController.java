package com.controller;

import com.service.PrescriptionService;
import com.model.Prescription;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/PrescriptionController")
public class PrescriptionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session validation
        HttpSession session = request.getSession(false); 
        if (session == null || !"doctor".equals(session.getAttribute("role"))) {
            response.sendRedirect("views/login.jsp"); // Redirect to login if not a doctor
            return;
        }
        
        Integer doctorId = (Integer) session.getAttribute("uid");
        
        // Retrieve patient ID and validate it
        String patientIdParam = request.getParameter("patientId");
        if (patientIdParam == null || patientIdParam.isEmpty()) {
            request.setAttribute("errorMessage", "Missing patient ID.");
            request.getRequestDispatcher("views/createPrescription.jsp").forward(request, response);
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdParam);
            
            // Retrieve other prescription details
            String dietaryAdvice = request.getParameter("dietaryAdvice");
            String doctorsNote = request.getParameter("doctorsNote");

            // Check for null or empty fields
            if (dietaryAdvice == null || dietaryAdvice.isEmpty() || doctorsNote == null || doctorsNote.isEmpty()) {
                request.setAttribute("errorMessage", "Please fill all required fields.");
                request.getRequestDispatcher("views/createPrescription.jsp").forward(request, response);
                return;
            }

            // Create the Prescription object
            Date currentDate = new Date(System.currentTimeMillis());
            
            System.out.println("Doctor ID: " + doctorId);
            System.out.println("Patient ID: " + patientId);
            System.out.println("Dietary Advice: " + dietaryAdvice);
            System.out.println("Doctors Note: " + doctorsNote);

            
            Prescription prescription = new Prescription(doctorId, patientId, currentDate, dietaryAdvice, doctorsNote);

            
            // Insert the prescription via the service
            boolean result = PrescriptionService.insertPrescription(prescription);

            // Redirect based on result
            if (result) {
                response.sendRedirect("views/createPrescription.jsp?success=true");
            } else {
                response.sendRedirect("views/createPrescription.jsp?error=true");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid patient ID format.");
            request.getRequestDispatcher("views/createPrescription.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred.");
            request.getRequestDispatcher("views/createPrescription.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/createPrescription.jsp").forward(request, response);
    }
}
