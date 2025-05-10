package com.service;

import com.model.Drug;
import com.model.Prescription;
import com.utill.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PrescriptionService {

    // Insert a prescription and return the generated ID
    public static int insertPrescription(Prescription prescription) {
        int generatedId = -1;
        String query = "INSERT INTO prescription (date_of_issue, dietary_advice, doctors_notes, doctor_id, patient_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setDate(1, prescription.getDate_of_issue());
            pstmt.setString(2, prescription.getDietary_advice());
            pstmt.setString(3, prescription.getDoctors_notes());
            pstmt.setInt(4, prescription.getDoctor_id());
            pstmt.setInt(5, prescription.getPatient_id());

            int result = pstmt.executeUpdate();

            if (result > 0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("Error inserting prescription: " + e.getMessage());
        }

        return generatedId;
    }

    // Insert a drug associated with a prescription
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
            System.err.println("Error inserting drug: " + e.getMessage());
        }
    }

    // Update dietary advice and doctor's notes
    public static void finalizePrescription(int prescriptionId, String dietaryAdvice, String doctorNotes) {
        String sql = "UPDATE prescription SET dietary_advice = ?, doctors_notes = ? WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, dietaryAdvice);
            ps.setString(2, doctorNotes);
            ps.setInt(3, prescriptionId);

            ps.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating prescription: " + e.getMessage());
        }
    }

    // Get a prescription by ID
    public static Prescription getPrescriptionById(int id) {
        Prescription prescription = null;
        String sql = "SELECT *\n"
                + "FROM prescription\n"
                + "WHERE patient_id = ?\n"
                + "ORDER BY id DESC\n"
                + "LIMIT 1;";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                prescription = new Prescription(
                    rs.getInt("id"),
                    rs.getDate("date_of_issue"),
                    rs.getString("dietary_advice"),
                    rs.getString("doctors_notes"),
                    rs.getInt("doctor_id"),
                    rs.getInt("patient_id")
                );
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving prescription: " + e.getMessage());
        }

        return prescription;
    }

    // Get all drugs for a given prescription ID
    public static List<Drug> getDrugsByPrescriptionId(int prescriptionId) {
        List<Drug> drugList = new ArrayList<>();
        String sql = "SELECT * FROM drug WHERE prescription_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, prescriptionId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Drug drug = new Drug();
                drug.setDrugName(rs.getString("drug_name"));
                drug.setDosage(rs.getString("dosage"));
                drug.setFrequency(rs.getString("frequency"));
                drug.setDuration(rs.getString("duration"));
                drug.setInstruction(rs.getString("instruction"));
                drugList.add(drug);
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving drugs: " + e.getMessage());
        }

        return drugList;
    }
}
