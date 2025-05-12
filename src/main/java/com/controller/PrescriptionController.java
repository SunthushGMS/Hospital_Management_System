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

    private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session validation
        HttpSession session = request.getSession(false);
        Integer doctorId = (Integer) session.getAttribute("uid");
        
        // Retrieve patient ID and validate it
        String patientIdParam = request.getParameter("patientId");
        if (patientIdParam == null || patientIdParam.isEmpty()) {
            request.setAttribute("errorMessage", "Missing patient ID.");
            request.getRequestDispatcher("createPrescription").forward(request, response);
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdParam);
            
            // Retrieve other prescription details
            String dietaryAdvice = request.getParameter("dietaryAdvice");
            String doctorsNote = request.getParameter("doctorsNote");

            // Create the Prescription object
            Date currentDate = new Date(System.currentTimeMillis());
            
            Prescription prescription = new Prescription(doctorId, patientId, currentDate, dietaryAdvice, doctorsNote,0);

            // Insert the prescription via the service
            int result = PrescriptionService.insertPrescription(prescription);

            // Redirect based on result
            if (result > 1) {
            	response.sendRedirect("createPrescription?prescriptionid=" + result +"&patientid=" +patientId);
            } else {
                response.sendRedirect("createPrescription?error=true");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid patient ID format.");
            request.getRequestDispatcher("createPrescription").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred.");
            request.getRequestDispatcher("createPrescription").forward(request, response);
        }
    }
}
