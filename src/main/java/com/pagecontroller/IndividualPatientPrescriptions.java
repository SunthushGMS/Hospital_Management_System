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
	    	 System.out.println("Current User ID from session: " );
	    	 String patientIdStr = request.getParameter("patientId");
	    	 System.out.println("=== DEBUG: Raw patientIdStr = [" + patientIdStr + "]");

	    	try {
	            HttpSession session = request.getSession(false);
	            int currentUserid = (int) session.getAttribute("uid");
	            System.out.println("Current User ID from session: " + currentUserid);
	            System.out.println("Parsed patientId as: " +  request.getParameter("patientId"));
	            
	            patientIdStr = request.getParameter("patientId"); 
	            System.out.println("Parsed patientId as: " + patientIdStr);
	            int patientId = Integer.parseInt(patientIdStr);
	            System.out.println("Parsed patientId as: " + patientId);
	            
	            // Step 1: Get all prescriptions for this doctor
	            List<Prescription> prescriptions = PrescriptionService.getPrescriptionsByDoctorAndPatient(currentUserid,patientId);
	            request.setAttribute("prescriptions", prescriptions);
	            System.out.println("Fetched " + prescriptions.size() + " prescriptions for doctorId: " + currentUserid + " and patientId: " + patientId);

	            // Step 2: Get all drugs for this doctor's prescriptions
	            List<Drug> allDrugs = PrescriptionService.getAllDrugsByDoctorId(currentUserid);
	            System.out.println("Fetched " + allDrugs.size() + " drugs for doctorId: " + currentUserid);
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
	            request.setAttribute("error", "An error occurred while loading prescriptions.");
	        }

	        request.getRequestDispatcher("/views/individualPatientPrescriptions.jsp").forward(request, response);
	    }

	    	
	       
	}
