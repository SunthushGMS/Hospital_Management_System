package com.pagecontroller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.model.Prescription;
import com.model.Drug;
import com.service.PrescriptionService;

@WebServlet("/ShowPrescription")
public class ShowPrescription extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("uid") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String idParam = request.getParameter("id");

            if (idParam != null && !idParam.trim().isEmpty()) {
                try {
                    int prescriptionId = Integer.parseInt(idParam);

                    Prescription prescription = PrescriptionService.getPrescriptionById(prescriptionId);
                    List<Drug> drugList = PrescriptionService.getDrugsByPrescriptionId(prescriptionId);

                    if (prescription != null) {
                        request.setAttribute("prescription", prescription);
                        request.setAttribute("drugList", drugList);
                    } else {
                        request.setAttribute("error", "Prescription not found.");
                    }

                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid prescription ID format.");
                }

            } else {
                request.setAttribute("error", "Prescription ID is missing.");
            }

            // Handle success/error messages (optional)
            String success = request.getParameter("success");
            String error = request.getParameter("error");

            if (success != null) {
                request.setAttribute("success", success);
            }
            if (error != null) {
                request.setAttribute("error", error);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while loading the prescription.");
        }

        request.getRequestDispatcher("views/ShowPrescription.jsp").forward(request, response);
    }
}
