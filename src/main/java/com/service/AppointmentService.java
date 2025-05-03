package com.service;

import java.sql.Connection;
import java.sql.Statement;

import com.model.Appointment;
import com.utill.DBConnection;

public class AppointmentService {
	
public static boolean insertAppointment(Appointment api) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "INSERT INTO User (username, password, fullname, bio, dateofbirth, email, phone_no, address, language, profilepiclink, role) \n"
					+ "VALUES \n"
					+ "('"+api.getAge()+"', '"+api.getDoctorName()+"', '"+api.getAge()+"', '', '', '/img/test.jpg', 'patient');";
			
			int success = stmt.executeUpdate(query);
			
			if(success == 0) {
				System.out.println("Case Wagey 1!");
				con.close();
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Case Wagey!");
			return false;
		}
		
		return false;
		
	}

}
