package com.pagecontroller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.model.Patient;
import com.model.Surgery;
import com.service.PatientProfile_DoctorViewServices;

@WebServlet("/PatientProfile_DoctorView")
public class PatientProfile_DoctorView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // prevent creating new session unnecessarily
        String userRole = (session != null) ? (String) session.getAttribute("role") : null;
        Integer currentUserId = (session != null) ? (Integer) session.getAttribute("uid") : null;

        // Check for doctor role
        //need to be remove
        if (!"doctor".equals(userRole)) {
            request.setAttribute("errorMessage", "Unauthorized access.");
            request.getRequestDispatcher("views/patientProfile-doctorView.jsp").forward(request, response);
            return;
        }

        // Retrieve and validate patientId
        String patientIdParam = request.getParameter("patientId");
        if (patientIdParam == null || patientIdParam.isEmpty()) {
            request.setAttribute("errorMessage", "Missing patient ID.");
            request.getRequestDispatcher("views/patientProfile-doctorView.jsp").forward(request, response);
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdParam);
            request.setAttribute("patientId", patientId);//new
            // Fetch patient details from service
            Patient patient = PatientProfile_DoctorViewServices.getPatientDetailsById(patientId);

            if (patient != null) {
                request.setAttribute("patient", patient); // use 'user' to match your JSP
            } else {
                request.setAttribute("errorMessage", "Patient not found.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid patient ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred while fetching patient data.");
        }

        // Forward to JSP page
        request.getRequestDispatcher("views/patientProfile-doctorView.jsp").forward(request, response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
		int doctorId =(int) session.getAttribute("uid");


        try {
        	//lab report related work
            String labReportName = request.getParameter("name");
            String patientIdParam = request.getParameter("patientId");

            if (labReportName != null && !labReportName.isEmpty()) {
                int patientId = Integer.parseInt(patientIdParam);

                boolean isSuccess = PatientProfile_DoctorViewServices.InsertLabReport(labReportName, doctorId, patientId);

                if (isSuccess) {
                    response.sendRedirect("LabReport?success=" + URLEncoder.encode("Lab report requested successfully.", "UTF-8") + "&patientId=" + patientId);
                } else {
                    response.sendRedirect("PatientProfile_DoctorView?error=" + URLEncoder.encode("Failed to request lab report.", "UTF-8") + "&patientId=" + patientId);
                }
                return; 
            }
        	
        	
        	
        	
        	//surgery related work
        	int patientId = Integer.parseInt(request.getParameter("patientId"));
            String name = request.getParameter("name");
            String dateStr = request.getParameter("date");
            String timeStr = request.getParameter("time");
            
    
    		
    		java.sql.Date date = java.sql.Date.valueOf(dateStr);
            java.sql.Time time = java.sql.Time.valueOf(timeStr);

            Surgery surgery = new Surgery();
            surgery.setPatientId(patientId);
            surgery.setName(name);
            surgery.setDate(date);
            surgery.setTime(time);
            surgery.setCompletionStatus("scheduled");
            surgery.setAcceptanceStatus("pending");
            
            boolean isSuccess = PatientProfile_DoctorViewServices.InsertSurgery(surgery, doctorId);

            if (isSuccess) {
            	System.out.println("Surgery scheduled successfully.");
                response.sendRedirect("Surgeries?success=" + URLEncoder.encode("Surgery scheduled successfully.", "UTF-8"));
            } else {
                response.sendRedirect("Surgeries?error=" + URLEncoder.encode("Failed to schedule surgery.", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Surgeries?error=" + URLEncoder.encode("An error occurred while processing your request.", "UTF-8"));
        }
    }
    
    

 
}
