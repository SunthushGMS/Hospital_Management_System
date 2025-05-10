package com.controller;

import com.model.Patient;
import com.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/viewPatient")
public class ViewPatientServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int patientId = Integer.parseInt(idParam);
                Patient patient = UserService.getPatientById(patientId);

                if (patient != null) {
                    request.setAttribute("patient", patient);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewPatient.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Patient not found.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid patient ID.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Patient ID not provided.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
