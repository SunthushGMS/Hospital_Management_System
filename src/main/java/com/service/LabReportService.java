package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.model.LabReport;
import com.utill.DBConnection;

public class LabReportService {
	
	private static DBConnection database = DBConnection.getInstance();

    public static boolean uploadLabReport(LabReport report) {
        boolean result = false;

        try {
            Connection con = database.getConnection();

            String query = "INSERT INTO lab_report (name, department, document, summary, description, patient_id, doctor_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, report.getName());
            ps.setString(2, report.getDepartment());
            ps.setBlob(3, report.getDocument());
            ps.setString(4, report.getSummary());
            ps.setString(5, report.getDescription());
            ps.setInt(6, report.getPatientId());
            ps.setInt(7, report.getDoctorId());

            int success = ps.executeUpdate();

            if (success > 0) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
