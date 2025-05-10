//By Moditha
package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = {"/views/Doctordashboard.jsp", "/views/createPrescription.jsp","/views/appointments.jsp", "/views/surgeries.jsp", "/views/labReports.jsp", "/doctorDashboard", "/Appointments", "/Surgeries", "/LabReports", "/createPrescription"}) // Protect these routes
public class DoctorFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        String role = (String) session.getAttribute("role");
        
        if (session != null && "doctor".equals(role)) {
        	chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/");
        }
    }
}

