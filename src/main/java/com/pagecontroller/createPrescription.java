package com.pagecontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class createPrescription
 */
@WebServlet("/createPrescription")
public class createPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String patientId = request.getParameter("patientId");
		String prescriptionId = request.getParameter("prescriptionid");
		if(patientId != null) {
			request.setAttribute("patientId", patientId);
		}
		else if(prescriptionId != null) {
			request.setAttribute("prescriptionId", prescriptionId);
		}
		request.getRequestDispatcher("views/createPrescription.jsp").forward(request, response);
	}

}
