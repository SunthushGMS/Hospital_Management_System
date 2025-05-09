package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.model.Drug;
import com.service.PrescriptionService;

@WebServlet("/PrescriptionController")
public class PrescriptionController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PrescriptionService prescriptionService;

    @Override
    public void init() throws ServletException {
        super.init();
        prescriptionService = new PrescriptionService();
    }

    // Show the form (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get patientId from session or request
        HttpSession session = request.getSession();
        String patientIdParam = request.getParameter("patientId");
        Integer patientId = null;

        try {
            if (patientIdParam != null && !patientIdParam.isEmpty()) {
                patientId = Integer.parseInt(patientIdParam);
                session.setAttribute("patientId", patientId); // store in session for future use
            } else {
                patientId = (Integer) session.getAttribute("patientId");
            }

            if (patientId == null) {
                request.setAttribute("errorMessage", "Missing patient ID.");
                request.getRequestDispatcher("/views/errorPage.jsp").forward(request, response);
                return;
            }

            // Set drug list in session
            ArrayList<Drug> drugs = prescriptionService.getAllDrugs();
            session.setAttribute("drugList", drugs);

            // Set patientId as request attribute (needed by JSP)
            request.setAttribute("patientId", patientId);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/createPrescription.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid patient ID format.");
            request.getRequestDispatcher("/views/errorPage.jsp").forward(request, response);
        }
    }

    // Add drug to prescription (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String drugName = request.getParameter("drug-name");
        String dosage = request.getParameter("dosage");
        String frequency = request.getParameter("frequancy");
        String duration = request.getParameter("duration");
        String instruction = request.getParameter("instruction");

        // Get patientId from session
        HttpSession session = request.getSession();
        Integer patientId = (Integer) session.getAttribute("patientId");

        if (patientId == null) {
            request.setAttribute("errorMessage", "Missing patient ID.");
            request.getRequestDispatcher("/views/errorPage.jsp").forward(request, response);
            return;
        }

        // Create new drug
        int newId = prescriptionService.getAllDrugs().size() + 1;
        Drug newDrug = new Drug(newId, drugName, dosage, frequency, duration, instruction);

        // Add drug
        prescriptionService.addDrug(newDrug);

        // Update session with new list
        ArrayList<Drug> updatedDrugs = prescriptionService.getAllDrugs();
        session.setAttribute("drugList", updatedDrugs);

        // Redirect back to controller GET with patientId to render JSP
        response.sendRedirect("PrescriptionController?patientId=" + patientId);
    }
}
