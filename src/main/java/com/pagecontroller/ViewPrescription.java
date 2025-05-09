package com.pagecontroller;

import com.model.Drug;
import com.service.PrescriptionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ViewPrescription")
public class ViewPrescription extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Create an instance of the PrescriptionService to get prescription details
    private PrescriptionService prescriptionService = new PrescriptionService();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve patientId from the session or request parameters
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        
        // Get all drugs for the patient
        ArrayList<Drug> drugList = prescriptionService.getAllDrugs();

        // Get the dietary advice and doctor's note for the patient
        String dietaryAdvice = prescriptionService.getDietaryAdvice(patientId);
        String doctorNote = prescriptionService.getDoctorNote(patientId);
        
        // Check for any error messages passed in the request
        String error = request.getParameter("error");
        if (error != null) {
            request.setAttribute("error", error);
        }

        // Set the retrieved prescription details as request attributes
        request.setAttribute("drugList", drugList);
        request.setAttribute("dietaryAdvice", dietaryAdvice);
        request.setAttribute("doctorNote", doctorNote);
        request.setAttribute("patientId", patientId);
        
        // Forward the request to the viewPrescription.jsp page
        request.getRequestDispatcher("views/viewPrescription.jsp").forward(request, response);
    }
}
