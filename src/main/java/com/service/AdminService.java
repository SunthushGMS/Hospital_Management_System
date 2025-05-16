package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.AdminAppointment;
import com.model.Doctor;
import com.model.SupportRequests;
import com.model.User;
import com.utill.DBConnection;

public class AdminService {
	
	private static DBConnection database = DBConnection.getInstance();
	
	//Add a new doctor
	public static boolean addDoctor(Doctor doctor) {
		
		try {
			Connection con = database.getConnection();
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
	
	//Get Doctor details
	public static ArrayList<Doctor> getDoctorDetails(){
		
		ArrayList<Doctor> doctors = new ArrayList<>();
		
		try {
			Connection con = database.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT user.uid, user.fullname, user.username, user.dateofbirth, user.email, user.phone_no, user.address, user.password, doctor.specialization " +
		               "FROM user " +
		               "JOIN doctor ON doctor.user_id = user.uid " +
		               "WHERE user.role = 'doctor';";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int uid = rs.getInt("uid");
		        String fullname = rs.getString("fullname");
		        String username = rs.getString("username");
		        String dob = rs.getString("dateofbirth");
		        String email = rs.getString("email");
		        String phoneno = rs.getString("phone_no");
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
	
	//Get Doctor Details by ID
	public static Doctor getDoctorDetailsById(int id){
			
			Doctor doctors = null;
			
			try {
				Connection con = database.getConnection();
				Statement stmt = con.createStatement();
				
				String query = "SELECT user.uid, user.fullname, user.username, user.dateofbirth, user.email, user.phone_no, user.address, user.password, doctor.specialization " +
			               "FROM user " +
			               "JOIN doctor ON doctor.user_id = user.uid " +
			               "WHERE user.uid = '"+id+"';";
				
				ResultSet rs = stmt.executeQuery(query);
				
				while(rs.next()) {
					int uid = rs.getInt("uid");
			        String fullname = rs.getString("fullname");
			        String username = rs.getString("username");
			        String dob = rs.getString("dateofbirth");
			        String email = rs.getString("email");
			        String phoneno = rs.getString("phone_no");
			        String address = rs.getString("address");
			        String password = rs.getString("password");
			        String specialization = rs.getString("specialization");
			        
					doctors = new Doctor(uid, username, password, fullname, dob, email, phoneno, address, specialization);
					
					con.close();
					return doctors;
				}
				
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			return doctors;
		}
	
	//Update Doctor Details
	public static boolean updateDoctorDetailsById(Doctor doctor) {
		
		try {
			Connection con = database.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "UPDATE user SET " +
		               "fullname = '" + doctor.getFullname() + "', " +
		               "dateofbirth = '" + doctor.getDob() + "', " +
		               "phone_no = '" + doctor.getPhone() + "', " +
		               "address = '" + doctor.getAddress() + "', " +
		               "password = '" + doctor.getPassword() + "' " +
		               "WHERE uid = '" + doctor.getUid() + "';";

			String query2 = "UPDATE doctor SET " +
		                "specialization = '" + doctor.getSpecialization() + "' " +
		                "WHERE user_id = '" + doctor.getUid() + "';";

			
			 int rs1 = stmt.executeUpdate(query);
			 int rs2 = stmt.executeUpdate(query2);
			 
			 if(rs1 == 0 && rs2 == 0) {
				 System.out.println("User Table Update Failed");
				 con.close();
				 return false;
			 }
			 
			 con.close();
			 return true;
			 
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//Get Patient Details
	public static ArrayList<User> getPatientDetails(){
		
		ArrayList<User> patients = new ArrayList<>();
		
		try {
			Connection con = database.getConnection();
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
	
	//Get Appointment Details
	public static ArrayList<AdminAppointment> getAppointmentDetails(){
		
		ArrayList<AdminAppointment> appointments = new ArrayList<>();
		
		try {
			Connection con = database.getConnection();
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
	
	//Delete Appointments
	public  static boolean deleteAppointmentById(int id) {
		
		try {
			Connection con = database.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "DELETE FROM appointment WHERE id = '"+id+"';";
			
			int success = stmt.executeUpdate(query);
			
			if(success == 0) {
				System.out.println("Apointment Delete Failed");
				con.close();
				return false;
			}
			
			con.close();
			return false;
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	//Count Total Doctors
	public static int getDoctorCount() {
		
		int count=0;
		
		try {
			Connection con = database.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT count(*) AS total " +
							"from user u " +
							"where u.role = 'doctor';";
			
			ResultSet success = stmt.executeQuery(query);
			
			while(success.next()) {
				count = success.getInt("total");
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return count;
	}
	
	//Count Total Patients
	public static int getPatientCount() {
		int count = 0;
		
		try {
			Connection con = database.getConnection();
			Statement  stmt = con.createStatement();
			
			String query = "SELECT count(*) AS total " +
							"from user u " +
							"where u.role = 'patient';";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				count = rs.getInt("total");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	//Count total appointments
	public static int getAppointmentCount() {
		
		int count = 0;
		
		try {
			Connection con = database.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT count(*) AS total " +
					"from appointment ;";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				count = rs.getInt("total");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	//Get all inquiries
	public static ArrayList<SupportRequests> getInquiries(){
		
		ArrayList<SupportRequests> inquiries = new ArrayList<>();
		
		try {
			Connection con = database.getConnection();
			Statement stmt = con.createStatement();
			
			String query = "SELECT id, name, message FROM support_requests WHERE status = 'pending';";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String message = rs.getString("message");
				
				SupportRequests requests = new SupportRequests(id, name, message);
				
				inquiries.add(requests);
				
			}
			
		}
		catch(Exception e) {
			System.out.println("Error in getting inquiries");
			e.printStackTrace();
		}
		
		return inquiries;
	}
	
}
