package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.Doctor;
import com.utill.DBConnection;

public class AdminService {
	
	public static boolean addDoctor(Doctor doctor) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "INSERT INTO User (username, password, fullname, bio, dateofbirth, email, phone_no, address, language, profilepiclink, role) \n"
					+ "VALUES \n"
					+ "('"+doctor.getUsername()+"', '"+doctor.getPassword()+"', '"+doctor.getFullname()+"', '',  '"+doctor.getDob()+"', '"+doctor.getEmail()+"', '"+doctor.getPhone()+"', '"+doctor.getAddress()+"', '', 'testimg.jpeg', 'doctor');";
			
			int success = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
			
			if(success == 0) {
				System.out.println("Data Added Successcully");
				con.close();
				return false;
			}
			
			ResultSet rs = stmt.getGeneratedKeys();
			
			if(rs.next()) {
				int uid = rs.getInt(1);
				query = "INSERT INTO doctor(user_id, specialization) VALUES('"+uid+"', '"+doctor.getSpecialization()+"');";
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
	
	public static ArrayList<Doctor> getDoctorDetails(){
		
		ArrayList<Doctor> doctors = new ArrayList<>();
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT u.uid, u.fullname, d.specialization " +
		               "FROM user u " +
		               "JOIN doctor d ON d.user_id = u.uid " +
		               "WHERE u.role = 'doctor'";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int uid = rs.getInt("uid");
		        String fullname = rs.getString("fullname");
		        String specialization = rs.getString("specialization");
				
				Doctor doctor = new Doctor(uid,fullname,specialization);
				doctors.add(doctor);
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return doctors;
	}
	
	
	
}
