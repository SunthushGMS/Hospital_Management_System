package com.service;

import com.model.Drug;
import com.model.Prescription;

import java.sql.*;

public class PrescriptionService {
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/YOUR_DB_NAME";
    private final String USER = "root";
    private final String PASSWORD = "";

    public int createPrescription(Prescription prescription) {
        int generatedId = -1;
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD)) {
            String sql = "INSERT INTO prescription (date_of_issue, dietary_advice, doctors_notes, doctor_id, patient_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setDate(1, prescription.getDate_of_issue());
            stmt.setString(2, prescription.getDietary_advice());
            stmt.setString(3, prescription.getDoctors_notes());
            stmt.setInt(4, prescription.getDoctor_id());
            stmt.setInt(5, prescription.getPatient_id());

            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    public void addDrugToPrescription(int prescriptionId, Drug drug) {
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD)) {
            // Insert drug first if not already stored (optional logic)
            String drugSql = "INSERT INTO drug (drugName, dosage, frequency, duration, instruction) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement drugStmt = conn.prepareStatement(drugSql, Statement.RETURN_GENERATED_KEYS);
            drugStmt.setString(1, drug.getDrugName());
            drugStmt.setString(2, drug.getDosage());
            drugStmt.setString(3, drug.getFrequency());
            drugStmt.setString(4, drug.getDuration());
            drugStmt.setString(5, drug.getInstruction());
            drugStmt.executeUpdate();

            ResultSet rs = drugStmt.getGeneratedKeys();
            int drugId = -1;
            if (rs.next()) {
                drugId = rs.getInt(1);
            }

            String linkSql = "INSERT INTO drugprescription (prescription_id, drug_id) VALUES (?, ?)";
            PreparedStatement linkStmt = conn.prepareStatement(linkSql);
            linkStmt.setInt(1, prescriptionId);
            linkStmt.setInt(2, drugId);
            linkStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
