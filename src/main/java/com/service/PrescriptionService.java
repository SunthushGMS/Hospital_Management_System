package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.model.Prescription;
import com.utill.DBConnection;

public class PrescriptionService {

	public static int insertSurgery(Prescription prescription) {
		int prescriptionId = -1;
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "INSERT INTO surgery(name,date, time, completionStatus, acceptanceStatus) Values ("
					+ "'"+prescription.getName()+"', '"+surgery.getDate()+"', '"+surgery.getTime()+"', '"+surgery.getDescription()+"', '"+"'unconfirmed'"+"', '"+"'active');";
			
			int success = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
			
			if(success == 0) {
				System.out.println("Surgery insert failed");
				con.close();
				return -1;
			}
			
			ResultSet rs = stmt.getGeneratedKeys();
			if(rs.next()) {
				surgeryId = rs.getInt(1);
                System.out.println("Inserted Surgery ID: " + surgeryId);

                }
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erros!");
		}
		
		return surgeryId;
		
	}
}
