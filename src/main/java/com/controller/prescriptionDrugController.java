package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Drug;
import com.service.PrescriptionService;

/**
 * Servlet implementation class prescriptionDrugController
 */
@WebServlet("/prescriptionDrugController")
public class prescriptionDrugController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    String action = request.getParameter("action");
	    String prescriptionId = request.getParameter("prescriptionId");

	    @SuppressWarnings("unchecked")
		ArrayList<Drug> drugList = (ArrayList<Drug>) session.getAttribute("drugList");
	    if (drugList == null) {
	        drugList = new ArrayList<>();
	    }

	    if ("addDrug".equals(action)) {
	        // Create a new Drug object from form data
	        Drug drug = new Drug();
	        drug.setDrugName(request.getParameter("drugName"));
	        drug.setDosage(request.getParameter("dosage"));
	        drug.setFrequency(request.getParameter("frequency"));
	        drug.setDuration(request.getParameter("duration"));
	        drug.setInstruction(request.getParameter("instruction"));
	        drugList.add(drug);
	        session.setAttribute("drugList", drugList);
	        response.sendRedirect("createPrescription?prescriptionid=" + prescriptionId);
	    }

	    else if ("deleteDrug".equals(action)) {
	        int index = Integer.parseInt(request.getParameter("index"));
	        if (index >= 0 && index < drugList.size()) {
	            drugList.remove(index);
	        }
	        session.setAttribute("drugList", drugList);
	        response.sendRedirect("createPrescription?prescriptionid=" + prescriptionId);
	    }

	    else if ("saveAll".equals(action)) {
	        for (Drug drug : drugList) {	           
	        	PrescriptionService.insertDrug(drug, Integer.parseInt(prescriptionId));
	        }
	        session.removeAttribute("drugList");
	        response.sendRedirect("ViewPrescription"); // or a confirmation page
	    }
	}

}
