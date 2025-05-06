package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

import com.model.Surgery;
import com.utill.DBConnection;

public class SurgeryService {
    public static boolean addSurgery(Surgery surgery, int doctorId) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement surgeryStmt = null;
        PreparedStatement recommendStmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();

            // Insert into surgery table
            String insertSurgerySQL = "INSERT INTO surgery (name, date, time, completion_status, acceptance_status) VALUES (?, ?, ?, 'Pending', 'Pending')";
            surgeryStmt = conn.prepareStatement(insertSurgerySQL, Statement.RETURN_GENERATED_KEYS);
            surgeryStmt.setString(1, surgery.getName());
            surgeryStmt.setString(2, surgery.getDate());
            surgeryStmt.setString(3, surgery.getTime());

            int affectedRows = surgeryStmt.executeUpdate();

            if (affectedRows > 0) {
                rs = surgeryStmt.getGeneratedKeys();
                if (rs.next()) {
                    int surgeryId = rs.getInt(1);

                    // Insert into surgery_recommendations table
                    String insertRecommendSQL = "INSERT INTO surgery_recommendations (surgery_id, doctor_id) VALUES (?, ?)";
                    recommendStmt = conn.prepareStatement(insertRecommendSQL);
                    recommendStmt.setInt(1, surgeryId);
                    recommendStmt.setInt(2, doctorId);

                    int recommendRows = recommendStmt.executeUpdate();
                    success = recommendRows > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (surgeryStmt != null) surgeryStmt.close(); } catch (Exception e) {}
            try { if (recommendStmt != null) recommendStmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }

        return success;
    }
}
