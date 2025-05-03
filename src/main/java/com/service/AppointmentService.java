package com.service;

import java.sql.Connection;
import java.sql.Statement;

import com.model.Appointment;
import com.utill.DBConnection;

public class AppointmentService {
	
public static boolean insertAppointment(Appointment appointment) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "INSERT INTO appointmentBooking (id, name, email, contact, age, gender, doctor, date, reason) \n"
					+ "VALUES \n"
					+ "('"+appointment.getId()+"', '"+appointment.getPatientName()+"', '"+appointment.getEmail()+"', '"+appointment.getContact()+"', '"+appointment.getAge()+"', '"+appointment.getGender()+"', '"+appointment.getDoctorName()+"', '"+appointment.getAppointmentDate()+"', '"+appointment.getReason()+"');";
			
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
