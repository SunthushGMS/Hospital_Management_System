package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.model.Patient;
import com.model.Surgery;
import com.model.EmergencyPatients;
import com.utill.DBConnection;

public class PatientProfile_DoctorViewServices {
	
	private static DBConnection database = DBConnection.getInstance();
	
	public static Patient getPatientDetailsById(int id) {
	    Patient patient = null;

	    try {
	        Connection con = database.getConnection();
	        String query = "SELECT " +
	                "u.uid AS user_id, u.username, u.fullname, u.bio, u.dateofbirth, u.email, u.phone_no, " +
	                "u.address, u.language, u.profilepiclink, " +
	                "p.bloodtype, p.gender, p.allergies, p.med_history, p.notes, p.genetic_predispositions " +
	                "FROM User u " +
	                "JOIN Patient p ON u.uid = p.user_id " +
	                "WHERE u.uid = ?";

	        PreparedStatement stmt = con.prepareStatement(query);
	        stmt.setInt(1, id);

	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
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
	            String medHistory = rs.getString("med_history");
	            String notes = rs.getString("notes");
	            String genetics = rs.getString("genetic_predispositions");

	            patient = new Patient(uid, username, "", fullname, bio, dob, email, phone, address, language, profilepic,
	                    "patient", bloodtype, gender, allergies, medHistory, genetics, notes);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return patient;
	}
	
	
	
	public static boolean insertEmergencyPatient(EmergencyPatients patient) {
	    Connection conn = null;
	    PreparedStatement stmt = null;

	    try {
	        // Get database connection
	        conn = database.getConnection();

	        // SQL insert statement
	        String insertSQL = "INSERT INTO Emergency_Patient (severity, problem, description, doctor_id, patient_id) VALUES (?, ?, ?, ?, ?)";

	        // Prepare the statement
	        stmt = conn.prepareStatement(insertSQL);
	        stmt.setString(1, patient.getSeverity());
	        stmt.setString(2, patient.getProblem());
	        stmt.setString(3, patient.getDescription());
	        stmt.setInt(4, patient.getDoctor_id());
	        stmt.setInt(5, patient.getPatient_id());

	        // Execute the insert
	        int rowsAffected = stmt.executeUpdate();
	        return rowsAffected > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        // Close resources
	        try {
	            if (stmt != null) stmt.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        try {
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}

	
	    public static boolean InsertSurgery(Surgery surgery, int doctorId) {
	        Connection conn = null;
	        PreparedStatement surgeryStmt = null;
	        PreparedStatement recommendStmt = null;
	        ResultSet rs = null;

	        try {
	            conn = database.getConnection();

	            // Insert into surgery table with default statuses
	            String insertSurgerySQL = "INSERT INTO surgery (name, date, time, completion_status, acceptance_status, patient_id) " +
	                                      "VALUES (?, ?, ?, 'scheduled', 'pending', ?)";
	            surgeryStmt = conn.prepareStatement(insertSurgerySQL, Statement.RETURN_GENERATED_KEYS);
	            surgeryStmt.setString(1, surgery.getName());
	            surgeryStmt.setDate(2, surgery.getDate());
	            surgeryStmt.setTime(3, surgery.getTime());
	            surgeryStmt.setInt(4, surgery.getPatientId());

	            int success = surgeryStmt.executeUpdate();

	            if (success > 0) {
	                rs = surgeryStmt.getGeneratedKeys();
	                if (rs.next()) {
	                    int surgeryId = rs.getInt(1);

	                    // Insert into surgery_recommendations
	                    String insertRecommendSQL = "INSERT INTO surgery_recommendations (surgery_id, doctor_id) VALUES (?, ?)";
	                    recommendStmt = conn.prepareStatement(insertRecommendSQL);
	                    recommendStmt.setInt(1, surgeryId);
	                    recommendStmt.setInt(2, doctorId);
	                    recommendStmt.executeUpdate();
	                    return true;
	                }
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        } finally {
	            try { if (rs != null) rs.close(); } catch (Exception e) {}
	            try { if (surgeryStmt != null) surgeryStmt.close(); } catch (Exception e) {}
	            try { if (recommendStmt != null) recommendStmt.close(); } catch (Exception e) {}
	            try { if (conn != null) conn.close(); } catch (Exception e) {}
	        }
	        return false;
	    }
	


	    
	    
	    
	    public static boolean InsertLabReport(String name, int doctorId, int patientId) {
	        Connection conn = null;
	        PreparedStatement labReportStmt = null;
	        PreparedStatement requestStmt = null;
	        ResultSet rs = null;

	        try {
	            conn = database.getConnection();

	            // Insert into Lab_Report table
	            String insertLabSQL = "INSERT INTO Lab_Report (name, patient_id, doctor_id) VALUES (?, ?, ?)";
	            labReportStmt = conn.prepareStatement(insertLabSQL, Statement.RETURN_GENERATED_KEYS);
	            labReportStmt.setString(1, name);
	            labReportStmt.setInt(2, patientId);
	            labReportStmt.setInt(3, doctorId);

	            int success = labReportStmt.executeUpdate();

	            if (success > 0) {
	                rs = labReportStmt.getGeneratedKeys();
	                if (rs.next()) {
	                    int labReportId = rs.getInt(1);

	                    // Insert into Request_Labreport
	                    String insertRequestSQL = "INSERT INTO Request_Labreport (labreport_id, doctor_id) VALUES (?, ?)";
	                    requestStmt = conn.prepareStatement(insertRequestSQL);
	                    requestStmt.setInt(1, labReportId);
	                    requestStmt.setInt(2, doctorId);
	                    requestStmt.executeUpdate();

	                    return true;
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        } finally {
	            try { if (rs != null) rs.close(); } catch (Exception e) {}
	            try { if (labReportStmt != null) labReportStmt.close(); } catch (Exception e) {}
	            try { if (requestStmt != null) requestStmt.close(); } catch (Exception e) {}
	            try { if (conn != null) conn.close(); } catch (Exception e) {}
	        }

	        return false;
	    }



	
	
}
