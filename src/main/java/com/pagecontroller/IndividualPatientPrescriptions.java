package com.pagecontroller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.model.Prescription;
import com.model.Drug;
import com.service.PrescriptionService;
@WebServlet("/IndividualPatientPrescriptions")
public class IndividualPatientPrescriptions extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	 String patientIdStr = request.getParameter("patientId");

	    	try {
	            HttpSession session = request.getSession(false);
	            int currentUserid = (int) session.getAttribute("uid");
	            
	            patientIdStr = request.getParameter("patientId"); 
	            int patientId = Integer.parseInt(patientIdStr);
	            
	            // Step 1: Get all prescriptions for this doctor
	            List<Prescription> prescriptions = PrescriptionService.getPrescriptionsByDoctorAndPatient(currentUserid,patientId);
	            request.setAttribute("prescriptions", prescriptions);
	            
	            // Step 2: Get all drugs for this doctor's prescriptions
	            List<Drug> allDrugs = PrescriptionService.getAllDrugsByDoctorId(currentUserid);
	            // Step 3: Group drugs by prescription ID
	            Map<Integer, List<Drug>> drugMap = new HashMap<>();
	            for (Drug drug : allDrugs) {
	                int pid = drug.getPrescriptionId();
	                drugMap.computeIfAbsent(pid, k -> new ArrayList<>()).add(drug);
	            }

	            // Step 4: Pass map to JSP
	            request.setAttribute("drugMap", drugMap);

	            // Optional messages
	            String success = request.getParameter("success");
	            String error = request.getParameter("error");
	            if (success != null) request.setAttribute("success", success);
	            if (error != null) request.setAttribute("error", error);

	        } catch (Exception e) {
	            e.printStackTrace();
	            
	        }

	        request.getRequestDispatcher("/views/individualPatientPrescriptions.jsp").forward(request, response);
	    }

	    	
	       
	}
