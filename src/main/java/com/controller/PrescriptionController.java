package com.controller;

import com.model.Drug;
import com.model.DrugPrescription;
import com.model.Prescription;
import com.service.PrescriptionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet("/PrescriptionController")
public class PrescriptionController extends HttpServlet {

    private PrescriptionService prescriptionService = new PrescriptionService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addDrug".equals(action)) {
            addDrug(request, response);
        } else if ("createPrescription".equals(action)) {
            createPrescription(request, response);
        }
    }

    private void addDrug(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        ArrayList<Drug> drugList = (ArrayList<Drug>) session.getAttribute("drugList");
        if (drugList == null) drugList = new ArrayList<>();

        int drugId = drugList.size() + 1;
        Drug drug = new Drug(
                drugId,
                request.getParameter("drug-name"),
                request.getParameter("dosage"),
                request.getParameter("frequancy"),
                request.getParameter("duration"),
                request.getParameter("instruction")
        );

        drugList.add(drug);
        session.setAttribute("drugList", drugList);

        int patientId = Integer.parseInt(request.getParameter("patientId"));
        request.setAttribute("patientId", patientId);
        response.sendRedirect("views/createPrescriptions.jsp?patientId=" + patientId);
    }

    private void createPrescription(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        int doctorId = 1; // Assume logged-in doctor, you can modify this.
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        String dietaryAdvice = request.getParameter("dietary-advices");
        String doctorsNotes = request.getParameter("doctors-notes");
        Date dateIssued = new Date(System.currentTimeMillis());

        ArrayList<Drug> drugList = (ArrayList<Drug>) session.getAttribute("drugList");
        if (drugList == null) drugList = new ArrayList<>();

        // Create Prescription and get ID
        int prescriptionId = prescriptionService.createPrescription(
                new Prescription(0, dateIssued, dietaryAdvice, doctorsNotes, doctorId, patientId)
        );

        // Link drugs to prescription
        for (Drug drug : drugList) {
            prescriptionService.addDrugToPrescription(prescriptionId, drug);
        }

        // Clear session drug list
        session.removeAttribute("drugList");

        response.sendRedirect("views/viewPrescriptions.jsp");
    }
}
