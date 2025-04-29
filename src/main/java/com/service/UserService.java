package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Admin;
import com.model.Doctor;
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
	
	
	public static Patient getPatientById(int id) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT " +
	                "User.uid AS user_id, " +
	                "User.username, " +
	                "User.fullname, " +
	                "User.bio, " +
	                "User.dateofbirth, " +
	                "User.email, " +
	                "User.phone_no, " +
	                "User.address, " +
	                "User.language, " +
	                "User.profilepiclink, " +
	                "Patient.bloodtype, " +
	                "Patient.gender, " +
	                "Patient.allergies, " +
	                "Patient.med_history, " +
	                "Patient.notes, " +
	                "Patient.genetic_predispositions " +
	                "FROM User JOIN Patient ON User.uid = Patient.user_id WHERE User.uid = '"+id+"';";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				int uid = rs.getInt("user_id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String bio = rs.getString("bio");
				String dob = rs.getString("dateofbirth");
				String email = rs.getString("email");
				String phone = rs.getString("phone_no");
				String address = rs.getString("address");
				String language = rs.getString("language");
				String profilepic = rs.getString("profilepiclink");
				String bloodtype = rs.getString("bloodtype");
				String gender = rs.getString("gender");
				String allergies = rs.getString("allergies");
				String med_history = rs.getString("med_history");
				String notes = rs.getString("notes");
				String genetic_predispositions = rs.getString("genetic_predispositions");
				
				Patient patient = new Patient(uid,username,"0",fullname,bio,dob,email,phone,address,language,profilepic,"Patient",bloodtype,gender,allergies,med_history,genetic_predispositions,notes);
				con.close();
				return patient;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return null;
	}
	
	public static Doctor getDoctorById(int id) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT " +
	                "User.uid AS user_id, " +
	                "User.username, " +
	                "User.fullname, " +
	                "User.bio, " +
	                "User.dateofbirth, " +
	                "User.email, " +
	                "User.phone_no, " +
	                "User.address, " +
	                "User.language, " +
	                "User.profilepiclink, " +
	                "Doctor.publicbio, " +
	                "Doctor.specialization, " +
	                "Doctor.license_no, " +
	                "Doctor.experience " +
	                "FROM User JOIN Doctor ON User.uid = Doctor.user_id WHERE User.uid = '"+id+"';";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				int uid = rs.getInt("user_id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String bio = rs.getString("bio");
				String dob = rs.getString("dateofbirth");
				String email = rs.getString("email");
				String phone = rs.getString("phone_no");
				String address = rs.getString("address");
				String language = rs.getString("language");
				String profilepic = rs.getString("profilepiclink");
				String publicbio = rs.getString("publicbio");
				String specialization = rs.getString("specialization");
				String license_no = rs.getString("license_no");
				String experience = rs.getString("experience");
				
				Doctor doctor = new Doctor (uid,username,"0",fullname,bio,dob,email,phone,address,language,profilepic,"Doctor",specialization,license_no,experience,publicbio);
				con.close();
				return doctor;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return null;
		
	}
	
	
	public static Admin getAdminById(int id) {
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT " +
	                "User.uid AS user_id, " +
	                "User.username, " +
	                "User.fullname, " +
	                "User.bio, " +
	                "User.dateofbirth, " +
	                "User.email, " +
	                "User.phone_no, " +
	                "User.address, " +
	                "User.language, " +
	                "User.profilepiclink, " +
	                "Admin.publicbio, " +
	                "Admin.role, " +
	                "Admin.datejoined, " +
	                "Admin.access_level " +
	                "FROM User JOIN Admin ON User.uid = Admin.user_id WHERE User.uid = '"+id+"';";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				int uid = rs.getInt("user_id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				String bio = rs.getString("bio");
				String dob = rs.getString("dateofbirth");
				String email = rs.getString("email");
				String phone = rs.getString("phone_no");
				String address = rs.getString("address");
				String language = rs.getString("language");
				String profilepic = rs.getString("profilepiclink");
				String publicbio = rs.getString("publicbio");
				String role = rs.getString("role");
				String datejoined = rs.getString("datejoined");
				String accesslevel = rs.getString("access_level");
				
				Admin admin = new Admin (uid,username,"0",fullname,bio,dob,email,phone,address,language,profilepic,"Admin",role,publicbio,datejoined,accesslevel);
				con.close();
				return admin;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return null;
		
	}

	private static boolean updateUser(User user) {
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "UPDATE User SET " +
		             "email = '" + user.getEmail() + "', " +
		             "phone_no = '" + user.getPhone() + "', " +
		             "dateofbirth = '" + user.getDob() + "', " +
		             "language = '" + user.getLanguage() + "', " +
		             "address = '" + user.getAddress() + "', " +
		             "bio = '" + user.getBio() + "' " +
		             "WHERE uid = " + user.getUid() + ";";

			int success = stmt.executeUpdate(query);
			
			if(success == 0) {
				System.out.println("User Table Update Failed!");
				con.close();
				return false;
			}
			
			con.close();
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public static boolean updateDoctor(Doctor doctor) {
		User user = new User(doctor.getUid(), null, null, null, doctor.getBio(), doctor.getDob(), doctor.getEmail(), doctor.getPhone(), doctor.getAddress(), doctor.getLanguage(), null, null);
				
		if (updateUser(user)) {
			try {
				Connection con = DBConnection.getConnection();
				Statement stmt = con.createStatement();
				String query = "UPDATE Doctor SET " +
			             "publicbio = '" + doctor.getPublicbio() + "', " +
			             "specialization = '" + doctor.getSpecialization() + "', " +
			             "license_no = '" + doctor.getLicense() + "', " +
			             "experience = " + doctor.getExperience() + " " +
			             "WHERE user_id = " + doctor.getUid() + ";";

				int success = stmt.executeUpdate(query);

				if (success == 0) {
					System.out.println("Doctor Table Update Failed!");
					con.close();
					return false;
				}

				con.close();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}
	
	public static boolean updatePatient(Patient patient) {
		User user = new User(patient.getUid(), null, null, null, patient.getBio(), patient.getDob(), patient.getEmail(), patient.getPhone(), patient.getAddress(), patient.getLanguage(), null, null);
		
		if (updateUser(user)) {
			try {
				Connection con = DBConnection.getConnection();
				Statement stmt = con.createStatement();
				String query = "UPDATE Patient SET " +
			             "bloodtype = '" + patient.getBloodGroup() + "', " +
			             "gender = '" + patient.getGender() + "', " +
			             "allergies = '" + patient.getAllergies() + "', " +
			             "med_history = '" + patient.getMedicalHistory() + "', " +
			             "notes = '" + patient.getNotes() + "', " +
			             "genetic_predispositions = '" + patient.getCurrentMedication() + "' " +
			             "WHERE user_id = " + patient.getUid() + ";";

				int success = stmt.executeUpdate(query);

				if (success == 0) {
					System.out.println("Patient Table Update Failed!");
					con.close();
					return false;
				}

				con.close();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}
	
	public static boolean updateAdmin(Admin admin) {
		User user = new User(admin.getUid(), null, null, null, admin.getBio(), admin.getDob(), admin.getEmail(), admin.getPhone(), admin.getAddress(), admin.getLanguage(), null, null);
		
		if (updateUser(user)) {
			try {
				Connection con = DBConnection.getConnection();
				Statement stmt = con.createStatement();
				String query = "UPDATE Admin SET " +
			             "role = '" + admin.getRole() + "', " +
			             "access_level = '" + admin.getAccesslevel() + "', " +
			             "publicbio = '" + admin.getPublicbio() + "' " +
			             "WHERE user_id = " + admin.getUid() + ";";

				int success = stmt.executeUpdate(query);

				if (success == 0) {
					System.out.println("Admin Table Update Failed!");
					con.close();
					return false;
				}

				con.close();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;	
	}
	
	public static boolean updatePassword(int uid, String newPassword) {
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "UPDATE User SET password = '" + newPassword + "' WHERE uid = " + uid + ";";
			int success = stmt.executeUpdate(query);
			
			if(success == 0) {
				System.out.println("Password Update Failed!");
				con.close();
				return false;
			}
			
			con.close();
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public static boolean updateProfilePic(int uid, String newProfilePic) {
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "UPDATE User SET profilepiclink = '" + newProfilePic + "' WHERE uid = " + uid + ";";
			int success = stmt.executeUpdate(query);
			
			if(success == 0) {
				System.out.println("Profile Picture Update Failed!");
				con.close();
				return false;
			}
			
			con.close();
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public static boolean deleteUser(int uid) {
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "DELETE FROM User WHERE uid = " + uid + ";";
			int success = stmt.executeUpdate(query);
			
			if(success == 0) {
				System.out.println("User Deletion Failed!");
				con.close();
				return false;
			}
			
			con.close();
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
