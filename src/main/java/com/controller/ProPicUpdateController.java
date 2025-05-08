package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.exceptions.ImageStoreFaildException;
import com.exceptions.ProPicUrlUpdateFailException;
import com.service.UserService;
import com.utill.ImageHandler;

@MultipartConfig
@WebServlet("/ProPicUpdateController")
public class ProPicUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("profilePic");
		String Path = "/assets/images/profilePics";
		
		HttpSession session = request.getSession(false);
		int currentUserid =(int) session.getAttribute("uid"); // get session user id
		String oldProfilepic = (String) session.getAttribute("profilepic");
		String newPropic = null;
		
		try {
			newPropic = ImageHandler.storeImage(filePart, Path, currentUserid);
			if(newPropic == null) {
				throw new ImageStoreFaildException("Image Store Faild");
			}
			boolean success = UserService.updateProfilePic(currentUserid, newPropic);
			if(success != true) {
				throw new ProPicUrlUpdateFailException("DB Update Failed");
			}
			session.setAttribute("profilepic", newPropic); //update session
			ImageHandler.deleteImage(Path, oldProfilepic); //delete old propic
			
		}catch(Exception e) {
			e.printStackTrace();
			String message = "Error Occured When Updating Profile Picture";
			response.sendRedirect("userprofile?error=" + message);
			return;
		}
		finally {
			String message = "Profile Picture Updated Successfully.";
			response.sendRedirect("userprofile?success=" + message);
		}
		
	}

}
