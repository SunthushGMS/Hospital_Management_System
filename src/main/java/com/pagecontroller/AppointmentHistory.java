package com.pagecontroller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.service.AppointmentHistoryService;
import com.model.Appointment;

@WebServlet("/AppointmentHistory")
public class AppointmentHistory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            HttpSession session = request.getSession(false);
            
            if (session == null || session.getAttribute("uid") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int currentUserId = (int) session.getAttribute("uid");

            // Fetch updated appointment data
            ArrayList<Appointment> appointments = AppointmentHistoryService.getAppointmentsByPatientId(currentUserId);
            request.setAttribute("appointments", appointments);

            // Pass success/error messages to JSP
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
            request.setAttribute("error", "Something went wrong while loading appointments.");
        }

        request.getRequestDispatcher("views/appointHistory.jsp").forward(request, response);
    }
}
