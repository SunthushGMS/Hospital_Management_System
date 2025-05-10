//By Moditha
package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = {"/views/ShowPrescription.jsp", "/views/userProfile.jsp", "/views/patient.jsp", "/views/appointHistory.jsp", "/AppointmentHistory", "/userprofile", "/Patient", "/ShowPrescription"}) // Protect these routes
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        if (session == null || session.getAttribute("uid") == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Signin");
        } else {
            chain.doFilter(request, response);
        }
    }
}

//tested and working well