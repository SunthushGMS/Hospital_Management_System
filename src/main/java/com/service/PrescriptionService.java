package com.service;

import com.model.Drug;
import com.model.Prescription;
import com.utill.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PrescriptionService {

	public static int insertPrescription(Prescription prescription) {
	    int generatedId = -1;

	    try {
	        Connection con = DBConnection.getConnection();
	        String query = "INSERT INTO prescription (date_of_issue, dietary_advice, doctors_notes, doctor_id, patient_id) VALUES (?, ?, ?, ?, ?)";
	        
	        PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	        pstmt.setDate(1, prescription.getDate_of_issue());
	        pstmt.setString(2, prescription.getDietary_advice());
	        pstmt.setString(3, prescription.getDoctors_notes());
	        pstmt.setInt(4, prescription.getDoctor_id());
	        pstmt.setInt(5, prescription.getPatient_id());

	        int result = pstmt.executeUpdate();

	        if (result > 0) {
	            ResultSet rs = pstmt.getGeneratedKeys();
	            if (rs.next()) {
	                generatedId = rs.getInt(1);
	            }
	            rs.close();
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return generatedId;
	}


	public static void insertDrug(Drug drug, int prescriptionId) {
	    String sql = "INSERT INTO drug (drug_name, dosage, frequency, duration, instruction, prescription_id) VALUES (?, ?, ?, ?, ?, ?)";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, drug.getDrugName());
	        ps.setString(2, drug.getDosage());
	        ps.setString(3, drug.getFrequency());
	        ps.setString(4, drug.getDuration());
	        ps.setString(5, drug.getInstruction());
	        ps.setInt(6, prescriptionId);

	        ps.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

    public void finalizePrescription(int prescriptionId, String dietaryAdvice, String doctorNotes) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "UPDATE prescription SET dietary_advice = ?, doctor_notes = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, dietaryAdvice);
            stmt.setString(2, doctorNotes);
            stmt.setInt(3, prescriptionId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
