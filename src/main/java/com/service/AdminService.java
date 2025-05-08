package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.AdminAppointment;
import com.model.Doctor;
import com.model.User;
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
			
			String query = "SELECT user.uid, user.fullname, user.username, user.dateofbirth, user.email, user.phone_no, user.address, user.password, doctor.specialization " +
		               "FROM user " +
		               "JOIN doctor ON doctor.user_id = user.uid " +
		               "WHERE user.role = 'doctor'";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int uid = rs.getInt("uid");
		        String fullname = rs.getString("fullname");
		        String username = rs.getString("username");
		        String dob = rs.getString("email");
		        String email = rs.getString("email");
		        String phoneno = rs.getString("phoneno");
		        String address = rs.getString("address");
		        String password = rs.getString("password");
		        String specialization = rs.getString("specialization");
		        
				Doctor doctor = new Doctor(uid, username, password, fullname, dob, email, phoneno, address, specialization);
				doctors.add(doctor);
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return doctors;
	}
	
	public static ArrayList<User> getPatientDetails(){
		
		ArrayList<User> patients = new ArrayList<>();
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT user.uid, user.fullname \n" +
							"FROM user \n" +
							"WHERE user.role = 'patient';";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int uid = rs.getInt("uid");
				String fullname = rs.getString("fullname");
				
				User patient = new User(uid, fullname);
				patients.add(patient);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return patients;
	}
	
	public static ArrayList<AdminAppointment> getAppointmentDetails(){
		
		ArrayList<AdminAppointment> appointments = new ArrayList<>();
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT \n"
					+ "    a.id AS appointment_id,\n"
					+ "    p_user.fullname AS patient_name,\n"
					+ "    d_user.fullname AS doctor_name,\n"
					+ "    a.date\r\n"
					+ "FROM \r\n"
					+ "    Appointment a\n"
					+ "JOIN Patient p ON a.patient_id = p.user_id\n"
					+ "JOIN User p_user ON p.user_id = p_user.uid\n"
					+ "JOIN Doctor d ON a.doctor_id = d.user_id\n"
					+ "JOIN User d_user ON d.user_id = d_user.uid;";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int appointmentId = rs.getInt("appointment_id");
				String patientName = rs.getString("patient_name");
				String doctorName = rs.getString("doctor_name");
				String date = rs.getString("date");
				
				AdminAppointment appointment = new AdminAppointment(appointmentId,patientName,doctorName,date);
				appointments.add(appointment);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			return appointments;
		}
		
		return appointments;
	}
	
	
}
