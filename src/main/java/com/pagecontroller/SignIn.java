package com.pagecontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Signin")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = request.getParameter("error");
		if(error != null) {
			request.setAttribute("error", error);
		}
		request.getRequestDispatcher("views/signIn.jsp").forward(request, response);
	}

}