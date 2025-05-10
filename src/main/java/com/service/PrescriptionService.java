package com.service;

import com.model.Prescription;
import com.utill.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PrescriptionService {

	public static boolean insertPrescription(Prescription prescription) {
        try {
            Connection con = DBConnection.getConnection();
            String query = "INSERT INTO prescription (date_of_issue, dietary_advice, doctors_notes, doctor_id, patient_id) VALUES (?, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setDate(1, prescription.getDate_of_issue());
            pstmt.setString(2, prescription.getDietary_advice());
            pstmt.setString(3, prescription.getDoctors_notes());
            pstmt.setInt(4, prescription.getDoctor_id());
            pstmt.setInt(5, prescription.getPatient_id());

            int result = pstmt.executeUpdate();
            con.close();
            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addDrugToPrescription(int prescriptionId, String drugName, String dosage, String frequency, String duration, String instruction) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO drug (prescription_id, drug_name, dosage, frequency, duration, instruction) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, prescriptionId);
            stmt.setString(2, drugName);
            stmt.setString(3, dosage);
            stmt.setString(4, frequency);
            stmt.setString(5, duration);
            stmt.setString(6, instruction);
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
