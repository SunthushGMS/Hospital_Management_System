package com.pagecontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DoctorsInfo")
public class DoctorsInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Optionally you can load doctors dynamically and add them to request
        // For now, just forward to your JSP page
        request.getRequestDispatcher("views/DoctorsInfo.jsp").forward(request, response);
    }
}
