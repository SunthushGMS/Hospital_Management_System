package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Patient;
import com.model.User;
import com.utill.DBConnection;

public class UserService {
	
	public static User getUserByUsername(String username) {
		
		User user = null;
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM User WHERE username = '" + username + "' LIMIT 1";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				int uid = rs.getInt("uid");
				String uname = rs.getString("username");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String bio = rs.getString("bio");
				String dob = rs.getString("dateofbirth");
				String email = rs.getString("email");
				String phone = rs.getString("phone_no");
				String address = rs.getString("address");
				String language = rs.getString("language");
				String profilepic = rs.getString("profilepiclink");
				String role = rs.getString("role");
				
				user = new User(uid, uname, password, fullname, bio, dob, email, phone, address, language, profilepic, role);
				
				con.close();
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return null;
	}
	
	
	public static boolean insertPatient(Patient patient) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "INSERT INTO User (username, password, fullname, bio, dateofbirth, email, phone_no, address, language, profilepiclink, role) \n"
					+ "VALUES \n"
					+ "('"+patient.getUsername()+"', '"+patient.getPassword()+"', '"+patient.getFullname()+"', '', '"+patient.getDob()+"', '"+patient.getEmail()+"', '"+patient.getPhone()+"', '"+patient.getAddress()+"', '', '/img/test.jpg', 'patient');";
			
			int success = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
			
			if(success == 0) {
				System.out.println("Case Wagey 1!");
				con.close();
				return false;
			}
			
			ResultSet rs = stmt.getGeneratedKeys();
			if(rs.next()) {
				int uid = rs.getInt(1);
				query = "INSERT INTO Patient (user_id, bloodtype, gender, allergies, med_history, notes, genetic_predispositions) VALUES ('"+uid+"', 'unknown', 'other', '', '', '', '');";
				try (Statement patientStmt = con.createStatement()) {
                    patientStmt.executeUpdate(query);
                    System.out.println("Insert successful!");
                    con.close();
                    return true;
                }
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Case Wagey!");
			return false;
		}
		
		return false;
		
	}

}
