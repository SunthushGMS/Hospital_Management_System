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
    
    
    
    
    
    
    
    public static List<Prescription> getPrescriptionsByDoctorId(int doctorId) {
        List<Prescription> prescriptions = new ArrayList<>();

        String sql = "SELECT * FROM prescription WHERE doctor_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Prescription prescription = new Prescription(
                    rs.getInt("id"),
                    rs.getDate("date_of_issue"),
                    rs.getString("dietary_advice"),
                    rs.getString("doctors_notes"),
                    rs.getInt("doctor_id"),
                    rs.getInt("patient_id")
                );

                prescriptions.add(prescription);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching prescriptions: " + e.getMessage());
            e.printStackTrace();
        }

        return prescriptions;
    }
    
    
    
    
    
    
    
    
    public static List<Prescription> getPrescriptionsByDoctorAndPatient(int doctorId, int patientId) {
        List<Prescription> prescriptions = new ArrayList<>();

        String sql = "SELECT * FROM prescription WHERE doctor_id = ? AND patient_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, doctorId);
            ps.setInt(2, patientId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Prescription prescription = new Prescription(
                    rs.getInt("id"),
                    rs.getDate("date_of_issue"),
                    rs.getString("dietary_advice"),
                    rs.getString("doctors_notes"),
                    rs.getInt("doctor_id"),
                    rs.getInt("patient_id")
                );

                prescriptions.add(prescription);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching prescriptions: " + e.getMessage());
            e.printStackTrace();
        }

        return prescriptions;
    }


    
    
    
    
    
    
    
    public static List<Drug> getAllDrugsByDoctorId(int doctorId) {
        List<Drug> drugs = new ArrayList<>();

        String sql = "SELECT d.*, p.id AS prescription_id " +
                     "FROM drug d " +
                     "JOIN prescription p ON d.prescription_id = p.id " +
                     "WHERE p.doctor_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Drug drug = new Drug();
                drug.setDrugId(rs.getInt("drug_id"));
                drug.setDrugName(rs.getString("drug_name"));
                drug.setDosage(rs.getString("dosage"));
                drug.setFrequency(rs.getString("frequency"));
                drug.setDuration(rs.getString("duration"));
                drug.setInstruction(rs.getString("instruction"));
                drug.setPrescriptionId(rs.getInt("prescription_id"));
                drugs.add(drug);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching drugs for doctor ID: " + e.getMessage());
            e.printStackTrace();
        }

        return drugs;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 // Get a prescription by its ID (not by patient ID)
    public static Prescription getPrescriptionByPrescriptionId(int id) {
        Prescription prescription = null;
        String sql = "SELECT * FROM prescription WHERE id = ?";

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
                    rs.getInt("doctor_id"),     // Keep this if needed internally
                    rs.getInt("patient_id")
                );
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving prescription: " + e.getMessage());
        }

        return prescription;
    }

    
    
    
    

        public static void updatePrescription(Prescription prescription) throws Exception {
        	System.out.println("Updating Prescription: " + prescription.getId() + ", Date: " + prescription.getDate_of_issue());

            String sql = "UPDATE prescription SET  dietary_advice = ?, doctors_notes = ? WHERE id = ?";
            try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, prescription.getDietary_advice());
                ps.setString(2, prescription.getDoctors_notes());
                ps.setInt(3, prescription.getId());
                ps.executeUpdate();
            }
        }
        
        
        
        public static void updateDrugs(List<Drug> drugs) throws Exception {
            String sql = "UPDATE drug SET drug_name = ?, dosage = ?, frequency = ?, duration = ?, instruction = ? WHERE id = ?";
            try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
                for (Drug drug : drugs) {
                	System.out.println("Updating drug ID: " + drug.getDrugId() + ", Name: " + drug.getDrugName());
                    ps.setString(1, drug.getDrugName());
                    ps.setString(2, drug.getDosage());
                    ps.setString(3, drug.getFrequency());
                    ps.setString(4, drug.getDuration());
                    ps.setString(5, drug.getInstruction());
                    ps.setInt(6, drug.getDrugId());
                    ps.addBatch();
                }
                ps.executeBatch();
            }
        }
    
        
        
   
        
        
        
        
        
        // Function to update Prescription and Drugs
        public void updatePrescriptionAndDrugs(int prescriptionId, Prescription updatedPrescription, List<Drug> updatedDrugs) throws SQLException {
            // Update Prescription
        	 System.out.println("inside function...");
            String updatePrescriptionQuery = "UPDATE prescription SET  dietary_advice = ?, doctors_notes = ? WHERE id = ?";
            try (Connection con = DBConnection.getConnection(); 
                 PreparedStatement pst = con.prepareStatement(updatePrescriptionQuery)) {
                pst.setString(1, updatedPrescription.getDietary_advice());
                pst.setString(2, updatedPrescription.getDoctors_notes());
                pst.setInt(3, prescriptionId); 
                pst.executeUpdate();
            }

            // Update Drugs for the given Prescription ID
            String updateDrugQuery = "UPDATE drug SET drug_name = ?, dosage = ?, frequency = ?, duration = ?, instruction = ? WHERE prescription_id = ?";
            try (Connection con = DBConnection.getConnection(); 
                 PreparedStatement pst = con.prepareStatement(updateDrugQuery)) {
                for (Drug drug : updatedDrugs) {
                    pst.setString(1, drug.getDrugName());
                    pst.setString(2, drug.getDosage());
                    pst.setString(3, drug.getFrequency());
                    pst.setString(4, drug.getDuration());
                    pst.setString(5, drug.getInstruction());
                    pst.setInt(6, prescriptionId);
                    pst.addBatch(); // Add to batch to update multiple drugs in a single operation
                }
                pst.executeBatch(); // Execute the batch update for all drugs
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        public boolean deletePrescriptionWithDrugs(int prescriptionId) {
            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                conn = DBConnection.getConnection(); // You can have a separate DBUtil class to manage connections
                conn.setAutoCommit(false); // Start transaction

                // Step 1: Delete drugs
                String deleteDrugsSQL = "DELETE FROM drug WHERE prescription_id = ?";
                stmt = conn.prepareStatement(deleteDrugsSQL);
                stmt.setInt(1, prescriptionId);
                stmt.executeUpdate();
                stmt.close();

                // Step 2: Delete prescription
                String deletePrescriptionSQL = "DELETE FROM prescription WHERE id = ?";
                stmt = conn.prepareStatement(deletePrescriptionSQL);
                stmt.setInt(1, prescriptionId);
                stmt.executeUpdate();

                conn.commit();
                return true;

            } catch (SQLException e) {
                e.printStackTrace();
                if (conn != null) {
                    try {
                        conn.rollback();
                    } catch (SQLException rollbackEx) {
                        rollbackEx.printStackTrace();
                    }
                }
                return false;
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException closeEx) {
                    closeEx.printStackTrace();
                }
            }
        }
    
    
    
    
    
    


}
