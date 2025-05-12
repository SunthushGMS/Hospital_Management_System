package com.pagecontroller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.model.Prescription;
import com.model.Drug;
import com.service.PrescriptionService;

@WebServlet("/ViewPrescription")
public class ViewPrescription extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            int currentUserid = (int) session.getAttribute("uid");

            // Step 1: Get all prescriptions for this doctor
            List<Prescription> prescriptions = PrescriptionService.getPrescriptionsByDoctorId(currentUserid);
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
            request.setAttribute("error", "An error occurred while loading prescriptions.");
        }

        request.getRequestDispatcher("/views/viewPrescription.jsp").forward(request, response);
    }


    	
    	
       
}
