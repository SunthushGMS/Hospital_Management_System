package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.model.EmergencyPatients;
import com.utill.DBConnection;

public class EmergencyPatientServices {
    public static boolean insertEmergencyPatient(EmergencyPatients patient) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();

            // Insert into Emergency_Patient table
            String insertSQL = "INSERT INTO Emergency_Patient (severity, problem, description, doctor_id) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertSQL);
            stmt.setString(1, patient.getSeverity());
            stmt.setString(2, patient.getProblem());
            stmt.setString(3, patient.getDescription());
            stmt.setInt(4, patient.getDoctor_id());

            int success = stmt.executeUpdate();
            return success > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
