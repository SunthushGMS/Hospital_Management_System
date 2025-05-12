package com.controller;

import java.io.IOException;
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
	            	System.out.println("Prescription deleted successfully.");
	                response.sendRedirect("ViewPrescription");
	                return;
	            } else {
	                request.setAttribute("error", "Failed to delete prescription.");
	                request.getRequestDispatcher("/ViewPrescription").forward(request, response);
	                return;
	            }
	        } else {
	            request.setAttribute("error", "Prescription ID is missing.");
	            request.getRequestDispatcher("/ViewPrescription").forward(request, response);
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

	    } else {
	        request.setAttribute("error", "Invalid action.");
	        request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
	    }
	}
}