package com.controller;

import java.io.IOException;
import java.sql.Date;
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



@WebServlet("/updatePrescriptionController")
public class updatePrescriptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");
	    PrescriptionService prescriptionService = new PrescriptionService();

	    if ("delete".equals(action)) {
	        String idParam = request.getParameter("prescriptionId");
	        if (idParam != null && !idParam.isEmpty()) {
	            int prescriptionId = Integer.parseInt(idParam);
	            boolean deleted = prescriptionService.deletePrescriptionWithDrugs(prescriptionId);
	            if (deleted) {
	                request.setAttribute("message", "Prescription deleted successfully.");
	            } else {
	                request.setAttribute("error", "Failed to delete prescription.");
	                request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
	                return;
	            }
	        } else {
	            request.setAttribute("error", "Prescription ID is missing.");
	            request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
	            return;
	        }

	    } else if ("accept".equals(action)) {
	        String idParam = request.getParameter("prescriptionId");
	        if (idParam != null && !idParam.isEmpty()) {
	            int prescriptionId = Integer.parseInt(idParam);
	            boolean success = prescriptionService.deletePrescriptionWithDrugs(prescriptionId);
	            if (success) {
	                request.setAttribute("message", "Appointment accepted successfully.");
	            } else {
	                request.setAttribute("error", "Failed to delete the prescription.");
	                request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
	                return;
	            }
	        } else {
	            request.setAttribute("error", "Prescription ID is missing.");
	            request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
	            return;
	        }

	    } else if ("update".equals(action)) {
	        String idParam = request.getParameter("prescriptionId");
	        if (idParam != null && !idParam.isEmpty()) {
	            try {
	                int prescriptionId = Integer.parseInt(idParam);
	                Prescription prescription = PrescriptionService.getPrescriptionByPrescriptionId(prescriptionId);
	                
	                
	                
	                
	                
	                List<Drug> drugs = PrescriptionService.getDrugsByPrescriptionId(prescriptionId);

	                request.setAttribute("prescription", prescription);
	                request.setAttribute("drugs", drugs);

	                request.getRequestDispatcher("/views/updatePrescription.jsp").forward(request, response);
	                return;
	            } catch (Exception e) {
	                e.printStackTrace();
	                request.setAttribute("error", "Failed to load prescription for update.");
	                request.getRequestDispatcher("/views/updatePrescription.jsp").forward(request, response);
	                return;
	            }
	        } else {
	            response.sendRedirect("/views/updatePrescription.jsp?error=Missing+prescription+ID");
	            return;
	        }

	    } else if ("save".equals(action)) {
	        try {
	        	
	            int prescriptionId = Integer.parseInt(request.getParameter("prescription_id"));
	            String dateOfIssueStr = request.getParameter("date_of_issue");
	            String dietaryAdvice = request.getParameter("dietary_advice");
	            String doctorsNotes = request.getParameter("doctors_notes");

	            Date dateOfIssue = Date.valueOf(dateOfIssueStr);

	            Prescription prescription = new Prescription();
	            prescription.setId(prescriptionId);
	            prescription.setDate_of_issue(dateOfIssue);
	            prescription.setDietary_advice(dietaryAdvice);
	            prescription.setDoctors_notes(doctorsNotes);

	            String[] drugIds = request.getParameterValues("drugId");
	            String[] drugNames = request.getParameterValues("drugName");
	            String[] dosages = request.getParameterValues("dosage");
	            String[] frequencies = request.getParameterValues("frequency");
	            String[] durations = request.getParameterValues("duration");
	            String[] instructions = request.getParameterValues("instruction");

	            List<Drug> updatedDrugs = new ArrayList<>();
	            for (int i = 0; i < drugIds.length; i++) {
	                Drug drug = new Drug();
	                drug.setDrugId(Integer.parseInt(drugIds[i]));
	                drug.setDrugName(drugNames[i]);
	                drug.setDosage(dosages[i]);
	                drug.setFrequency(frequencies[i]);
	                drug.setDuration(durations[i]);
	                drug.setInstruction(instructions[i]);
	                drug.setPrescriptionId(prescriptionId);
	                updatedDrugs.add(drug);
	            }

	            
	            PrescriptionService.updateDrugs(updatedDrugs);
	            System.out.println("drug updated with ID: " + prescriptionId);
	            PrescriptionService.updatePrescription(prescription);
	            System.out.println("Prescription updated with ID: " + prescriptionId);

	            response.sendRedirect("ViewPrescription?success=Prescription+updated+successfully");
	            return;

	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Failed to save prescription update.");
	            request.getRequestDispatcher("/views/updatePrescription.jsp").forward(request, response);
	            return;
	        }

	    } else {
	        request.setAttribute("error", "Invalid action.");
	        request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
	    }
	}
}