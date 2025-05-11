package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Drug;
import com.model.Prescription;
import com.service.PrescriptionService;

@WebServlet("/UpdatePrescription")
public class UpdatePrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
     


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			System.out.println("Received POST request to update prescription.");
	            int prescriptionId = Integer.parseInt(request.getParameter("prescriptionId"));
	            String dietaryAdvice = request.getParameter("dietary_advice");
	            String doctorsNotes = request.getParameter("doctors_notes");

	            System.out.println("Prescription ID: " + prescriptionId);
	            System.out.println("Dietary Advice: " + dietaryAdvice);
	            System.out.println("Doctor's Notes: " + doctorsNotes);

	            Prescription prescription = new Prescription();
	            prescription.setId(prescriptionId);
	            prescription.setDietary_advice(dietaryAdvice);
	            prescription.setDoctors_notes(doctorsNotes);

	            String[] drugIds = request.getParameterValues("drugId");
	            String[] drugNames = request.getParameterValues("drugName");
	            String[] dosages = request.getParameterValues("dosage");
	            String[] frequencies = request.getParameterValues("frequency");
	            String[] durations = request.getParameterValues("duration");
	            String[] instructions = request.getParameterValues("instruction");

	            

	            if (drugIds == null || drugNames == null || dosages == null) {
	                System.out.println("Drug parameters are missing from the request.");
	            } else {
	                System.out.println("Received " + drugIds.length + " drug(s) to update.");
	            }
	            
	            
	            List<Drug> updatedDrugs = new ArrayList<>();
	            for (int i = 0; i < drugIds.length; i++) {
	            	System.out.println("Preparing drug " + (i + 1));
	                Drug drug = new Drug();
	                drug.setDrugId(Integer.parseInt(drugIds[i]));
	                drug.setDrugName(drugNames[i]);
	                drug.setDosage(dosages[i]);
	                drug.setFrequency(frequencies[i]);
	                drug.setDuration(durations[i]);
	                drug.setInstruction(instructions[i]);
	                drug.setPrescriptionId(prescriptionId);
	                updatedDrugs.add(drug);
	                System.out.println("Added drug " + (i + 1) + ": " + drug.getDrugName());
	            }
	            System.out.println("Total drugs prepared for update: " + updatedDrugs.size());

	            System.out.println("Calling updateDrugs...");


	            // Call the new updatePrescriptionAndDrugs method
	            PrescriptionService prescriptionService = new PrescriptionService();
	            prescriptionService.updatePrescriptionAndDrugs(prescriptionId, prescription, updatedDrugs);
	            System.out.println("Prescription and drugs updated with ID: " + prescriptionId);

	            response.sendRedirect("ViewPrescription?success=Prescription+updated+successfully");
	            return;

	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Failed to save prescription update.");
	            request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
	            return;
	        }
	}

}
