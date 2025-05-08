package com.service;

import java.sql.*;
import com.model.Appointment;
import com.utill.DBConnection;

public class AppointmentService {

    // Insert a new appointment
    public static boolean insertAppointment(Appointment appointment) {
        String sql = "INSERT INTO appointment (doctor_id, patient_id, date, time, status) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, appointment.getDoctorId());
            ps.setInt(2, appointment.getPatientId());
            ps.setString(3, appointment.getAppointmentDate());
            ps.setString(4, appointment.getTime());
            ps.setString(5, appointment.getStatus());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); 
            return false;
        }
    }

    // Update appointment with full model object
    public static boolean updateAppointment(Appointment appointment) {
        String sql = "UPDATE appointment SET doctor_id = ?, date = ?, time = ?, status = ? WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, appointment.getDoctorId());
            ps.setString(2, appointment.getAppointmentDate());
            ps.setString(3, appointment.getTime());
            ps.setString(4, appointment.getStatus());
            ps.setInt(5, appointment.getId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update appointment for pop-up 
    public static void updateAppointment(int id, String doctorId, String date, String time) {
        String sql = "UPDATE appointment SET doctor_id = ?, date = ?, time = ?, status = 'rescheduled' WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, doctorId);
            ps.setString(2, date);
            ps.setString(3, time);
            ps.setInt(4, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete appointment by ID
    public static boolean deleteAppointment(int id) {
        String sql = "DELETE FROM appointment WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get appointment by ID
    public static Appointment getAppointmentById(int id) {
        String sql = "SELECT * FROM appointment WHERE id = ?";
        Appointment appointment = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setDoctorId(rs.getInt("doctor_id"));
                appointment.setPatientId(rs.getInt("patient_id"));
                appointment.setAppointmentDate(rs.getString("date"));
                appointment.setTime(rs.getString("time"));
                appointment.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointment;
    }
}
