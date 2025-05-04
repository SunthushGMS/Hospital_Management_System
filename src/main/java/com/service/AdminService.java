package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.model.Doctor;
import com.utill.DBConnection;

public class AdminService {
	
	public static boolean addDoctor(Doctor doctor) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "INSERT INTO User (username, password, fullname, dateofbirth, email, phone_no, address, language, profilepiclink, role) \n"
					+ "VALUES \n"
					+ "('"+doctor.getUsername()+"', '"+doctor.getPassword()+"', '"+doctor.getFullname()+"', '"+doctor.getDob()+"', '"+doctor.getEmail()+"', '"+doctor.getPhone()+"', '"+doctor.getAddress()+"', '', '/img/test.jpg', 'doctor');";
			
			int success = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
			
			if(success == 0) {
				System.out.println("Podi Case ekak");
				con.close();
				return false;
			}
			
			ResultSet rs = stmt.getGeneratedKeys();
			
			if(rs.next()) {
				int uid = rs.getInt(1);
				query = "INSERT INTO doctor(user_id, specialization, license_no, experience) VALUES('"+uid+"', '"+doctor.getSpecialization()+"', '', '');";
				try (Statement doctorStmt = con.createStatement()){
					doctorStmt.executeUpdate(query);
					System.out.println("Insert Successfull");
					con.close();
					
					return true;
				}
			}
			
		}
		catch (Exception e){
			e.printStackTrace();
			System.out.println("Podi Case ekak");
			return false;
		}
		
		return false;
	}
}
