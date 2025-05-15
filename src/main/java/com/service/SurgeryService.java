package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

import com.model.Surgery;
import com.utill.DBConnection;

public class SurgeryService {
	
	private static DBConnection database = DBConnection.getInstance();
	
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

}
