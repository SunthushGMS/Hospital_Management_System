//By Moditha
package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.UserService;

@WebServlet("/UpdatePasswordController")
public class UpdatePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPassword = request.getParameter("old-password");
		String newPassword = request.getParameter("new-password");
		
		HttpSession session = request.getSession(false);
		String realPwd =(String) session.getAttribute("pwd");
		int currentUserid =(int) session.getAttribute("uid");
		
		if(realPwd.equals(oldPassword)) {
			if(UserService.updatePassword(currentUserid, newPassword)) {
				session.setAttribute("pwd", newPassword);
				String message = "Password updated successfully.";
				response.sendRedirect("userprofile?success=" + message);
			} else {
				String message = "Error updating password. Please try again.";
				response.sendRedirect("userprofile?error=" + message);
			}
			
		} else {
			String message = "Old password is incorrect. try Again.";
			response.sendRedirect("userprofile?error=" + message);
		}
	}

}
