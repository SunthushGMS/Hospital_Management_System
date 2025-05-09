package com.pagecontroller;

import com.model.Drug;
import com.model.Prescription;
import com.service.PrescriptionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ViewPrescription")
public class ViewPrescription extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PrescriptionService prescriptionService = new PrescriptionService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve patientId from the request
            int patientId = Integer.parseInt(request.getParameter("patientId"));

            // Fetch the latest prescription for the patient
            Prescription prescription = prescriptionService.getPrescriptionByPatientId(patientId);

            if (prescription == null) {
                request.setAttribute("error", "No prescription found for this patient.");
                request.getRequestDispatcher("views/errorPage.jsp").forward(request, response);
                return;
            }

            // Fetch drugs related to the patient's prescription
            ArrayList<Drug> drugList = prescriptionService.getDrugsByPatientId(patientId);

            // Set attributes for the JSP
            request.setAttribute("drugList", drugList);
            request.setAttribute("dietaryAdvice", prescription.getDietary_advice());
            request.setAttribute("doctorNote", prescription.getDoctors_notes());
            request.setAttribute("patientId", patientId);

            // Forward to the JSP page to display the prescription details
            request.getRequestDispatcher("views/viewPrescription.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid patient ID.");
            request.getRequestDispatcher("views/errorPage.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching prescription.");
            request.getRequestDispatcher("views/errorPage.jsp").forward(request, response);
            e.printStackTrace();
        }
    }
}
