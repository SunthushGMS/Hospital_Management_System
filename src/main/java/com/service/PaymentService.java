package com.service;

import java.sql.Connection;
import java.sql.Statement;

import com.model.Payment;
import com.utill.DBConnection;

public class PaymentService {

public static boolean makePayment(Payment payment) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "INSERT INTO paymentMake (payID, fullname, patientID,  phone, email, service, amount) \n"
					+ "VALUES \n"
					+ "('"+payment.getId()+"', '"+payment.getFullName()+"','"+payment.getPatientId()+"', '"+payment.getPhone()+"', '"+payment.getEmail()+"', '"+payment.getService()+"', '"+payment.getAmount()+"');";
			
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
